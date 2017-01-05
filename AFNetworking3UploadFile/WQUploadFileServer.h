//
//  WQUploadFileServer.h
//  AFNetworking3UploadFile
//
//  Created by 魏琦 on 16/9/29.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WQUploadFileEnums.h"
#import <ReactiveCocoa.h>
typedef void(^successUploadFileBlock)(id object);
typedef void(^faliurUploadFileBlock)(id object);
@interface WQUploadFileServer : NSObject
+(instancetype)shareInstance;
- (RACSignal *)uploadFileWithData:(NSData*)data
                  mimeType:(KFileMineType)mimeType;



@end
