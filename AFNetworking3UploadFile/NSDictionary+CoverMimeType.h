//
//  NSDictionary+CoverMimeType.h
//  GuotuServer
//
//  Created by 魏琦 on 16/9/29.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WQUploadFileEnums.h"
@interface NSDictionary (CoverMimeType)
+ (NSDictionary*)mimeType:(KFileMineType)mimeType;
@end
