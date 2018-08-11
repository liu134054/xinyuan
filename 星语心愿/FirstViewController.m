//
//  FirstViewController.m
//  星语心愿
//
//  Created by mac on 17/12/11.
//  Copyright © 2017年 123. All rights reserved.
//

#import "FirstViewController.h"
#import "UIView+WHC_AutoLayout.h"

#import <AVFoundation/AVFoundation.h>

#import "YQAnimationLayer.h"

#define ScreenHight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface FirstViewController ()<AVAudioPlayerDelegate>
{
    NSString *titleLabel;
    AVAudioPlayer *_player;
    UIView *view1;
    UIView *view2;
    BOOL zhuan;
    NSTimer *timer1;
    NSTimer *timer2;

    int i;
    int j;
    
    UIWebView *LXWebView;
    UIWebView *XXWebView;
    
    UIImageView *imgV1;
    UIImageView *imgV2;
    UIImageView *imgV3;
    UIImageView *imgV4;
    UIImageView *imgV5;
    UIImageView *imgV6;
    UIImageView *imgV7;
    UIImageView *imgV8;
}
@property (nonatomic, strong)CAEmitterLayer * emitterLayer;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *str = [userDefault objectForKey:@"UserName"];
    
    if ([str isEqualToString:@"admin"]) {
        titleLabel = @"某某，我爱你";
    }else if([str isEqualToString:@"刘吉庆"]){
        titleLabel = @"爽爽，我爱你";
    }

    
    i=0;
    j=0;
    [self createUI];
    
    [self setBgMusic];
    
    
}
//设置背景音乐
-(void)setBgMusic{
    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"昼夜-思美人兮" ofType:@"mp3"];
    
    NSURL *url = [NSURL fileURLWithPath:path];
    
    //实例化_player对象
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    //设置属性
    //设置音量
    _player.volume = .8;
    
    //音乐播放的当前时间
    _player.currentTime = 0;
    
    //音乐播放循环次数
    _player.numberOfLoops = 1000;
    
    //声道
    NSUInteger channels = _player.numberOfChannels;
    
    //音乐的总时长
    NSTimeInterval duration = _player.duration;
    
    //设置代理
    _player.delegate = self;
    
    //音乐播放
    [_player play];

}

#pragma mark ------- AVAudioPlayer
//播放完成时调用
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"播放完成");
}


-(void)createUI{
    view1 = [UIView new];
    [self.view addSubview:view1];
    [view1 whc_TopSpace:0];
    [view1 whc_LeftSpace:0];
    [view1 whc_RightSpace:0];
    [view1 whc_BottomSpace:0];
    view1.backgroundColor = [UIColor greenColor];
    
    //流星背景
    NSString *path = [[[NSBundle mainBundle] bundlePath]  stringByAppendingPathComponent:@"GetLiuxing.html"];
    LXWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [LXWebView loadRequest:[[NSURLRequest alloc] initWithURL:[[NSURL alloc] initFileURLWithPath:path]]];
    [view1 addSubview:LXWebView];

    UIView *zheV = [UIView new];
    [self.view addSubview:zheV];
    [zheV whc_TopSpace:0];
    [zheV whc_LeftSpace:0];
    [zheV whc_RightSpace:0];
    [zheV whc_BottomSpace:0];
    zheV.backgroundColor = [UIColor clearColor];

    
    imgV1 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-50-50,ScreenHight/2-10, 50, 50)];
    [zheV addSubview:imgV1];
    imgV1.image = [UIImage imageNamed:@"pic1"];
    imgV1.hidden = YES;
    
    imgV2 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-50-50,ScreenHight/2-10-50-10, 50, 50)];
    [zheV addSubview:imgV2];
    imgV2.image = [UIImage imageNamed:@"pic2"];
    imgV2.hidden = YES;
    
    imgV3 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-50-50,ScreenHight/2-10-50-10-50-10, 50, 50)];
    [zheV addSubview:imgV3];
    imgV3.image = [UIImage imageNamed:@"pic1"];
    imgV3.hidden = YES;
    
    imgV4 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-50-50,ScreenHight/2-10+50+5, 50, 50)];
    [zheV addSubview:imgV4];
    imgV4.image = [UIImage imageNamed:@"pic3"];
    imgV4.hidden = YES;
    
    
    imgV5 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-50-50-20-50,ScreenHight/2-10, 50, 50)];
    [zheV addSubview:imgV5];
    imgV5.image = [UIImage imageNamed:@"pic5"];
    imgV5.hidden = YES;
    
    imgV6 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-50-50-20-50,ScreenHight/2-10+50+5, 50, 50)];
    [zheV addSubview:imgV6];
    imgV6.image = [UIImage imageNamed:@"pic6"];
    imgV6.hidden = YES;
    
    imgV7 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-50-50-20-50,ScreenHight/2-10+50+5+50+10, 50, 50)];
    [zheV addSubview:imgV7];
    imgV7.image = [UIImage imageNamed:@"pic7"];
    imgV7.hidden = YES;
    
    imgV8 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth-50-50-20-50,ScreenHight/2-10+50+5+50+10+50+10, 50, 50)];
    [zheV addSubview:imgV8];
    imgV8.image = [UIImage imageNamed:@"pic8"];
    imgV8.hidden = YES;

    
    view2 = [UIView new];
    [self.view addSubview:view2];
    [view2 whc_TopSpace:0];
    [view2 whc_LeftSpace:0];
    [view2 whc_RightSpace:0];
    [view2 whc_BottomSpace:0];
    view2.backgroundColor = [UIColor colorWithRed:22.0f/255.0 green:22.0f/255.0 blue:22.0f/255.0 alpha:1.0];
    view2.hidden = YES;
    //-------------------------------
    [self SetupEmitter];
    for (id layer in self.view.layer.sublayers) {
        if([layer isKindOfClass:[YQAnimationLayer class]])
        {
            [layer removeFromSuperlayer];
        }
    }
    
