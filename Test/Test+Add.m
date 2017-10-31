//
//  Test+Add.m
//  Test
//
//  Created by junfeng.li on 2017/10/31.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "Test+Add.h"
#import <objc/runtime.h>

@implementation Test (Add)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class aClass = [self class];
        
        SEL originalSelector = @selector(logName:);
        SEL swizzledSelector = @selector(sw_logName:);
        
        Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
        BOOL didAddMethod =
        class_addMethod(aClass,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(aClass,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)sw_logName:(NSString *)name {
    NSLog(@"sw_%@: %@", NSStringFromSelector(_cmd), name);
    [self sw_logName:name];
}

@end
