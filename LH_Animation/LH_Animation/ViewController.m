//
//  ViewController.m
//  LH_Animation
//
//  Created by 李欢 on 2017/3/30.
//  Copyright © 2017年 李欢. All rights reserved.
//

#import "ViewController.h"
<<<<<<< HEAD
#import "LoadingHUD.h"
#import "KYBubbleInteractiveTransition.h"
#import "LHCircleView.h"
@interface ViewController()
@property  (nonatomic, strong) NSTimer *timer;
@property  (nonatomic, strong) LHCircleView *circleView;
=======
#import "NSObject+Runtime.h"
#import "Person.h"
@interface ViewController ()
>>>>>>> 3eb5b88730476ff71f2bb62ae63efa34b0aaf120

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
<<<<<<< HEAD
    self.view.backgroundColor = [UIColor whiteColor];
    
   
=======
//    NSArray *property = [Person lh_objProperty];
//    NSLog(@"%@",property);
    
    Person *person = [Person lh_objDictionary:@{@"name":@"lihuan",@"sex":@"男"}];
    NSLog(@"%@",person);
>>>>>>> 3eb5b88730476ff71f2bb62ae63efa34b0aaf120
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