//    [YQAnimationLayer createAnimationLayerWithString:@"某某，我爱你" andRect: CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width) andView:view2 andFont:[UIFont boldSystemFontOfSize:40] andStrokeColor:[UIColor cyanColor]];
    
    timer1 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    

}
-(void)timer:(NSTimer *)timer
{
    //zhuan=YES;
    i++;
    NSLog(@"i:%d",i);
    
    if(i==2){
        imgV3.hidden = NO;
    }else if (i==3){
        imgV2.hidden = NO;
    }else if (i==4){
        imgV1.hidden = NO;
    }else if (i==5){
        imgV4.hidden = NO;;
    }else if (i==6){
        imgV5.hidden = NO;
    }else if (i==7){
        imgV6.hidden = NO;
    }else if (i==8){
        imgV7.hidden = NO;
    }else if (i==9){
        imgV8.hidden =NO;
    }

    if (i==11) {
        imgV1.hidden = YES;
        imgV2.hidden = YES;
        imgV3.hidden = YES;
        imgV4.hidden = YES;
        imgV5.hidden = YES;
        imgV6.hidden = YES;
        imgV7.hidden = YES;
        imgV8.hidden = YES;
        


        i=0;
        view2.hidden = NO;
        //zhuan = NO;
        //视图的翻转动画
        [self flipView:self.view direction:!zhuan];
        
        [timer invalidate];

        timer2 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer2:) userInfo:nil repeats:YES];
    }


}
-(void)timer2:(NSTimer *)timer{
    j++;
    
    //[self SetupEmitter];
    for (id layer in self.view.layer.sublayers) {
        if([layer isKindOfClass:[YQAnimationLayer class]])
        {
            [layer removeFromSuperlayer];
        }
    }
    
    [YQAnimationLayer createAnimationLayerWithString:titleLabel andRect: CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width) andView:view2 andFont:[UIFont boldSystemFontOfSize:40] andStrokeColor:[UIColor cyanColor]];
    
    
    //注意动画的完成时间
    //----------------------
    if(j==10){
        
        for (id layer in self.view.layer.sublayers) {
            if([layer isKindOfClass:[YQAnimationLayer class]])
            {
                [layer removeFromSuperlayer];
            }
        }
        


        j=0;
        view2.hidden = YES;
        //视图的翻转动画
        [self flipView:self.view direction:!zhuan];
        
        [timer invalidate];
        
        timer1 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    }

}




//翻转动画
-(void)flipView:(UIView *)view direction:(BOOL)isLeft
{
    [UIView animateWithDuration:2 animations:^{
        //翻转动画
        [UIView setAnimationTransition:isLeft?UIViewAnimationTransitionFlipFromLeft:UIViewAnimationTransitionFlipFromRight forView:view cache:YES];
    }];
}

- (void)snow{
    // 雪花／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／
    
    // Configure the particle emitter to the top edge of the screen
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, -30);
    snowEmitter.emitterSize		= CGSizeMake(self.view.bounds.size.width * 2.0, 0.0);;
    
    // Spawn points for the flakes are within on the outline of the line
    snowEmitter.emitterMode		= kCAEmitterLayerOutline;
    snowEmitter.emitterShape	= kCAEmitterLayerLine;
    
    // Configure the snowflake emitter cell
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    
    //    随机颗粒的大小
    snowflake.scale = 0.2;
    snowflake.scaleRange = 0.5;
    
    //    缩放比列速度
    //        snowflake.scaleSpeed = 0.1;
    
    //    粒子参数的速度乘数因子；
    snowflake.birthRate		= 20.0;
    
    //生命周期
    snowflake.lifetime		= 60.0;
    
    //    粒子速度
    snowflake.velocity		= 20;				// falling down slowly
    snowflake.velocityRange = 10;
    //    粒子y方向的加速度分量
    snowflake.yAcceleration = 2;
    
    //    周围发射角度
    snowflake.emissionRange = 0.5 * M_PI;		// some variation in angle
    //    自动旋转
    snowflake.spinRange		= 0.25 * M_PI;		// slow spin
    
    snowflake.contents		= (id) [[UIImage imageNamed:@"fire"] CGImage];
    snowflake.color			= [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
    // Make the flakes seem inset in the background
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius  = 0.0;
    snowEmitter.shadowOffset  = CGSizeMake(0.0, 1.0);
    snowEmitter.shadowColor   = [[UIColor whiteColor] CGColor];
    
    // Add everything to our backing layer below the UIContol defined in the storyboard
    snowEmitter.emitterCells = [NSArray arrayWithObject:snowflake];
    [self.view.layer addSublayer:snowEmitter];
    
    //    [self.view.layer insertSublayer:snowEmitter atIndex:0];
    //// 雪花／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／
    //// 雪花／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／
}


