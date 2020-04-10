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
    [self doThreadUnSafeAction];
//    [self doSemaphoreAction];
//    [self testNSMutableArray];
//    [self testNSMutableArrayMemory];
//    [self deadLock];
//    [self noDeadLock];
}

- (void)doThreadUnSafeAction {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSMutableArray *array = @[].mutableCopy;
    for (NSInteger i = 0; i < 100000; i++) {
        dispatch_async(queue, ^{
            [array addObject:[NSNumber numberWithInteger:i]];
        });
    }
}

- (void)doSemaphoreAction {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    NSMutableArray *array = @[].mutableCopy;
    for (NSInteger i = 0; i < 100000; i++) {
        dispatch_async(queue, ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            [array addObject:[NSNumber numberWithInteger:i]];
            NSLog(@"%@-%@", [NSThread currentThread], @(i));
            dispatch_semaphore_signal(semaphore);
        });
    }
}

- (void)testNSMutableArray {
    dispatch_queue_t readQueue = dispatch_queue_create("com.jfl.readQueue", NULL);
    dispatch_queue_t writeQueue = dispatch_queue_create("com.jfl.writeQueue", NULL);
    
    NSMutableArray *array = @[].mutableCopy;
    for (NSInteger i = 0; i < 100; i++) {
        [array addObject:[NSNumber numberWithInteger:i]];
    }
    
    dispatch_async(readQueue, ^{
        for (NSNumber *number in array) {
            NSLog(@"read: %@", number);
        }
    });
    
    dispatch_async(writeQueue, ^{
        for (NSInteger i = 9000; i < 100000; i++) {
            [array addObject:[NSNumber numberWithInteger:i]];
        }
    });
}

- (void)testNSMutableArrayMemory {
    NSString *str = @"11";
   NSLog(@"字符串常量的地址  %p", str);
   NSMutableArray *array = [NSMutableArray arrayWithCapacity:1];
   for (int i = 0; i < 10; i ++) {
       [array addObject:@"11"];
   }
}

- (void)deadLock {
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"同步任务在 %@ 执行", [NSThread currentThread]);
//    });
    
//    dispatch_queue_t serialQueue = dispatch_queue_create("com.gcd.serial", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(serialQueue, ^{
//        NSLog(@"异步任务在 %@ 执行", [NSThread currentThread]);
//        dispatch_sync(serialQueue, ^{
//            NSLog(@"同步任务在 %@ 执行", [NSThread currentThread]);
//        });
//    });
    
    
    NSLog(@"同步任务0在 %@ 执行", [NSThread currentThread]);
    dispatch_queue_t serialQueue = dispatch_queue_create("com.gcd.serial", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(serialQueue, ^{
        NSLog(@"同步任务1在 %@ 执行", [NSThread currentThread]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"同步任务2在 %@ 执行", [NSThread currentThread]);
        });
    });
}

- (void)noDeadLock {
    dispatch_queue_t serialQueue = dispatch_queue_create("com.gcd.serial", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.gcd.concurrent", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(serialQueue, ^{
        NSLog(@"before 异步任务在 %@ 执行", [NSThread currentThread]);
        dispatch_sync(concurrentQueue, ^{
            NSLog(@"同步任务在 %@ 执行", [NSThread currentThread]);
        });
        NSLog(@"after 异步任务在 %@ 执行", [NSThread currentThread]);
    });
    
//    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.gcd.concurrent", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(concurrentQueue, ^{
//        NSLog(@"异步任务在 %@ 执行", [NSThread currentThread]);
//        dispatch_sync(concurrentQueue, ^{
//            NSLog(@"同步任务在 %@ 执行", [NSThread currentThread]);
//        });
//    });
}

@end
