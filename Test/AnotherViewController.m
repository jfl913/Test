//
//  AnotherViewController.m
//  Test
//
//  Created by junfeng.li on 2017/6/22.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "AnotherViewController.h"

@interface AnotherViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation AnotherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Another";
}

- (IBAction)startTimer:(id)sender {
    [self stopTimer:nil];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2
                                                  target:self
                                                selector:@selector(print:)
                                                userInfo:nil
                                                 repeats:YES];
    
//    self.timer = [NSTimer timerWithTimeInterval:2
//                                         target:self
//                                       selector:@selector(print:)
//                                       userInfo:nil
//                                        repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (IBAction)stopTimer:(id)sender {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (IBAction)fire:(id)sender {
    // 这个方法可以不打断已经启动的定时器，可以单独控制执行。
    [self.timer fire];
}

- (void)print:(NSTimer *)timer {
    NSLog(@"Test");
}

// 或许你想在dealloc方法中使定时器失效,
// 那你就太天真了.此时定时器还保留着当前控制器,此方法是不可能调用的
- (void)dealloc {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
