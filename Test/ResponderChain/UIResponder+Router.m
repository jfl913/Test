//
//  UIResponder+Router.m
//  Test
//
//  Created by junfeng.li on 2017/8/1.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)

- (void)jf_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    [[self nextResponder] jf_routerEventWithName:eventName userInfo:userInfo];
}

- (NSInvocation *)jf_createInvocationWithSelector:(SEL)aSelector {
    NSMethodSignature *methodSignature = [self methodSignatureForSelector:aSelector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    invocation.target = self;
    invocation.selector = aSelector;
    return invocation;
}

@end
