//
//  UIAlertView+BlockExtension.m
//  BlockAlertView
//
//  Created by 张强 on 16/4/1.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import "UIAlertView+BlockExtension.h"
#import <objc/runtime.h>

//关键字
static void* UIAlertViewKey = @"UIAlertViewKey";

@implementation UIAlertView (BlockExtension)

//一个按键
+ (void)alertWithTitle:(NSString *)title message:(NSString *)message cancelBtnName:(NSString *)cancelBtnName callBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelBtnName otherButtonTitles: nil];
    alert.delegate = alert;
    [alert show];
    alert.alertViewCallBackBlock = alertViewCallBackBlock;
}
//两个按键
+ (void)alertWithTitle:(NSString *)title message:(NSString *)message cancelBtnName:(NSString *)cancelBtnName otherBtnName:(NSString *)otherBtnName callBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelBtnName otherButtonTitles: otherBtnName, nil];
    alert.delegate = alert;
    [alert show];
    alert.alertViewCallBackBlock = alertViewCallBackBlock;
}
//三个按键
+ (void)alertWithTitle:(NSString *)title message:(NSString *)message cancelBtnName:(NSString *)cancelBtnName firstBtnName:(NSString *)firstBtnName secondBtnName:(NSString *)secondBtnName callBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelBtnName otherButtonTitles: firstBtnName,secondBtnName, nil];
    alert.delegate = alert;
    [alert show];
    alert.alertViewCallBackBlock = alertViewCallBackBlock;
}

- (void)setAlertViewCallBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock
{
    //1.源对象self
    //2.关键字 唯一静态变量key - UIAlertViewKey
    //3.关联的对象 alertViewCallBackBlock
    //4.关键策略  OBJC_ASSOCIATION_COPY
    objc_setAssociatedObject(self, &UIAlertViewKey, alertViewCallBackBlock, OBJC_ASSOCIATION_COPY);
}
- (UIAlertViewCallBackBlock)alertViewCallBackBlock
{//通过 objc_getAssociatedObject 获取关联对象
    return objc_getAssociatedObject(self, &UIAlertViewKey);
}
#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.alertViewCallBackBlock)
        self.alertViewCallBackBlock(buttonIndex);
}

@end
