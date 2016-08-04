//
//  LMItems.h
//  DanTang
//
//  Created by 刘明 on 16/8/4.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMItems : NSObject

@property (nonatomic, copy) NSString *content_url;
@property (nonatomic, copy) NSString *cover_image_url;
@property (nonatomic, assign) NSInteger created_at;
@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *share_msg;
@property (nonatomic, assign) NSInteger liked;
@property (nonatomic, assign) NSInteger published_at;
@property (nonatomic, assign) NSInteger likes_count;

@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString *short_title;

@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *template;
@property (nonatomic, assign) NSInteger updated_at;
@property (nonatomic, copy) NSString *url;






@end
