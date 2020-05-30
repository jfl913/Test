 //
//  main.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

void (^block)(void);
void test()
{
    // __NSStackBlock__
    int a = 10;
    block = ^{
        NSLog(@"block---------%d", a);
    };
}

int main(int argc, char * argv[]) {
    @autoreleasepool {
//        test();
//        block();
//        block();
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
