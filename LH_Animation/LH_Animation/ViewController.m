//
//  ViewController.m
//  LH_Animation
//
//  Created by 李欢 on 2017/3/30.
//  Copyright © 2017年 李欢. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Runtime.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *property = [Person lh_objProperty];
    NSLog(@"%@",property);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
