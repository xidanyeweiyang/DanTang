//
//  NSString+Base64.h
//  Cofco
//
//  Created by 刘明 on 16/7/25.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)
/**
 返回base64编码的字符串内容
 */
- (NSString *)base64encode;

/**
 返回base64解码的字符串内容
 */
- (NSString *)base64decode;

/**
 返回服务器基本授权字符串
 
 示例代码格式如下：
 
 @code
 [request setValue:[@"admin:123456" basicAuthString] forHTTPHeaderField:@"Authorization"];
 @endcode
 */
- (NSString *)basicAuthString;
@end
