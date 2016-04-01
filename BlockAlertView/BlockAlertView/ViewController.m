//
//  ViewController.m
//  BlockAlertView
//
//  Created by 张强 on 16/4/1.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertView+BlockExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [UIAlertView alertWithTitle:@"title" message:@"I am a message!" cancelBtnName:@"cancel" callBackBlock:^(NSInteger index) {
       
        // TODO: Call Back
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
