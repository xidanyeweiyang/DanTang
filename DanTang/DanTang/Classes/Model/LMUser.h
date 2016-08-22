//
//  LMUser.h
//  DanTang
//
//  Created by 刘明 on 16/8/11.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMUser : NSObject
@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, assign) NSInteger role;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) BOOL can_mobile_login;
@end
