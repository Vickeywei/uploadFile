//
//  WQUploadFileEnums.h
//  AFNetworking3UploadFile
//
//  Created by 魏琦 on 16/9/29.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#ifndef WQUploadFileEnums_h
#define WQUploadFileEnums_h
/*
 //MP3的传输方式
 //    NSString* str = [[NSBundle mainBundle] pathForResource:@"宋秉洋 - 雨天" ofType:@"mp3"];
 //    NSData* data = [NSData dataWithContentsOfFile:str];
 //    NSLog(@"%@",data);
 
 //MP4上传
 //    NSString* str = [[NSBundle mainBundle] pathForResource:@"06-往网页中添加内容(掌握)" ofType:@"mp4"];
 //    NSData* data = [NSData dataWithContentsOfFile:str];
 //TXT格式上传
 //text/txt,text/plain
 
 //pdf上传
 //application/pdf
 
 //git上传
 //image/gif
 
 //ppt上传
 //application/vnd.ms-powerpoint
 
 //docx上传
 //application/vnd.openxmlformats-officedocument.wordprocessingml.document
 
 //xlsx上传
 //application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
 
 //doc文件上传
 //application/msword
 
 //xls上传
 //application/vnd.ms-excel
 
 //pptx上传
 //application/vnd.openxmlformats-officedocument.presentationml.presentation
 */

typedef NS_ENUM(NSInteger, KFileMineType){
    KFileMineTypeMp3 = 1,
    KFileMineTypeMp4,
    KFileMineTypeTXT,
    KFileMineTypePPT,
    KFileMineTypeDOC,
    KFileMineTypeDOCX,
    KFileMineTypeXLS,
    KFileMineTypeXLSX,
    KFileMineTypeJPG,
    KFileMineTypeJEPG,
    KFileMineTypeGIF,
    KFileMineTypePNG,
    KFileMineTypePDF,
    KFileMineTypePPTX
    
};

#endif /* WQUploadFileEnums_h */
