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
    Method b = class_getInstanceMethod(self, @selector(__uxy_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (NSTimeInterval)uxy_acceptEventInterval {
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setUxy_acceptEventInterval:(NSTimeInterval)uxy_acceptEventInterval {
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(uxy_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)uxy_acceptedEventTime {
    return [objc_getAssociatedObject(self, UIControl_acceptedEventTime) doubleValue];
}

- (void)setUxy_acceptedEventTime:(NSTimeInterval)uxy_acceptedEventTime {
    objc_setAssociatedObject(self, UIControl_acceptedEventTime, @(uxy_acceptedEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)__uxy_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if ([self uxy_ignoreEvent]) {
        return;
    }
    
    if (self.uxy_acceptEventInterval > 0) {
        self.uxy_acceptedEventTime = NSDate.date.timeIntervalSince1970;
    }
    
    [self __uxy_sendAction:action to:target forEvent:event];
}

- (BOOL)uxy_ignoreEvent {
    return NSDate.date.timeIntervalSince1970 - self.uxy_acceptedEventTime < self.uxy_acceptEventInterval;
}

@end

