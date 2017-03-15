//
//  HXHPerson.h
//  HXHAutoDictionaryDemo
//
//  Created by colorpen on 2017/3/15.
//  Copyright © 2017年 Bitauto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXHPerson : NSObject

@property (copy, nonatomic, readonly) NSString *firstName;
@property (copy, nonatomic, readonly) NSString *lastName;

- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;

@end
