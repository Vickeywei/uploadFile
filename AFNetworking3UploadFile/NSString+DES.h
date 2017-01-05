//
//  NSString+DES.h
//  JZTools
//
//  Created by jack zhou on 14-2-21.
//  Copyright (c) 2014年 JZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DES)
- (NSString *) encryptDESWithKey:(NSString *)key;
- (NSString *) decryptDESWithKey:(NSString *)key;

//为辅助旧项目编译问题，故加了如下两个方法
- (NSString *) encryptDESWithKey:(NSString *)key withenCryText:(NSString*)text;
- (NSString *) decryptDESWithKey:(NSString *)key  withenCryText:(NSString*)text;
@end
