//
//  UIControl+repeat.m
//  runtime_btn
//
//  Created by colorPen on 15/9/15.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//

#import "UIControl+repeat.h"
#import <objc/runtime.h>

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *UIControl_acceptedEventTime   = "UIControl_acceptedEventTime";

@implementation UIControl (repeat)

+ (void)load {
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(__hxh_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (NSTimeInterval)hxh_acceptEventInterval {
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}


- (void)setHxh_acceptEventInterval:(NSTimeInterval)hxh_acceptEventInterval {
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(hxh_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)hxh_acceptedEventTime {
    return [objc_getAssociatedObject(self, UIControl_acceptedEventTime) doubleValue];
}

- (void)setHxh_acceptedEventTime:(NSTimeInterval)hxh_acceptedEventTime {
    objc_setAssociatedObject(self, UIControl_acceptedEventTime, @(hxh_acceptedEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)__hxh_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if ([self hxh_ignoreEvent]) {
        return;
    }
    
    if (self.hxh_acceptEventInterval > 0) {
        self.hxh_acceptedEventTime = NSDate.date.timeIntervalSince1970;
    }
    
    [self __hxh_sendAction:action to:target forEvent:event];
}

- (BOOL)hxh_ignoreEvent {
    return NSDate.date.timeIntervalSince1970 - self.hxh_acceptedEventTime < self.hxh_acceptEventInterval;
}

@end

