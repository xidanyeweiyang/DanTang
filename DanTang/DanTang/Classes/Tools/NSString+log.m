//  Created by 刘明 on 16/7/18.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "NSString+log.h"

@implementation NSArray (log)

- (NSString *)descriptionWithLocale:(id)locale{
    
    NSMutableString *str = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [str appendFormat:@"\t%@,\n",obj];
    }];
    [str appendString:@"\n)"];
    
    return str;
}


@end


@implementation NSDictionary (log)

- (NSString *)descriptionWithLocale:(id)locale{
    
    NSMutableString *str = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {

         [str appendFormat:@"\t%@ = %@;\n",key,obj];

    }];
    
    [str appendString:@"}\n"];
    return str;
}

@end