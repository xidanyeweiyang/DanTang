
//
//  LMProduct.m
//  DanTang
//
//  Created by 刘明 on 16/8/5.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMProduct.h"

@implementation LMProduct
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


//
//- (NSString *)description{
//    
//    return [NSString stringWithFormat:@"cover_image_url = %@/n created_at = %@/n describe = %@/n editor_id = %@/n favorites_count = %@/n id = %@/n image_urls = %@/n is_favorite = %@/n  name = %@/n price = %@/n purchase_id = %@/n purchase_type = %@/n purchase_url = %@/n purchase_status = %@/n updated_at = %@/n url = %@/n",self.cover_image_url,self.created_at,self.describe,self.editor_id,self.favorites_count,self.id,self.image_urls,self.is_favorite,self.name,self.price,self.purchase_id,self.purchase_type,self.purchase_url,self.purchase_status,self.purchase_status,self.updated_at,self.url];
//    
//}
@end
