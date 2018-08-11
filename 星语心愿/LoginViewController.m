//
//  LoginViewController.m
//  星语心愿
//
//  Created by mac on 17/12/13.
//  Copyright © 2017年 123. All rights reserved.
//

#import "LoginViewController.h"
#import "UIView+WHC_AutoLayout.h"
#import "AppDelegate.h"
@interface LoginViewController ()
{
    UIWebView *LXWebView;
    UITextField *_userText;

}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //加点注释
    //加个试试
    //123456
    
    //流星背景
    NSString *path = [[[NSBundle mainBundle] bundlePath]  stringByAppendingPathComponent:@"index.html"];
    LXWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [LXWebView loadRequest:[[NSURLRequest alloc] initWithURL:[[NSURL alloc] initFileURLWithPath:path]]];
    [self.view addSubview:LXWebView];
    
    UIView *view = [UIView new];
    [self.view addSubview:view];
    [view whc_TopSpace:0];
    [view whc_LeftSpace:0];
    [view whc_RightSpace:0];
    [view whc_BottomSpace:0];
    view.backgroundColor = [UIColor clearColor];


    UILabel *label1 = [UILabel new];
    [self.view addSubview:label1];
    [label1 whc_CenterY:-40];
    [label1 whc_LeftSpace:0];
    [label1 whc_Width:self.view.frame.size.width];
    [label1 whc_Height:25];
    label1.text = @"说出你心中的那个他(她)";
    label1.textAlignment = NSTextAlignmentCenter;
    [label1 setFont:[UIFont fontWithName:@"Zapfino" size:20.0]];
    label1.textColor = [UIColor colorWithRed:0.98 green:0.16 blue:0.60 alpha:1];
    
    UIView *textV = [UIView new];
    [self.view addSubview:textV];
    [textV whc_CenterX:0];
    [textV whc_TopSpace:0 toView:label1];
    [textV whc_Width:150];
    [textV whc_Height:40];
    textV.backgroundColor = [UIColor clearColor];
    
    _userText = [UITextField new];
    [textV addSubview:_userText];
    [_userText whc_CenterY:0];
    [_userText whc_LeftSpace:10];
    [_userText whc_Height:39];
    [_userText whc_Width:130];
    //_userText.placeholder = @"他";
    _userText.textColor = [UIColor colorWithRed:0.98 green:0.16 blue:0.60 alpha:1];
    _userText.font = [UIFont systemFontOfSize:18];
    _userText.borderStyle = UITextBorderStyleNone;
    //_userText.clearButtonMode = UITextFieldViewModeAlways;
    _userText.textAlignment = NSTextAlignmentCenter;
    
    UIView *diV = [UIView new];
    [textV addSubview:diV];
    [diV whc_TopSpace:39];
    [diV whc_LeftSpace:0];
    [diV whc_Width:150];
    [diV whc_Height:1];
    diV.backgroundColor = [UIColor colorWithRed:0.98 green:0.16 blue:0.60 alpha:1];
    
    UILabel *label2 = [UILabel new];
    [self.view addSubview:label2];
    [label2 whc_TopSpace:15 toView:textV];
    [label2 whc_LeftSpace:0];
    [label2 whc_Width:self.view.frame.size.width];
    [label2 whc_Height:25];
    label2.text = @"期许一世美好";
    label2.textAlignment = NSTextAlignmentCenter;
    [label2 setFont:[UIFont fontWithName:@"Zapfino" size:20.0]];
    label2.textColor = [UIColor colorWithRed:1 green:0.53 blue:0.77 alpha:1];
    
    UILabel *label3 = [UILabel new];
    [self.view addSubview:label3];
    [label3 whc_TopSpace:10 toView:label2];
    [label3 whc_LeftSpace:0];
    [label3 whc_Width:self.view.frame.size.width];
    [label3 whc_Height:25];
    label3.text = @"聆听他(她)的心声";
    label3.textAlignment = NSTextAlignmentCenter;
    [label3 setFont:[UIFont fontWithName:@"Times New Roman" size:20.0]];
    label3.textColor = [UIColor colorWithRed:1 green:0.53 blue:0.77 alpha:1];

    
    
    UIButton *btn = [UIButton new];
    [self.view addSubview:btn];
    [btn whc_CenterX:0];
    [btn whc_TopSpace:20 toView:label3];
    [btn whc_Width:100];
    [btn whc_Height:40];
    btn.backgroundColor = [UIColor clearColor];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor colorWithRed:1 green:0.53 blue:0.77 alpha:1].CGColor;
    [btn setTitle:@"聆听" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0.98 green:0.16 blue:0.60 alpha:1] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    
}
-(void)btnAction:(UIButton *)btn{
    
    if(![_userText.text isEqualToString:@""]){
        
        if([_userText.text isEqualToString:@"刘吉庆"]||[_userText.text isEqualToString:@"admin"]){
            
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            [userDefault setObject:_userText.text forKey:@"UserName"];
            
            AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
            [appDelegate createFistView];

        }else{
            UIAlertView *showSelection1 = [[UIAlertView alloc]
                                           initWithTitle:@"提示"
                                           message:@"你确定是他？😝"
                                           delegate:nil
                                           cancelButtonTitle:@"取消"
                                           otherButtonTitles:nil];
            [showSelection1 show];

        }
        
 
    }else{
        UIAlertView *showSelection1 = [[UIAlertView alloc]
                                       initWithTitle:@"提示"
                                       message:@"请写上你心中的那个他（她）"
                                       delegate:nil
                                       cancelButtonTitle:@"确定"
                                       otherButtonTitles:nil];
        [showSelection1 show];
 
    }
    
    
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
