//
//  NSDictionary+CoverMimeType.m
//  GuotuServer
//
//  Created by 魏琦 on 16/9/29.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "NSDictionary+CoverMimeType.h"

@implementation NSDictionary (CoverMimeType)
+ (NSDictionary*)mimeType:(KFileMineType)mimeType{
    NSString* fileType;
    NSString* fileMimeType;
    switch (mimeType) {
        case KFileMineTypeMp3:
            fileMimeType = @"audio/mp3";
            fileType = @".mp3";
            break;
        case KFileMineTypeMp4:
            fileMimeType = @"video/mp4";
            fileType = @".mp4";
            break;
        case KFileMineTypeTXT:
            fileMimeType = @"text/plain";
            fileType = @".txt";
            break;
        case KFileMineTypePPT:
            fileMimeType = @"application/vnd.ms-powerpoint";
            fileType = @".ppt";
            break;
        case KFileMineTypeDOC:
            fileMimeType = @"application/msword";
            fileType = @".doc";
            break;
        case KFileMineTypeDOCX:
            fileMimeType = @"application/vnd.openxmlformats-officedocument.wordprocessingml.document";
            fileType = @".docx";
            break;
        case KFileMineTypeXLS:
            fileMimeType = @"application/vnd.ms-excel";
            fileType = @".xls";
            break;
        case KFileMineTypeXLSX:
            fileMimeType = @"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            fileType = @".xlsx";
            break;
        case KFileMineTypeJPG:
            fileMimeType = @"image/jpg";
            fileType = @".jpg";
            break;
        case KFileMineTypeJEPG:
            fileMimeType = @"image/jpeg";
            fileType = @".jpeg";
            break;
        case KFileMineTypeGIF:
            fileMimeType = @"image/gif";
            fileType = @".gif";
            break;
            
        case KFileMineTypePNG:
            fileMimeType = @"image/png";
            fileType = @".png";
            break;
        case KFileMineTypePPTX:
            fileMimeType = @"application/vnd.openxmlformats-officedocument.presentationml.presentation";
            fileType = @".pptx";
            break;
            
        case KFileMineTypePDF:
            fileMimeType = @"application/pdf";
            fileType = @".pdf";
            break;
        default:
            break;
    }
    
    return @{
             @"fileType":fileType,
             @"fileMimeType":fileMimeType
             };
}
@end
