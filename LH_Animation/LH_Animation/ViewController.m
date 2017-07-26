//
//  ViewController.m
//  LH_Animation
//
//  Created by 李欢 on 2017/3/30.
//  Copyright © 2017年 李欢. All rights reserved.
//

#import "ViewController.h"
#import "LoadingHUD.h"
#import "KYBubbleInteractiveTransition.h"
#import "LHCircleView.h"
@interface ViewController()
@property  (nonatomic, strong) NSTimer *timer;
@property  (nonatomic, strong) LHCircleView *circleView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
