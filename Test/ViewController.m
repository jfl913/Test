//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSLock *lock;
@property (nonatomic, strong) NSRecursiveLock *recursiveLock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.count = 5;
    self.lock = [NSLock new];
    self.recursiveLock = [NSRecursiveLock new];
}

- (IBAction)tapButton:(id)sender {
//    [self testSynchronized];
//    [self testNSLock];
    [self testNSRecursiveLock];
}

- (void)testSynchronized {
    if (self.count > 0) {
        @synchronized (self) {
            NSLog(@"count = %@", @(self.count));
            self.count = self.count - 1;
            [self testSynchronized];
        }
    }
}

- (void)testNSLock {
    [self.lock lock];
    if (self.count > 0) {
        NSLog(@"count = %@", @(self.count));
        self.count = self.count - 1;
        [self testNSLock];
    }
    [self.lock unlock];
}

- (void)testNSRecursiveLock {
    [self.recursiveLock lock];
    if (self.count > 0) {
        NSLog(@"count = %@", @(self.count));
        self.count = self.count - 1;
        [self testNSRecursiveLock];
    }
    [self.recursiveLock unlock];
}

@end
