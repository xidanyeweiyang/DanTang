//
//  LMComments.h
//  DanTang
//
//  Created by 刘明 on 16/8/11.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LMUser.h"
@interface LMComments : NSObject
@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) BOOL show;

@property (nonatomic, assign) NSInteger created_at;

@property (nonatomic, assign) NSInteger item_id;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, strong) LMUser *user;

@end
