//
//  AnimationCommonOneViewController.m
//  LH_Animation
//
//  Created by 李欢 on 2017/3/30.
//  Copyright © 2017年 李欢. All rights reserved.
//

#import "AnimationCommonOneViewController.h"
#import "OneVeiw.h"
#import <QuartzCore/QuartzCore.h>
#import <GLKit/GLKit.h>
#import <CoreGraphics/CoreGraphics.h>

@interface AnimationCommonOneViewController ()<CAAnimationDelegate>
@property (nonatomic,strong) OneVeiw *oneView;
@property (nonatomic,strong) UIView *twoView;

//
@property (nonatomic,strong) EAGLContext *glContext;
@property (nonatomic,strong) CAEAGLLayer *glLayer;
@property (nonatomic,assign) GLuint framebuffer;
@property (nonatomic,assign) GLuint colorRenderBuffer;
@property (nonatomic,assign) GLint framebufferWidth;
@property (nonatomic,assign) GLint framebufferHeight;
@property (nonatomic,strong) GLKBaseEffect *effect;


//
@property (nonatomic,strong) CALayer *colorLayer;

@property (nonatomic,strong) UIImageView *ballImageView;
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
        case AnimationTypeCAEAGLayer:
        {
            [self six];
        }
            break;
        case AnimationTypeCAAnimation:
        {
            [self seven];
        }
            break;
        case AnimationTypeBezierPath:
        {
            [self eight];
        }
            break;
        case AnimationTypeBasicAnimation:
        {
            [self nine];
        }
            break;
        case AnimationTypeBasicTwoAnimation:
        {
            [self ten];
        }
            break;
        case AnimationTypeAnimationGroup:
        {
            [self eleven];
        }
            break;
        case AnimationTypeAnimationMediaTiming:
        {
            [self twelve];
        }
            break;
        case AnimationTypeAnimationCAKey:
        {
            [self thirteen];
        }
            break;
        default:
            break;
    }

}

- (void)thirteen{
    self.view.backgroundColor = [UIColor blackColor];
    self.twoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.twoView];
    self.ballImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ball"]];
    [self.twoView addSubview:self.ballImageView];
    [self animate];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self animate];
}
- (void)animate{
    self.ballImageView.center = CGPointMake(150, 32);
    //create keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 1.0;
    animation.delegate = self;
    animation.values = @[
                         [NSValue valueWithCGPoint:CGPointMake(150, 32)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 140)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 220)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 250)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)]
                         ];
    animation.timingFunctions = @[
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                   [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
                                        animation.keyTimes = @[@0.0, @0.3, @0.5, @0.7, @0.8, @0.9, @0.95, @1.0];
                                        //apply animation
                                        self.ballImageView.layer.position = CGPointMake(150, 268);
                                        [self.ballImageView.layer addAnimation:animation forKey:nil];
}
//huan chogn guanjian zhen dong hua
- (void)twelve{
    //kcamediatimingfunctioneasein
    self.view.backgroundColor = [UIColor blackColor];
    self.twoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.twoView];
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50, 50, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.twoView.layer addSublayer:self.colorLayer];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"缓冲" style:
                                              UIBarButtonItemStylePlain target:self action:@selector(changeColorNext)];
    
}

- (void)changeColorNext{
    //create a keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.0;
    animation.values = @[
                         (__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor ];
    //add timing function
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn];
    
     animation.timingFunctions = @[fn, fn, fn];
                                 //apply animation to layer
                                 [self.colorLayer addAnimation:animation forKey:nil];
}

- (void)eleven{
    self.view.backgroundColor = [UIColor blackColor];
    self.twoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.twoView];
    //create a path
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(150, 300)];
     //draw the path using a CAShapeLayer
     CAShapeLayer *pathLayer = [CAShapeLayer layer];
     pathLayer.path = bezierPath.CGPath;
     pathLayer.fillColor = [UIColor clearColor].CGColor;
     pathLayer.strokeColor = [UIColor redColor].CGColor;
     pathLayer.lineWidth = 3.0f;
     [self.twoView.layer addSublayer:pathLayer];
     //add a colored layer
     CALayer *colorLayer = [CALayer layer];
     colorLayer.frame = CGRectMake(0, 0, 64, 64);
     colorLayer.position = CGPointMake(0, 150);
     colorLayer.backgroundColor = [UIColor greenColor].CGColor;
     [self.twoView.layer addSublayer:colorLayer];
    
     //create the position animation
     CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animation];
     animation1.keyPath = @"position";
     animation1.path = bezierPath.CGPath;
     animation1.rotationMode = kCAAnimationRotateAuto;
     //create the color animation
     CABasicAnimation *animation2 = [CABasicAnimation animation];
     animation2.keyPath = @"backgroundColor";
     animation2.toValue = (__bridge id)[UIColor redColor].CGColor;
     //create group animation
     CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
     groupAnimation.animations = @[animation1, animation2];
     groupAnimation.duration = 4.0;
     //add the animation to the color layer
     [colorLayer addAnimation:groupAnimation forKey:nil];
     
}
- (void)ten{
    self.view.backgroundColor = [UIColor blackColor];
    self.twoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.twoView];
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 128, 128);
    shipLayer.position = CGPointMake(150, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed: @"one.png"].CGImage; [self.twoView.layer addSublayer:shipLayer];
    //animate the ship rotation
    CABasicAnimation *animation = [CABasicAnimation animation]; animation.keyPath = @"transform.rotation";
    animation.duration = 2.0;
    animation.repeatCount = 140;
    animation.byValue = @(M_PI * 2);
    [shipLayer addAnimation:animation forKey:nil];
}

