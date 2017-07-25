//
//  NSObject+Runtime.h
//  LH_Animation
//
//  Created by 李欢 on 2017/7/25.
//  Copyright © 2017年 李欢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)
+ (instancetype)lh_objDictionary:(NSDictionary *)dict;
//获取所有的属性
+ (NSArray *)lh_objProperty;
@end
