//
//  UIControl+repeat.h
//  runtime_btn
//
//  Created by colorPen on 15/9/15.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (repeat)

/*!
 *  可以用这个给重复点击加间隔
 */
@property (nonatomic, assign) NSTimeInterval uxy_acceptEventInterval;
@property (nonatomic, assign) NSTimeInterval uxy_acceptedEventTime;

@end

