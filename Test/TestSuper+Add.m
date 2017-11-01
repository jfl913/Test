//
//  TestSuper+Add.m
//  Test
//
//  Created by junfeng.li on 2017/11/1.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "TestSuper+Add.h"
#import <objc/runtime.h>

@implementation TestSuper (Add)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class aClass = [self class];
        
        SEL originalSelector = @selector(logName:);
        SEL swizzledSelector = @selector(super_swizzle_logName:);
        
        Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
        
        BOOL isPlanA = NO;
        if (isPlanA) { // Plan A.
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
        } else { // Plan B.
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)super_swizzle_logName:(NSString *)name {
    NSLog(@"super_swizzle_(%@) %@", NSStringFromSelector(_cmd), name);
    [self super_swizzle_logName:name];
}

@end
