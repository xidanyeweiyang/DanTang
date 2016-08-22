//
//  LMProductDetail.h
//  DanTang
//
//  Created by 刘明 on 16/8/10.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMProductDetail : NSObject


@property (nonatomic, copy) NSString *describe;

@property (nonatomic, assign) BOOL liked;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *purchase_url;

@property (nonatomic, strong) NSArray *image_urls;

@property (nonatomic, assign) NSInteger comments_count;

@property (nonatomic, copy) NSString *detail_html;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *name;


@end
