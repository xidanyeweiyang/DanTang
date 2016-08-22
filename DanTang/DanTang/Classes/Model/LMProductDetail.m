
//
//  LMProductDetail.m
//  DanTang
//
//  Created by 刘明 on 16/8/10.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMProductDetail.h"

@implementation LMProductDetail
- (instancetype)init{
    
    
    if ((self = [super init])!=nil) {
        //
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    
    
    return self;
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"describe":@"description"};
}


//- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
//    
//    if ([key isEqualToString:@"description"]) {
//        
//        self.describe = value;
//    }
//}
@end
