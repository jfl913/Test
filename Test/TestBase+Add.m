//
//  TestBase+Add.m
//  Test
//
//  Created by Li Junfeng on 2020/5/30.
//  Copyright © 2020 LiJunfeng. All rights reserved.
//

#import "TestBase+Add.h"
#import <objc/runtime.h>

@implementation TestBase (Add)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class aClass = [self class];
        
        SEL originalSelector = @selector(logName:);
        SEL swizzledSelector = @selector(swizzle_logName:);
        
        Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
        
        if (originalMethod == nil) {
            NSLog(@"originalMethod: %@", originalMethod);
        }
        
        BOOL isPlanA = YES;
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
                Method replaceMethod = class_getInstanceMethod(aClass, swizzledSelector);
                // 如果父类也没有实现，didAddMethod 里的处理还是会出问题，因为此时 class_replaceMethod 方法无效。
                // 因此，不能在 swizzle_logName 方法里调用 [self swizzle_logName:name]; 如果调用就会导致无限循环，最终崩溃。
                if (replaceMethod == swizzledMethod) {
                    NSLog(@"if originalMethod is nil, class_replaceMethod do nothing.");
                }
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        } else { // Plan B.
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)swizzle_logName:(NSString *)name {
    NSLog(@"swizzle_(%@) %@", NSStringFromSelector(_cmd), name);
    [self swizzle_logName:name];
}

@end
