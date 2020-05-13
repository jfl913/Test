//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "DeallocMonitor.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)tapButton:(id)sender {
//    [self testWeak];
    [self testInvalidStrong];
//    [self testValidStrong];
}

- (void)testWeak {
    DeallocMonitor *strongMonitor = [DeallocMonitor new];
    strongMonitor.name = @"strong";
    
    DeallocMonitor *weakOriginMonitor = [DeallocMonitor new];
    weakOriginMonitor.name = @"weak";
    
    __weak typeof(weakOriginMonitor) weakMonitor = weakOriginMonitor;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"5s 已到 strongMonitor = %@", strongMonitor);
        NSLog(@"5s 已到 weakMonitor = %@", weakMonitor);
    });
    
    NSLog(@"end");
}

// 即使加了strong, 也不能保证weakObject指向的对象不会被释放。
- (void)testInvalidStrong {
    DeallocMonitor *monitor = [DeallocMonitor new];
    monitor.name = @"invalid strong";
    __weak typeof(monitor) weakMonitor = monitor;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 该strongMonitor的申明仅在block执行时才见效, 而外部作用域一结束monitor就已经被释放了, 所以然并卵
        __strong typeof(weakMonitor) strongMonitor = weakMonitor;
        NSLog(@"5s 已到 strongMonitor = %@", strongMonitor);
    });
    
    NSLog(@"end");
}

// Block内部申明的强引用指针变量指向weakObject仅在block执行时才有效。
- (void)testValidStrong {
    DeallocMonitor *monitor = [DeallocMonitor new];
    monitor.name = @"valid strong";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
        NSLog(@"果断强引用 monitor： %@，还能再坚持 2.5s。", monitor);
    });
    
    __weak typeof(monitor) weakMonitor = monitor;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
        __strong typeof(weakMonitor) strongMonitor = weakMonitor;
        sleep(3);
        NSLog(@"5s 已到 strongMonitor = %@", strongMonitor);
    });
    
    NSLog(@"end");
}



@end
