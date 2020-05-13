//
//  DeallocMonitor.m
//  Test
//
//  Created by Li Junfeng on 2020/5/6.
//  Copyright © 2020 LiJunfeng. All rights reserved.
//

#import "DeallocMonitor.h"

@implementation DeallocMonitor

- (void)dealloc {
    NSLog(@"%@ dealloc", self.name);
}

@end
