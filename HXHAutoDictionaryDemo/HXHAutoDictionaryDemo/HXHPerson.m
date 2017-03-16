//
//  HXHPerson.m
//  HXHAutoDictionaryDemo
//
//  Created by colorpen on 2017/3/15.
//  Copyright © 2017年 Bitauto. All rights reserved.
//

#import "HXHPerson.h"

@implementation HXHPerson

- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    if (self = [super init]) {
        _firstName = [firstName copy];
        _lastName = [lastName copy];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p, %@ %@>",[self class], self, _firstName, _lastName];
}

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"<%@: %p, %@ %@>",[self class], self, _firstName, _lastName];
}

@end
