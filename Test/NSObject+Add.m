//
//  NSObject+Add.m
//  Test
//
//  Created by Li Junfeng on 2019/12/22.
//  Copyright © 2019 LiJunfeng. All rights reserved.
//

#import "NSObject+Add.h"
#import <JRSwizzle/JRSwizzle.h>
#import <objc/runtime.h>

@implementation NSObject (Add)

+ (void)load {
    [[self class] jr_swizzleMethod:@selector(forwardingTargetForSelector:) withMethod:@selector(jl_forwardingTargetForSelector:) error:nil];
}

- (id)jl_forwardingTargetForSelector:(SEL)selector {
    // 创建一个新类
    NSString *errClassName = NSStringFromClass([self class]);
    NSString *errSel = NSStringFromSelector(selector);
    NSLog(@"出问题的类，出问题的对象方法 == %@ %@", errClassName, errSel);
    
    NSString *className = @"CrachClass";
    Class cls = NSClassFromString(className);
    
    // 如果类不存在 动态创建一个类
    if (!cls) {
        Class superClsss = [NSObject class];
        cls = objc_allocateClassPair(superClsss, className.UTF8String, 0);
        // 注册类
        objc_registerClassPair(cls);
    }
    // 如果类没有对应的方法，则动态添加一个
    if (!class_getInstanceMethod(NSClassFromString(className), selector)) {
        class_addMethod(cls, selector, (IMP)Crash, "@@:@");
    }
    // 把消息转发到当前动态生成类的实例对象上
    return [[cls alloc] init];
}

//- (id)jl_forwardingTargetForSelector:(SEL)selector {
//    SEL forwarding_sel = @selector(forwardingTargetForSelector:);
//        
//    // 获取 NSObject 的消息转发方法
//    Method root_forwarding_method = class_getInstanceMethod([NSObject class], forwarding_sel);
//    // 获取 当前类 的消息转发方法
//    Method current_forwarding_method = class_getInstanceMethod([self class], forwarding_sel);
//    
//    // 判断当前类本身是否实现第二步:消息接受者重定向
//    BOOL realize = method_getImplementation(current_forwarding_method) != method_getImplementation(root_forwarding_method);
//    
//    // 如果没有实现第二步:消息接受者重定向
//    // note: jfl 这里写的不对。
//    // note: jfl 不需要判断子类里是否重写了 forwardingTargetForSelector 方法。因为运行到 NSObject 分类的防崩溃代码的时候，肯定是子类 forwardingTargetForSelector 方法没有处理的情况。因为会先走子类 forwardingTargetForSelector 的方法，再到 NSObject 分类。
//    // note: jfl 如果像这样写只要子类里有 forwardingTargetForSelector 方法的实现，一样会崩溃。
//    if (!realize) {
//        // 判断有没有实现第三步:消息重定向
//        SEL methodSignature_sel = @selector(methodSignatureForSelector:);
//        Method root_methodSignature_method = class_getInstanceMethod([NSObject class], methodSignature_sel);
//        
//        Method current_methodSignature_method = class_getInstanceMethod([self class], methodSignature_sel);
//        realize = method_getImplementation(current_methodSignature_method) != method_getImplementation(root_methodSignature_method);
//        
//        // 如果没有实现第三步:消息重定向
//        if (!realize) {
//            // 创建一个新类
//            NSString *errClassName = NSStringFromClass([self class]);
//            NSString *errSel = NSStringFromSelector(selector);
//            NSLog(@"出问题的类，出问题的对象方法 == %@ %@", errClassName, errSel);
//            
//            NSString *className = @"CrachClass";
//            Class cls = NSClassFromString(className);
//            
//            // 如果类不存在 动态创建一个类
//            if (!cls) {
//                Class superClsss = [NSObject class];
//                cls = objc_allocateClassPair(superClsss, className.UTF8String, 0);
//                // 注册类
//                objc_registerClassPair(cls);
//            }
//            // 如果类没有对应的方法，则动态添加一个
//            if (!class_getInstanceMethod(NSClassFromString(className), selector)) {
//                class_addMethod(cls, selector, (IMP)Crash, "@@:@");
//            }
//            // 把消息转发到当前动态生成类的实例对象上
//            return [[cls alloc] init];
//        }
//    }
//    return [self jl_forwardingTargetForSelector:selector];
//}

// 动态添加的方法实现
static int Crash(id slf, SEL selector) {
    NSLog(@"deal crash");
    return 0;
}

@end
