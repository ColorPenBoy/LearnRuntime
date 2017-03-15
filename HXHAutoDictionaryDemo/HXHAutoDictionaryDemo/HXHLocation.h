//
//  HXHLocation.h
//  HXHAutoDictionaryDemo
//
//  Created by colorpen on 2017/3/15.
//  Copyright © 2017年 Bitauto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXHLocation : NSObject

@property (copy, nonatomic, readonly) NSString *title;
@property (assign, nonatomic, readonly) float latitude;
@property (assign, nonatomic, readonly) float longitude;

- (id)initWithTitle:(NSString *)title latitude:(float)latitude longitude:(float)longitude;

@end
