//
//  UIAlertView+BlockExtension.h
//  BlockAlertView
//
//  Created by 张强 on 16/4/1.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIAlertViewCallBackBlock)(NSInteger index);

@interface UIAlertView (BlockExtension)<UIAlertViewDelegate>

@property (nonatomic, copy) UIAlertViewCallBackBlock alertViewCallBackBlock;

/**
 *  cancel
 *
 *  @param title         <#title description#>
 *  @param message       <#message description#>
 *  @param cancelBtnName <#cancelBtnName description#>
 *  @param callBackBlock <#callBackBlock description#>
 */
+ (void)alertWithTitle:(NSString *)title message:(NSString *)message cancelBtnName:(NSString *)cancelBtnName callBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock;
/**
 *  cancel and other
 *
 *  @param title         <#title description#>
 *  @param message       <#message description#>
 *  @param cancelBtnName <#cancelBtnName description#>
 *  @param otherBtnName  <#otherBtnName description#>
 *  @param callBackBlock <#callBackBlock description#>
 */
+ (void)alertWithTitle:(NSString *)title message:(NSString *)message cancelBtnName:(NSString *)cancelBtnName otherBtnName:(NSString *)otherBtnName callBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock;
/**
 *  cancel and first and second
 *
 *  @param title                  <#title description#>
 *  @param message                <#message description#>
 *  @param cancelBtnName          <#cancelBtnName description#>
 *  @param firstBtnName           <#firstBtnName description#>
 *  @param secondBtnName          <#secondBtnName description#>
 *  @param alertViewCallBackBlock <#alertViewCallBackBlock description#>
 */
+ (void)alertWithTitle:(NSString *)title message:(NSString *)message cancelBtnName:(NSString *)cancelBtnName firstBtnName:(NSString *)firstBtnName secondBtnName:(NSString *)secondBtnName callBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock;

@end
