//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)tapButton:(id)sender {
//    [self testMRCBlockType];
    [self testMRCStackBlock];
}

// 需要设置成 MRC 环境。
// https://www.jianshu.com/p/115e6d9d956c
- (void)testMRCBlockType {
    void (^globalBlock)(void) = ^{
        NSLog(@"globalBlock");
    };
    
    NSInteger a = 10;
    void (^stackBlock)(void) = ^{
        NSLog(@"stackBlock a = %@", @(a));
    };
    
    NSLog(@"globalBlock type: %@, stackBlock type: %@", [globalBlock class], [stackBlock class]);
    NSLog(@"mallocBlock type: %@", [[stackBlock copy] class]);
}

void (^stackBlock)(void);

- (void)testMRCStackBlock {
    NSLog(@"stackBlock type: %@", [stackBlock class]);
    [self createMRCStackBlock];
    stackBlock();
    // 再调一次就会崩溃。
    stackBlock();
}



- (void)createMRCStackBlock {
    NSInteger a = 11;
    stackBlock = ^{
        NSLog(@"stackBlock a = %@", @(a));
    };
//    stackBlock = [^{
//        NSLog(@"stackBlock a = %@", @(a));
//    } copy];
    NSLog(@"stackBlock reference auto var type: %@", [stackBlock class]);
}

- (void)

@end
