//
//  LMHttpManager.m
//  DanTang
//
//  Created by 刘明 on 16/8/4.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMHttpManager.h"
#import "LMDanTangModel.h"
#import "LMItems.h"
#import "LMProduct.h"
#import "LMProductDetail.h"
#import "LMComments.h"

@implementation LMHttpManager

+ (instancetype)shared{
    
    static LMHttpManager *manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[LMHttpManager alloc] init];
        
    });
    
    return manager;
}

/**
 *  获取首页顶部选择数据
 */
+ (void)loadDanTangTopInfo:(LMFinishBlock)finish{
    
    NSString *url = [NSString stringWithFormat:@"%@v2/channels/preset",kBase_IP];
    
    NSDictionary *parameterDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                  @1,@"gender",
                                  @1,@"generation", nil];
    
    
    [SVProgressHUD showWithStatus:@"加载中..."];
    [LMHttpTool GET:url parameters:parameterDic success:^(id response) {
        
        if ([response[@"message"] isEqualToString:@"OK"]) {
            
            [SVProgressHUD dismiss];
            
            NSArray *array = [LMDanTangModel mj_objectArrayWithKeyValuesArray:response[@"data"][@"channels"]];
   
            finish(array,nil);
        }else{
            
            [SVProgressHUD dismiss];
            
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
        }
        
        
        
    } failure:^(NSError *error) {
        
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        
        finish(nil,error);
    }];
}

/**
 *  获取首页数据
 */
+ (void)loadDanTangTopInfoWithIndex:(NSInteger)index finish:(LMFinishBlock)finish{
    
    NSString *url = [NSString stringWithFormat:@"%@v1/channels/%zd/items",kBase_IP,index];
    
    NSDictionary *parameterDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                  @1,@"gender",
                                  @1,@"generation",
                                  @20,@"limit",
                                  @0,@"offset",nil];

    [SVProgressHUD showWithStatus:@"加载中..."];
    [LMHttpTool GET:url parameters:parameterDic success:^(id response) {
        
        
        
        if ([response[@"message"] isEqualToString:@"OK"]) {
            
            [SVProgressHUD dismiss];
            
            NSArray *array = [LMItems mj_objectArrayWithKeyValuesArray:response[@"data"][@"items"]];
            
            finish(array,nil);
            
        }else{
            
            [SVProgressHUD dismiss];
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
        }
        
        
        
    } failure:^(NSError *error) {
        
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        
        finish(nil,error);
    }];
}
//

/**
 *  获取单品数据
 */
+ (void)loadProductInfo:(LMFinishBlock)finish;{
    
    NSString *url = [NSString stringWithFormat:@"%@v2/items",kBase_IP];
    
    NSDictionary *parameterDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                  @1,@"gender",
                                  @1,@"generation",
                                  @20,@"limit",
                                  @0,@"offset",nil];
    
    [SVProgressHUD showWithStatus:@"加载中..."];
    
    [LMHttpTool GET:url parameters:parameterDic success:^(id response) {
 
        if ([response[@"message"] isEqualToString:@"OK"]) {
            
            
            NSArray *array = response[@"data"][@"items"];

            NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:10];
            
            [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
                
                LMProduct *product = [LMProduct new];
                [product setValuesForKeysWithDictionary:obj[@"data"]];
               
                [mArray addObject:product];
            }];
            
            
            [SVProgressHUD dismiss];

            finish(mArray,nil);
            
        }else{
            
            [SVProgressHUD dismiss];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [SVProgressHUD showErrorWithStatus:response[@"message"]];
                
            });
            
             [SVProgressHUD dismiss];
        }
        
        
        
    } failure:^(NSError *error) {
        
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        
        finish(nil,error);
    }];
}


/**
 *  获取单品详细数据
 */
+ (void)loadProductDetailInfo:(NSInteger)index Finished:(LMFinishBlock)finish{
    
    NSString *url = [NSString stringWithFormat:@"%@v2/items/%zd",kBase_IP,index];
    
    [SVProgressHUD showWithStatus:@"加载中..."];
    
    [LMHttpTool GET:url parameters:nil success:^(id response) {
        
        if ([response[@"message"] isEqualToString:@"OK"]) {
            
            
            NSDictionary *dict = response[@"data"];
            
            LMProductDetail *productDetail = [LMProductDetail mj_objectWithKeyValues:dict];

            [SVProgressHUD dismiss];
            
            finish(productDetail,nil);
            
        }else{
            
            [SVProgressHUD dismiss];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [SVProgressHUD showErrorWithStatus:response[@"message"]];
                
            });
            
            [SVProgressHUD dismiss];
        }
        
        
        
    } failure:^(NSError *error) {
        
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        
        finish(nil,error);
    }];
    
}


/**
 *  获取单品详细评论数据
 */
+ (void)loadProductCommentInfo:(NSInteger)index Finished:(LMFinishBlock)finish{
    
    NSString *url = [NSString stringWithFormat:@"%@v2/items/%zd/comments",kBase_IP,index];
    
    [SVProgressHUD showWithStatus:@"加载中..."];
    
    [LMHttpTool GET:url parameters:nil success:^(id response) {
        
//        NSLog(@"%@",response);
        
        if ([response[@"message"] isEqualToString:@"OK"]) {
            
            
            NSMutableArray *mArray = [LMComments mj_objectArrayWithKeyValuesArray:response[@"data"][@"comments"]];
            
            [SVProgressHUD dismiss];
            
            finish(mArray,nil);
            
        }else{
            
            [SVProgressHUD dismiss];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [SVProgressHUD showErrorWithStatus:response[@"message"]];
                
            });
            
            [SVProgressHUD dismiss];
        }
        
        
        
    } failure:^(NSError *error) {
        
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        
        finish(nil,error);
    }];
    
}
@end
