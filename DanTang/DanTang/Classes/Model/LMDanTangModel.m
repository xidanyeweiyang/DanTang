//
//  LMDanTangModel.m
//  DanTang
//
//  Created by 刘明 on 16/8/4.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMDanTangModel.h"

@implementation LMDanTangModel
- (instancetype)init{
    
    
    if ((self = [super init])!=nil) {
        //
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    
    
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

- (NSString *)description{
    
    return [NSString stringWithFormat:@"editable = %ld/n name = %@/n  id = %ld/n",(long)self.editable,self.name,(long)self.id];
}
@end
