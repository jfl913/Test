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
}

@end
