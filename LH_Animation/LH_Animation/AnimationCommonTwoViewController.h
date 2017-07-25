//
//  AnimationCommonTwoViewController.h
//  LH_Animation
//
//  Created by lh on 2017/4/7.
//  Copyright © 2017年 李欢. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,AnimationType){
    AnimationTypeVariFlight,//

};
@interface AnimationCommonTwoViewController : UIViewController
@property (nonatomic,assign) AnimationType type;
@end
