//
//  AppDelegate.m
//  星语心愿
//
//  Created by mac on 17/12/11.
//  Copyright © 2017年 123. All rights reserved.
//

#import "AppDelegate.h"
#import "UIView+WHC_AutoLayout.h"
#import "FirstViewController.h"
#import "LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //123
    //创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //设置为主窗口
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    UIImageView *imgVBg = [UIImageView new];
    [self.window addSubview:imgVBg];
    [imgVBg whc_TopSpace:0];
    [imgVBg whc_LeftSpace:0];
    [imgVBg whc_RightSpace:0];
    [imgVBg whc_BottomSpace:0];
    imgVBg.image = [UIImage imageNamed:@"window"];
    
    LoginViewController *LoginV = [[LoginViewController alloc]init];
    self.window.rootViewController = LoginV;

    
    return YES;
}

-(void)createFistView{
    FirstViewController *firstV = [[FirstViewController alloc]init];
    self.window.rootViewController = firstV;

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
