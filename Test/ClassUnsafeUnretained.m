//
//  ClassUnsafeUnretained.m
//  Test
//
//  Created by Li Junfeng on 2020/5/4.
//  Copyright © 2020 LiJunfeng. All rights reserved.
//

#import "ClassUnsafeUnretained.h"

@implementation ClassUnsafeUnretained

- (void)print {
    NSLog(@"%@ address: %@", NSStringFromClass(self.class), self);
}

@end
