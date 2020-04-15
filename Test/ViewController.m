//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) BOOL end;

@property (nonatomic, strong) NSPort *emptyPort;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self test];
}

- (IBAction)tapButton:(id)sender {
//    [self memoryTest];
//    NSLog(@"李俊峰");
//    [self test];
//    self.end = YES;
    
    [self test];
    
//    [self performSelector:@selector(testVC) onThread:[self.class shareThread] withObject:nil waitUntilDone:NO];

}

- (void)memoryTest {
    for (int i = 0; i < 100000; ++i) {
        NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
        [thread start];
    }
}

- (void)run {
    @autoreleasepool {
        NSLog(@"current thread = %@", [NSThread currentThread]);
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        if (!self.emptyPort) {
            self.emptyPort = [NSMachPort port];
        }
        [runLoop addPort:self.emptyPort forMode:NSDefaultRunLoopMode];
        [runLoop run];
    }
}

- (void)test {
    NSLog(@"start new thread …");
    [NSThread detachNewThreadSelector:@selector(runOnNewThread) toTarget:self withObject:nil];
    
    
    while (!self.end) {
        NSLog(@"runloop…");
        BOOL runBool = [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        NSLog(@"runBool: %@", [NSNumber numberWithBool:runBool]);
        NSLog(@"runloop end.");
    }
    
    NSLog(@"ok.");
}

-(void)runOnNewThread{
     NSLog(@"run for new thread …");
    sleep(1);
    self.end=YES;
    NSLog(@"end.");
}

+(NSThread*)shareThread {
    
    static NSThread *thread = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        thread = [[NSThread alloc] initWithTarget:self selector:@selector(testShareThread) object:nil];
        
        [thread setName:@"WT share thread test"];
        
        [thread start];
    });
    return thread;
}

+(void)testShareThread {
    NSLog(@"%@ - %@ start", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [[NSRunLoop currentRunLoop] addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
    static BOOL flag = NO;
    while (!flag) {
        NSLog(@"before");
        // 会阻塞线程，没有输入源就不会执行后面的语句。
        BOOL runBool = [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        NSLog(@"after");
        NSLog(@"runBool: %@", [NSNumber numberWithBool:runBool]);
    }
}

-(void)testVC {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

@end
