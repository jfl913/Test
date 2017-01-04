//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"
#import "Xtrace.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.testLabel.text = @"潇洒";
}

- (IBAction)tapButton:(id)sender
{
//    [self testBarrierAsync];
//    [self testGroup];
//    [self testSync];
    [self testApply];
}

- (void)testBarrierAsync
{
    dispatch_queue_t queue = dispatch_queue_create("com.gcd.barrier", DISPATCH_QUEUE_CONCURRENT);
    
    __block NSInteger i = 0;
    
    {
        dispatch_async(queue, ^{
            NSLog(@"Index Before: %ld", (long)i);
            i++;
        });
        
        dispatch_async(queue, ^{
            NSLog(@"Index Before: %ld", (long)i);
            i++;
        });
        
        dispatch_async(queue, ^{
            NSLog(@"Index Before: %ld", (long)i);
            i++;
        });
        
        dispatch_async(queue, ^{
            NSLog(@"Index Before: %ld", (long)i);
            i++;
        });
        
    }
    
    {
        dispatch_barrier_async(queue, ^{
            NSLog(@"Index Middle: %ld", (long)i);
            i++;
        });
        
        dispatch_barrier_async(queue, ^{
            NSLog(@"Index Middle: %ld", (long)i);
            i++;
        });
        
        dispatch_barrier_async(queue, ^{
            NSLog(@"Index Middle: %ld", (long)i);
            i++;
        });
        
        dispatch_barrier_async(queue, ^{
            NSLog(@"Index Middle: %ld", (long)i);
            i++;
        });
        
        dispatch_barrier_async(queue, ^{
            NSLog(@"Index Middle: %ld", (long)i);
            i++;
        });
        
        dispatch_barrier_async(queue, ^{
            NSLog(@"Index Middle: %ld", (long)i);
            i++;
        });
    }
    
    {
        dispatch_async(queue, ^{
            NSLog(@"Index After: %ld", (long)i);
            i++;
        });
        
        dispatch_async(queue, ^{
            NSLog(@"Index After: %ld", (long)i);
            i++;
        });
        
        dispatch_async(queue, ^{
            NSLog(@"Index After: %ld", (long)i);
            i++;
        });
    }
    
    NSLog(@"jfl");
}

- (void)testGroup
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    __block NSInteger i = 0;
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"Index: %ld", i);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"Index: %ld", i);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"Index: %ld", i);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"Index: %ld", i);
    });
    
//    dispatch_group_notify(group, queue, ^{
//        NSLog(@"Done.");
//    });
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    NSLog(@"jfl");
}

- (void)testSync
{
    dispatch_queue_t queue  = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 10000; i++) {
            NSLog(@"Index: %ld", i);
        }
    });
    
    NSLog(@"jfl");
}

- (void)testApply
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t anotherQueue = dispatch_queue_create("com.gcd.apply", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        dispatch_apply(1000, queue, ^(size_t index) {
            NSLog(@"Index: %zu", index);
        });
        
        dispatch_async(anotherQueue, ^{
            NSLog(@"jfl");
        });
        
        NSLog(@"Done.");
    });
    
    
    
}

@end
