//
//  OneVeiw.m
//  LH_Animation
//
//  Created by lh on 2017/4/6.
//  Copyright © 2017年 李欢. All rights reserved.
//
//
#import "OneVeiw.h"

@implementation OneVeiw

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        [self addChildImage];
    }
    return self;
}

- (void)addChildImage{
    UIImageView *child = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    child.image = [UIImage imageNamed:@"one"];
    [self addSubview:child];
}
@end
