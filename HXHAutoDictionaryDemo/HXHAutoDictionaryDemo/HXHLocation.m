//
//  HXHLocation.m
//  HXHAutoDictionaryDemo
//
//  Created by colorpen on 2017/3/15.
//  Copyright © 2017年 Bitauto. All rights reserved.
//

#import "HXHLocation.h"

@implementation HXHLocation

- (id)initWithTitle:(NSString *)title latitude:(float)latitude longitude:(float)longitude {
    if (self = [super init]) {
        _title = [title copy];
        _latitude = latitude;
        _longitude = longitude;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p, %@>",
            [self class],
            self,
            @{@"title" : _title,
              @"latitude" : @(_latitude),
              @"longitude" : @(_longitude)}];
}

@end
