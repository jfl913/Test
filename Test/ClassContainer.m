//
//  ClassContainer.m
//  Test
//
//  Created by Li Junfeng on 2020/5/4.
//  Copyright © 2020 LiJunfeng. All rights reserved.
//

#import "ClassContainer.h"
#import "NSObject+DeallocBlock.h"

@implementation ClassContainer

- (void)setUnsafeUnretainedObject:(ClassUnsafeUnretained *)unsafeUnretainedObject {
    _unsafeUnretainedObject = unsafeUnretainedObject;
    if (_unsafeUnretainedObject) {
        [_unsafeUnretainedObject runBlockOnDealloc:^{
            _unsafeUnretainedObject = nil;
            NSLog(@"ClassContainer->unsafeUnretainedObject = nil");
        }];
    }
}

@end
