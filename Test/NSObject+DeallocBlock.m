//
//  NSObject+DeallocBlock.m
//  Test
//
//  Created by Li Junfeng on 2020/5/5.
//  Copyright © 2020 LiJunfeng. All rights reserved.
//

#import "NSObject+DeallocBlock.h"
#import <objc/runtime.h>

@implementation NSObject (DeallocBlock)

- (void)runBlockOnDealloc:(Block)block {
    if (block) {
        DeallocBlock *deallocBlock = [[DeallocBlock alloc] initWithBlock:block];
        objc_setAssociatedObject(self, _cmd, deallocBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

@end
