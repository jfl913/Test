//
//  BlocksKitTimerViewController.m
//  Test
//
//  Created by junfeng.li on 2017/6/22.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "BlocksKitTimerViewController.h"
#import <BlocksKit.h>

@interface BlocksKitTimerViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation BlocksKitTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)startTimer:(id)sender {
    [self stopTimer:nil];
    // 必须要用weakSelf要不然会导致循环引用
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer bk_scheduledTimerWithTimeInterval:2
                                                      block:^(NSTimer *timer) {
                                                          [weakSelf print:timer];
                                                      } repeats:YES];
}

- (IBAction)stopTimer:(id)sender {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)print:(NSTimer *)timer {
    NSLog(@"Test");
}

// 用bk_scheduledTimerWithTimeInterval创建的timer是可以调到dealloc方法的
- (void)dealloc {
    [self stopTimer:nil];
}

@end