- (void)nine{
    self.view.backgroundColor = [UIColor blackColor];
    self.twoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.twoView];
    
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 128, 128);
    shipLayer.position = CGPointMake(150, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed: @"one.png"].CGImage; [self.twoView.layer addSublayer:shipLayer];
    //animate the ship rotation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform";
    animation.duration = 2.0;
    animation.repeatCount = 10;
    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI*2, 0, 0, 1)]; [shipLayer addAnimation:animation forKey:nil];
}

//quxiandonghau
- (void)eight{
    self.view.backgroundColor = [UIColor blackColor];
    self.twoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.twoView];
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(150, 300)];
  
    //draw the path using a CAShapeLayer 画线
     CAShapeLayer *pathLayer = [CAShapeLayer layer];
     pathLayer.path = bezierPath.CGPath;
     pathLayer.fillColor = [UIColor clearColor].CGColor;
     pathLayer.strokeColor = [UIColor redColor].CGColor;
     pathLayer.lineWidth = 3.0f;
     [self.twoView.layer addSublayer:pathLayer];
    
    //add the ship 添加涂层
     CALayer *shipLayer = [CALayer layer];
     shipLayer.frame = CGRectMake(0, 0, 64, 64);
     shipLayer.position = CGPointMake(0, 150);
     shipLayer.contents = (__bridge id)[UIImage imageNamed: @"one.png"].CGImage; [self.twoView.layer addSublayer:shipLayer];
    
    //create the keyframe animation 动画
     CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
     animation.keyPath = @"position";
     animation.duration = 4.0;
     animation.path = bezierPath.CGPath;
     [shipLayer addAnimation:animation forKey:nil];
    //zi dong dui qi tu ceng qu xian
    //sheng dong dong hua 
    CAKeyframeAnimation *animations = [CAKeyframeAnimation animation];
    animations.keyPath = @"position";
    animations.duration = 4.0;
    animations.path = bezierPath.CGPath;
    animations.rotationMode = kCAAnimationRotateAuto;
    [shipLayer addAnimation:animations forKey:nil];
}

//属性动画
- (void)seven{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"begin" style:UIBarButtonItemStylePlain target:self action:@selector(changeColor)];
    self.view.backgroundColor = [UIColor blackColor];
    self.twoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.twoView];
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50, 200, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.twoView.layer addSublayer:self.colorLayer];
    
}

- (void)changeColor{
    UIColor *color = [UIColor colorWithRed:arc4random()/INT_MAX green:arc4random()/INT_MAX blue:arc4random()/INT_MAX alpha:1.0];
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.toValue = (__bridge id _Nullable)(color.CGColor);
    animation.delegate = self;
    [self.colorLayer addAnimation:animation forKey:nil];
}

//- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag {
//    //set the backgroundColor property to match animation toValue
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
//    self.colorLayer.backgroundColor = (__bridge CGColorRef)anim.toValue; [CATransaction commit];
//}
//
- (void)six{
    self.view.backgroundColor = [UIColor blackColor];
    self.twoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.twoView];
    
    self.glContext = [[EAGLContext alloc] initWithAPI: kEAGLRenderingAPIOpenGLES2]; [EAGLContext setCurrentContext:self.glContext];
    //set up layer
    self.glLayer = [CAEAGLLayer layer];
    self.twoView.frame = self.twoView.bounds;
    [self.twoView.layer addSublayer:self.glLayer];
    self.effect = [[GLKBaseEffect alloc] init];
    //set up buffers
    [self setUpBuffers];
    //draw frame
    [self drawFrame];
    
}
- (void)setUpBuffers{
        //frame
        glGenFramebuffers(1, &_framebuffer);
        glBindFramebuffer(GL_FRAMEBUFFER, _framebuffer);
        //color
        glGenRenderbuffers(1, &_colorRenderBuffer);
        glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, _colorRenderBuffer);
        [self.glContext renderbufferStorage:GL_RENDERBUFFER fromDrawable:self.glLayer];
        glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, &_framebufferWidth);
        glGetRenderbufferParameteriv(GL_RENDERBUFFER_WIDTH, GL_RENDERBUFFER_HEIGHT, &_framebufferHeight);
        //check
        if(glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE){
            NSLog(@"%i",glCheckFramebufferStatus(GL_FRAMEBUFFER));
        }
    }
- (void)tearDownBuffers
{
    if (_framebuffer) {
        //delete framebuffer
        glDeleteFramebuffers(1, &_framebuffer);
        _framebuffer = 0;
    }
    if (_colorRenderBuffer) {
        //delete color render buffer
        glDeleteRenderbuffers(1, &_colorRenderBuffer);
        _colorRenderBuffer = 0;
    }
}
- (void)drawFrame {
    //bind framebuffer & set viewport
    glBindFramebuffer(GL_FRAMEBUFFER, _framebuffer);
    glViewport(0, 0, _framebufferWidth, _framebufferHeight);
    //bind shader program
    [self.effect prepareToDraw];
    //clear the screen
    glClear(GL_COLOR_BUFFER_BIT); glClearColor(0.0, 0.0, 0.0, 1.0);
    //set up vertices
    GLfloat vertices[] = {
        -0.5f, -0.5f, -1.0f, 0.0f, 0.5f, -1.0f, 0.5f, -0.5f, -1.0f,
    };
    //set up colors
    GLfloat colors[] = {
        0.0f, 0.0f, 1.0f, 1.0f, 0.0f, 1.0f, 0.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f,
    };
    //draw triangle
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribColor,3, GL_FLOAT, GL_FALSE, 0, vertices);
    glVertexAttribPointer(GLKVertexAttribColor,4, GL_FLOAT, GL_FALSE, 0, colors);
    glDrawArrays(GL_TRIANGLES, 0, 3);
    //present render buffer
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);
    [self.glContext presentRenderbuffer:GL_RENDERBUFFER];
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
