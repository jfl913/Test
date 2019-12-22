//
//  Parent.m
//  Test
//
//  Created by Li Junfeng on 2019/12/22.
//  Copyright © 2019 LiJunfeng. All rights reserved.
//

#import "Parent.h"

@implementation Parent

- (void)printName {
    NSLog(@"Parent");
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return [super forwardingTargetForSelector:aSelector];
}

+ (id)forwardingTargetForSelector:(SEL)aSelector {
    return [super forwardingTargetForSelector:aSelector];
}

@end