- (void)SetupEmitter{
    // Cells spawn in the bottom, moving up
    CAEmitterLayer *fireworksEmitter = [CAEmitterLayer layer];
    CGRect viewBounds = self.view.layer.bounds;
    fireworksEmitter.emitterPosition = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height);
    fireworksEmitter.emitterSize	= CGSizeMake(1, 0.0);
    fireworksEmitter.emitterMode	= kCAEmitterLayerOutline;
    fireworksEmitter.emitterShape	= kCAEmitterLayerLine;
    fireworksEmitter.renderMode		= kCAEmitterLayerAdditive;
    //fireworksEmitter.seed = 500;//(arc4random()%100)+300;
    
    // Create the rocket
    CAEmitterCell* rocket = [CAEmitterCell emitterCell];
    
    rocket.birthRate		= 6.0;
    rocket.emissionRange	= 0.12 * M_PI;  // some variation in angle
    rocket.velocity			= 500;
    rocket.velocityRange	= 150;
    rocket.yAcceleration	= 0;
    rocket.lifetime			= 2.02;	// we cannot set the birthrate < 1.0 for the burst
    
    rocket.contents			= (id) [[UIImage imageNamed:@"ball"] CGImage];
    rocket.scale			= 0.2;
    //    rocket.color			= [[UIColor colorWithRed:1 green:0 blue:0 alpha:1] CGColor];
    rocket.greenRange		= 1.0;		// different colors
    rocket.redRange			= 1.0;
    rocket.blueRange		= 1.0;
    
    rocket.spinRange		= M_PI;		// slow spin
    
    
    
    // the burst object cannot be seen, but will spawn the sparks
    // we change the color here, since the sparks inherit its value
    CAEmitterCell* burst = [CAEmitterCell emitterCell];
    
    burst.birthRate			= 1.0;		// at the end of travel
    burst.velocity			= 0;
    burst.scale				= 2.5;
    burst.redSpeed			=-1.5;		// shifting
    burst.blueSpeed			=+1.5;		// shifting
    burst.greenSpeed		=+1.0;		// shifting
    burst.lifetime			= 0.35;
    
    // and finally, the sparks
    CAEmitterCell* spark = [CAEmitterCell emitterCell];
    
    spark.birthRate			= 666;
    spark.velocity			= 125;
    spark.emissionRange		= 2* M_PI;	// 360 deg
    spark.yAcceleration		= 75;		// gravity
    spark.lifetime			= 3;
    
    spark.contents			= (id) [[UIImage imageNamed:@"fire"] CGImage];
    spark.scale		        =0.5;
    spark.scaleSpeed		=-0.2;
    spark.greenSpeed		=-0.1;
    spark.redSpeed			= 0.4;
    spark.blueSpeed			=-0.1;
    spark.alphaSpeed		=-0.5;
    spark.spin				= 2* M_PI;
    spark.spinRange			= 2* M_PI;
    
    // putting it together
    fireworksEmitter.emitterCells	= [NSArray arrayWithObject:rocket];
    rocket.emitterCells				= [NSArray arrayWithObject:burst];
    burst.emitterCells				= [NSArray arrayWithObject:spark];
    [view2.layer addSublayer:fireworksEmitter];
    
}

- (CABasicAnimation *)moveY:(float)time Y:(NSNumber *)y //纵向移动

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    animation.toValue = y;
    
    animation.duration = time;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
    
}


- (CAAnimation *)SetupScaleAnimation{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleAnimation.duration = 3.0;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:40.0];
    //scaleAnimation.repeatCount = MAXFLOAT;
    //scaleAnimation.autoreverses = YES;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.removedOnCompletion = NO;
    
    return scaleAnimation;
}

- (CAAnimation *)SetupGroupAnimation{
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.duration = 3.0;
    groupAnimation.animations = @[[self moveY:3.0f Y:[NSNumber numberWithFloat:-300.0f]]];
    //groupAnimation.autoreverses = YES;
    //groupAnimation.repeatCount = MAXFLOAT;
    return groupAnimation;
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 2.0f, 2.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
