//
//  Teacher.m
//  Test
//
//  Created by Li Junfeng on 2020/4/22.
//  Copyright © 2020 LiJunfeng. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

+ (void)load {
    NSLog(@"%s", __FUNCTION__);
}

+ (void)initialize {
    NSLog(@"before %s", __FUNCTION__);
    if (self == [Person class]) {
        NSLog(@"%s", __FUNCTION__);
    }
}

@end
