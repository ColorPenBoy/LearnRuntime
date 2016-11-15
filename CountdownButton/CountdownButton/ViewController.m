//
//  ViewController.m
//  CountdownButton
//
//  Created by 张强 on 16/3/31.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+repeat.h"

// 倒计时时长（s）
static const NSInteger second = 59;

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIButton *tempBtn;
@property (nonatomic, assign) NSInteger i;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.tempBtn.frame = CGRectMake(100, 100, 100, 40);
    [self.tempBtn addTarget:self action:@selector(clickWithInterval:) forControlEvents:UIControlEventTouchUpInside];
    self.tempBtn.uxy_acceptEventInterval = second;
    [self.tempBtn setBackgroundColor:[UIColor redColor]];
    [self.tempBtn setTitle:@"倒计时" forState:UIControlStateNormal];
    [self.view addSubview:self.tempBtn];
}

- (void)clickWithInterval:(UIButton *)sender {
    self.i = second;
    [self.tempBtn setTitle:[NSString stringWithFormat:@"%ld",(long)self.i] forState:UIControlStateNormal];
    NSLog(@"点击了按钮");
    
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(log) userInfo:nil repeats:YES];
}

- (void)log {
    
    --self.i;
    
    NSLog(@"%ld",(long)self.i);
    
    [self.tempBtn setTitle:[NSString stringWithFormat:@"%ld",(long)self.i] forState:UIControlStateNormal];
   
    // 倒数为0时，重新开始计时
    if (self.i == 0) {
        [self.tempBtn setTitle:@"倒计时" forState:UIControlStateNormal];
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
