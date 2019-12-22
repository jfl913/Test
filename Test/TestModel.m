//
//  TestModel.m
//  Test
//
//  Created by Li Junfeng on 2019/12/20.
//  Copyright © 2019 LiJunfeng. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel

- (instancetype)init
{
    self = [super init];
    if (self) {
//        NSLog(@"self: %@", [self class]);
//        NSLog(@"super: %@", [super class]);
//        if ([self class] == [super class]) {
//            NSLog(@"self == super");
//        }
        [self class];
        [super class];
    }
    return self;
}

@end
