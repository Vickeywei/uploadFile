//
//  ViewController.m
//  AFNetworking3UploadFile
//
//  Created by 魏琦 on 16/9/29.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import "ViewController.h"
#import "WQUploadFileEnums.h"
#import "NSString+FileMimeType.h"
#import "WQUploadFileServer.h"
#import <ReactiveCocoa.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WQUploadFileServer* server = [WQUploadFileServer shareInstance];
   // UIImage* image = [UIImage imageNamed:@"test"];
   // NSData* data = UIImagePNGRepresentation(image);
    NSString* str = [[NSBundle mainBundle]pathForResource:@"GCD分享" ofType:@"pptx"];
    NSData* data = [NSData dataWithContentsOfFile:str];
    
   [[server uploadFileWithData:data mimeType:KFileMineTypePPTX] subscribeNext:^(id x) {
       NSLog(@"%@",x);
       
   } error:^(NSError *error) {
        NSLog(@"%@",error);
   }];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
