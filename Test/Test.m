//
//  Test.m
//  Test
//
//  Created by LiJunfeng on 2016/11/17.
//  Copyright © 2016年 LiJunfeng. All rights reserved.
//

#import "Test.h"

@implementation Test

- (void)logName:(NSString *)name {
    NSLog(@"origin_(%@) %@", NSStringFromSelector(_cmd), name);
}

@end
