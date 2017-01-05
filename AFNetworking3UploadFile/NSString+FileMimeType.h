//
//  NSString+FileMimeType.h
//  AFNetworking3UploadFile
//
//  Created by 魏琦 on 16/9/29.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FileMimeType)
-(NSString *)getMIMETypeWithCAPIAtFilePath:(NSString *)path;
@end
