//
//  LMHttpManager.h
//  DanTang
//
//  Created by 刘明 on 16/8/4.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LMFinishBlock)(id response,NSError *error);

@interface LMHttpManager : NSObject

+ (instancetype)shared;
/**
 *  获取首页顶部选择数据
 */
+ (void)loadDanTangTopInfo:(LMFinishBlock)finish;

/**
 *  获取首页数据
 */
+ (void)loadDanTangTopInfoWithIndex:(NSInteger)index finish:(LMFinishBlock)finish;

/**
 *  获取单品数据
 */
+ (void)loadProductInfo:(LMFinishBlock)finish;

/**
 *  获取单品详细数据
 */
+ (void)loadProductDetailInfo:(NSInteger)index Finished:(LMFinishBlock)finish;


/**
 *  获取单品详细评论数据
 */
+ (void)loadProductCommentInfo:(NSInteger)index Finished:(LMFinishBlock)finish;

@end
