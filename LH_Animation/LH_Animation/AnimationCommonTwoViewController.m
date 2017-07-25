//
//  AnimationCommonTwoViewController.m
//  LH_Animation
//
//  Created by lh on 2017/4/7.
//  Copyright © 2017年 李欢. All rights reserved.
//

#import "AnimationCommonTwoViewController.h"

@interface AnimationCommonTwoViewController ()

@end

@implementation AnimationCommonTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    [self differentAnimation];
}

//动画类型
- (void)differentAnimation{
    switch (self.type) {
        case AnimationTypeVariFlight:
        {
        
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
