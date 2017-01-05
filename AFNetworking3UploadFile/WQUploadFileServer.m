//
//  WQUploadFileServer.m
//  AFNetworking3UploadFile
//
//  Created by 魏琦 on 16/9/29.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import "WQUploadFileServer.h"
#import "NSString+DES.h"
#import "NSString+NSHash.h"
#import <AFNetworking.h>
#import "NSDictionary+CoverMimeType.h"
NSString* const KuploadFile = @"http://122.224.218.58:8080/nlc_read_file/webFileUpload.do";
NSString* const MD5Key = @"library_2016@hzlq";
NSString* const DESKey = @"app@hzlq";
@implementation WQUploadFileServer
+ (instancetype)shareInstance {
    static WQUploadFileServer* instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WQUploadFileServer alloc] init];
    });
    return instance;
}

- (AFHTTPSessionManager*)creatSessionManager {
    AFHTTPSessionManager* manager = [[AFHTTPSessionManager alloc] init];
    AFJSONResponseSerializer* responseSerilizer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    responseSerilizer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",nil];
    [manager setResponseSerializer:responseSerilizer];
    return manager;
    
}

- (RACSignal *)uploadFileWithData:(NSData*)data
                  mimeType:(KFileMineType)mimeType{
    NSDictionary* fileTypeDic = [NSDictionary mimeType:mimeType];
    NSString* fileMimeType = [fileTypeDic objectForKey:@"fileMimeType"];
    NSString* fileType = [fileTypeDic objectForKey:@"fileType"];
   return  [self customPostWithParameters:nil
                       resultClass:nil
                               url:KuploadFile
                               cmd:@"uploadFile"
                              data:data
                          mimeType:fileMimeType
                          fileType:fileType];
}

- (NSString*)appVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

- (long long)currentTimeStamp {
    NSDate *senddate = [NSDate date];
    long long timeStamp =  (long long)[senddate timeIntervalSince1970];
    return timeStamp * 1000;
}

- (NSString*)addressId {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYYMMddHHmmssSSS"];
    NSString *stringTime = [dateFormatter stringFromDate: [NSDate date]];
    NSNumber* number = [NSNumber numberWithLongLong: ([stringTime longLongValue]+random()%10)];
    NSString* longString = [number stringValue];
    return longString;
}

- (NSString*)jsonDataWithDictionary:(NSDictionary*)dic{
    NSError* err;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:0
                                                         error:&err];
    NSString* dataString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return dataString;
}

- (NSDictionary*)creatRequestDictionaryWithParameter:(NSDictionary*)parameter
                                             cmdName:(NSString*)cmd {
    NSMutableDictionary* requestDic = [[NSMutableDictionary alloc] initWithDictionary:parameter];
    long long int timeStamp = [self currentTimeStamp];
    [requestDic setObject:@(timeStamp) forKey:@"timeStamp"];
    NSString* data = [self jsonDataWithDictionary:requestDic];
    NSInteger osType = 2;
    NSInteger fromeSource = 1;
    NSString* version = [self appVersion];
    NSInteger versionCode = 10001;
    NSString* dataString = [data encryptDESWithKey:DESKey];
    NSString* hashCode = [[[NSString stringWithFormat:@"%lld",[self currentTimeStamp]] stringByAppendingString:MD5Key] MD5];
    NSDictionary* publicDic = @{
                                @"siteId":@"343",
                                @"userId":@0,
                                @"fromSource":@(fromeSource),
                                @"osType":@(osType),
                                @"version":version,
                                @"versionCode":@(versionCode),
                                @"data":dataString,
                                @"timeStamp":@(timeStamp),
                                @"hashCode":hashCode
                                };
    
    return @{
             @"cmd":cmd,
             @"value":[self jsonDataWithDictionary:publicDic]
             };
}

- (RACSignal *)customPostWithParameters:(id)parameters
                     resultClass:(Class)resultClass
                             url:(NSString *)url
                             cmd:(NSString*)cmd
                            data:(NSData*)data
                        mimeType:(NSString*)mimeType
                        fileType:(NSString*)fileType{
    NSDictionary* requestParameters = [self creatRequestDictionaryWithParameter:[parameters copy] cmdName:cmd];
    AFHTTPSessionManager* manager = [self creatSessionManager];
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *type = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", [self addressId]];
        [manager.requestSerializer setValue:type forHTTPHeaderField:@"Content-Type"];
        [manager POST:KuploadFile parameters:requestParameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            [formData appendPartWithFileData:data
                                        name:@"file"
                                    fileName:[NSString stringWithFormat:@"file%@",fileType]
                                    mimeType:mimeType];
            
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"%f",uploadProgress.fractionCompleted);
            [subscriber sendNext:[NSNumber numberWithFloat:uploadProgress.fractionCompleted]];
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            id resultObj = [responseObject objectForKey:@"returnObject"];
            [subscriber sendNext:resultObj];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendError:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return signal;
    
    
}


@end
