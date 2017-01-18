//
//  MethodType.m
//  Test
//
//  Created by LiJunfeng on 2017/1/18.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "MethodType.h"
#import <objc/runtime.h>

@implementation MethodType

- (int)testInstanceMethod:(NSString *)name andValue:(NSNumber *)value
{
    NSLog(@"%@", name);
    
    return value.intValue;
}

- (NSArray *)arrayWithNames:(NSArray *)names
{
    NSLog(@"%@", names);
    return names;
}

- (void)getMethods
{
    unsigned int outCount = 0;
    Method *methodList = class_copyMethodList(self.class, &outCount);
    for (unsigned int i = 0; i < outCount; i++) {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        NSLog(@"方法名: %@", NSStringFromSelector(methodName));
        
        unsigned int argCount = method_getNumberOfArguments(method);
        char argType[512] = {};
        for (unsigned int j = 0; j < argCount; j++) {
            method_getArgumentType(method, j, argType, 512);
            NSLog(@"第%u个参数类型为: %s", j, argType);
            memset(argType, 0, strlen(argType));
        }
        
        char returnType[512] = {};
        method_getReturnType(method, returnType, 512);
        NSLog(@"返回值类型为: %s", returnType);
        
        const char *argReturnType = method_getTypeEncoding(method);
        NSLog(@"返回值参数类型为: %s", argReturnType);
    }
    free(methodList);
}

@end
