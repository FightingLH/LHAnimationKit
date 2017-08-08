//
//  NSObject+Runtime.m
//  LH_Animation
//
//  Created by 李欢 on 2017/7/25.
//  Copyright © 2017年 李欢. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>
@implementation NSObject (Runtime)

+ (instancetype)lh_objDictionary:(NSDictionary *)dict
{
    id objList = [[self alloc] init];
    NSArray *proList = [self lh_objProperty];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([proList containsObject:key]) {
            [objList setValue:obj forKey:key];
        }
    }];
    return objList;
}

+ (NSArray *)lh_objProperty
{
    unsigned int count = 0;
    objc_property_t *property =  class_copyPropertyList([self class], &count);
    NSMutableArray *proArray = @[].mutableCopy;
    for (unsigned  int i = 0; i < count; i ++) {
        objc_property_t pty = property[i];
        const char *cName = property_getName(pty);
        NSString *objcStr = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [proArray addObject:objcStr];
    }
    free(property);
    return proArray.copy;
}
@end
