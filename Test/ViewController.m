//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"

@interface ViewController ()

@property (nonatomic, strong) Test *test;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)tapButton:(id)sender
{
    [self.test logName:@"jfl"];
}

#pragma mark - Accessor

- (Test *)test {
    if (!_test) {
        _test = [Test new];
    }
    return _test;
}

@end
