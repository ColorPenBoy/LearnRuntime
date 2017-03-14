//
//  HXHAutoDictionary.m
//  xxx
//
//  Created by colorpen on 2017/3/14.
//  Copyright © 2017年 Bitauto. All rights reserved.
//

#import "HXHAutoDictionary.h"
#import <objc/runtime.h>

/** 使用动态方法解析，实现dynamic属性 */
@interface HXHAutoDictionary ()

@property (strong, nonatomic) NSMutableDictionary *backingStore;

@end

@implementation HXHAutoDictionary
@dynamic string, number, date, opaqueObject;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _backingStore = [NSMutableDictionary new];
    }
    return self;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSString * selectorStr = NSStringFromSelector(sel);
    
    if ([selectorStr hasPrefix:@"set"]) {
        class_addMethod(self, sel, (IMP)autoDictionarySetter, "v@:@");
    } else {
        class_addMethod(self, sel, (IMP)autoDictionaryGetter, "@@:");
    }
    return true;
}

/** Getter */
id autoDictionaryGetter(id self, SEL _cmd) {

    HXHAutoDictionary * typedSelf = (HXHAutoDictionary *)self;
    
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    
    NSString *key = NSStringFromSelector(_cmd);
    
    return [backingStore objectForKey:key];
}

/** Setter */
void autoDictionarySetter(id self, SEL _cmd, id value) {
    
    HXHAutoDictionary * typedSelf = (HXHAutoDictionary *)self;
    
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    
    NSString *selectorString = NSStringFromSelector(_cmd);
    
    NSMutableString * key = [selectorString mutableCopy];
    
    // 函数末尾 移除 ":"
    [key deleteCharactersInRange:NSMakeRange(key.length - 1, 1)];
    
    // 移除"set"
    [key deleteCharactersInRange:NSMakeRange(0, 3)];

    // 小写第一个字母
    NSString * lowercaseFirstChar = [[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:lowercaseFirstChar];
    
    if (value) {
        [backingStore setObject:value forKey:key];
    } else {
        [backingStore removeObjectForKey:key];
    }
}


@end
