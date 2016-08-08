//
//  LMProduct.h
//  DanTang
//
//  Created by 刘明 on 16/8/5.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMProduct : NSObject

@property (nonatomic, copy) NSString *cover_image_url;
@property (nonatomic, assign) NSInteger created_at;
@property (nonatomic, copy) NSString *describe;
@property (nonatomic, assign) NSInteger editor_id;
@property (nonatomic, assign) NSInteger favorites_count;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy) NSString *image_urls;
@property (nonatomic, assign) BOOL is_favorite;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *price;

@property (nonatomic, assign) NSInteger purchase_id;
@property (nonatomic, assign) NSInteger purchase_type;
@property (nonatomic, copy) NSString *purchase_url;
@property (nonatomic, assign) NSInteger purchase_status;
@property (nonatomic, assign) NSInteger updated_at;
@property (nonatomic, copy) NSString *url;

@end
