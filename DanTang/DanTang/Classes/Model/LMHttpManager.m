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
    
    [LMHttpTool GET:url parameters:parameterDic success:^(id response) {
        
        if ([response[@"message"] isEqualToString:@"OK"]) {
            
            NSArray *array = [LMDanTangModel mj_objectArrayWithKeyValuesArray:response[@"data"][@"channels"]];
   
            finish(array,nil);
        }else{
            
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
        }
        
        
        
    } failure:^(NSError *error) {
        
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

    
    [LMHttpTool GET:url parameters:parameterDic success:^(id response) {
        
        
        
        if ([response[@"message"] isEqualToString:@"OK"]) {
            
            NSArray *array = [LMItems mj_objectArrayWithKeyValuesArray:response[@"data"][@"items"]];
            
            finish(array,nil);
            
        }else{
            
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
        }
        
        
        
    } failure:^(NSError *error) {
        
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        
        finish(nil,error);
    }];
}

@end
