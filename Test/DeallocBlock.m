//
//  DeallocBlock.m
//  Test
//
//  Created by Li Junfeng on 2020/5/5.
//  Copyright © 2020 LiJunfeng. All rights reserved.
//

#import "DeallocBlock.h"

@implementation DeallocBlock

- (instancetype)initWithBlock:(Block)block {
    self = [super init];
    if (self) {
        self.block = block;
    }
    return self;
}

- (void)dealloc {
    if (self.block) {
        NSLog(@"%s", __FUNCTION__);
        self.block();
    }
}

@end
