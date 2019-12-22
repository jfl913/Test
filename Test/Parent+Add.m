//
//  Parent+Add.m
//  Test
//
//  Created by Li Junfeng on 2019/12/22.
//  Copyright © 2019 LiJunfeng. All rights reserved.
//

#import "Parent+Add.h"
#import <JRSwizzle/JRSwizzle.h>

@implementation Parent (Add)

+ (void)load {
    [[self class] jr_swizzleMethod:@selector(printName) withMethod:@selector(jl_printName) error:nil];
}

//- (void)printName {
//    NSLog(@"Parent+Add");
//}

- (void)jl_printName {
    NSLog(@"jl_printName");
    [self jl_printName];
}

@end
