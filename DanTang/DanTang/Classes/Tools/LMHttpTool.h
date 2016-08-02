//
//  LMHttpTool.h
//  Zhongliang
//
//  Created by 刘明 on 16/7/18.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface  LMHttpTool: NSObject

typedef void (^success)(id response);
typedef void (^failure)(NSError *error);


+(void)startNetworkMonitoring;

+(BOOL)isConnectionAvailable;

+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(success)success
     failure:(failure)failure;

+(void)GET:(NSString *)URLString
parameters:(id)parameters
   success:(success)success
   failure:(failure)failure;


+(void)getWithForm:(NSString *)restPath
        parameters:(id)parameters
        modelClass:(Class)modelClass
           keyPath:(NSString *)keyPath
           success:(success)success
           failure:(failure)failure;


+(void)postWithForm:(NSString *)restPath
         parameters:(id)parameters
         modelClass:(Class)modelClass
            keyPath:(NSString *)keyPath
            success:(success)success
            failure:(failure)failure;



@end
