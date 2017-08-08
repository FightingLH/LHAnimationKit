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
#import "Person.h"
#import "NSObject+Runtime.h"
#import "Person.h"
@interface ViewController()
@property  (nonatomic, strong) NSTimer *timer;
@property  (nonatomic, strong) LHCircleView *circleView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *person = [Person lh_objDictionary:@{@"name":@"lihuan",@"sex":@"男"}];
    NSLog(@"%@",person);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
