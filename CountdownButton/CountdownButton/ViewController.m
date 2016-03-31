//
//  ViewController.m
//  CountdownButton
//
//  Created by 张强 on 16/3/31.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+repeat.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIButton *tempBtn;
@property (nonatomic, assign) int i;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.tempBtn.frame = CGRectMake(100, 100, 100, 40);
    [self.tempBtn addTarget:self action:@selector(clickWithInterval:) forControlEvents:UIControlEventTouchUpInside];
    self.tempBtn.uxy_acceptEventInterval = 5;
    [self.tempBtn setBackgroundColor:[UIColor redColor]];
    [self.tempBtn setTitle:@"5" forState:UIControlStateNormal];
    [self.view addSubview:self.tempBtn];
}

- (void)clickWithInterval:(UIButton *)btn
{
    self.i = 5;
    [self.tempBtn setTitle:[NSString stringWithFormat:@"%d",self.i] forState:UIControlStateNormal];
    NSLog(@"点击了按钮");
    
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(log) userInfo:nil repeats:YES];
}

- (void)log
{
    NSLog(@"%d",self.i--);
    [self.tempBtn setTitle:[NSString stringWithFormat:@"%d",self.i] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
