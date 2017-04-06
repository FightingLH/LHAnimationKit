//
//  AnimationCommonOneViewController.m
//  LH_Animation
//
//  Created by 李欢 on 2017/3/30.
//  Copyright © 2017年 李欢. All rights reserved.
//

#import "AnimationCommonOneViewController.h"
#import "OneVeiw.h"

@interface AnimationCommonOneViewController ()
@property (nonatomic,strong) OneVeiw *oneView;
@property (nonatomic,strong) UIView *twoView;
@end

@implementation AnimationCommonOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self chooseRoate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)chooseRoate{
    switch (self.type) {
        case AnimationTypeMove:
        {
            [self one];
        }
            break;
        case AnimationTypeRoate:
        {
            [self two];
        }
            break;
        case AnimationTypeGradient:
        {
            [self three];
        }
            break;
        case AnimationTypeReplicator:
        {
            [self four];
        }
            break;
        case AnimationTypeEmitterLauyer:
        {
            [self five];
        }
            break;
        default:
            break;
    }

}

//粒子效果
- (void)five{
    self.view.backgroundColor = [UIColor blackColor];
    self.twoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.twoView];
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.twoView.bounds;
    [self.twoView.layer addSublayer:emitter];
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width/2.0, emitter.frame.size.height/2);
    CAEmitterCell *cell = [[CAEmitterCell alloc]init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"stars"].CGImage;
    cell.birthRate = 150;
    cell.lifetime = 5.0;
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    cell.alphaSpeed = -0.4;
    cell.velocity = 50;
    cell.velocityRange = 50;
    cell.emissionRange = M_PI *2.0;
    emitter.emitterCells = @[cell];
    
}

/**
 *一组渐变
 */
- (void)four{
    
    self.twoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.twoView];
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.frame = self.twoView.bounds;
    [self.twoView.layer addSublayer:replicator];
    replicator.instanceCount = 10;
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 200, 0);
    transform = CATransform3DRotate(transform, M_PI / 5, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -200, 0);
    replicator.instanceTransform = transform;
    replicator.instanceBlueOffset = -0.1;
    replicator.instanceGreenOffset = -0.1;
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100, 100, 100, 100);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicator addSublayer:layer];
    
}

/**
 *jian bain
 */
- (void)three{
    self.twoView = [[UIView alloc]initWithFrame:CGRectMake(110, 230, 100, 100)];
    [self.view addSubview:self.twoView];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.twoView.bounds;
    [self.twoView.layer addSublayer:gradientLayer];
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor grayColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
}

/*
 *3D变换:却少透视投影时看不出效果m34来决定透视效果-1/d d-500-1000
 *CGPoint + zPosition *CATransform3D == Transformed Point
 */
- (void)two{
    self.oneView = [[OneVeiw alloc]initWithFrame:CGRectMake(110, 230, 100, 100)];
    [self.view addSubview:self.oneView];
    //绕y轴旋转45度:却少透视效果时看不到旋转
    CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    CATransform3D transformRoate = CATransform3DIdentity;
    transformRoate.m34 = -1.0/500.0;
    transformRoate = CATransform3DRotate(transformRoate, M_PI_4, 0, 1, 0);
    self.oneView.layer.transform = transformRoate;
}

/*
 *仿射变换
 *CGPoint * CGAffineTransform == Transformed CGPoint
 *2D变换
 *
 *
 *
*/
- (void)one{
    self.oneView = [[OneVeiw alloc]initWithFrame:CGRectMake(110, 230, 100, 100)];
    [self.view addSubview:self.oneView];
    //只有旋转
    CGAffineTransform transformRoat = CGAffineTransformMakeRotation(M_PI_4);
    //复合变换 缩放+旋转+移动
    CGAffineTransform transformRoatAnd = CGAffineTransformIdentity;
    transformRoatAnd = CGAffineTransformScale(transformRoatAnd, 0.5, 0.5);//缩放
    transformRoatAnd = CGAffineTransformRotate(transformRoatAnd, M_PI / 90);//旋转
    transformRoatAnd = CGAffineTransformTranslate(transformRoatAnd, 200, 300);//移动
    self.oneView.layer.affineTransform = transformRoatAnd;
}
@end
