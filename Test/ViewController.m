//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"
#import "TestSuper.h"
#import "TestBase.h"

@interface ViewController ()

@property (nonatomic, strong) Test *test;
@property (nonatomic, strong) TestSuper *testSuper;
@property (nonatomic, strong) TestBase *testBase;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)tapButton:(id)sender
{
//    [self.test logName:@"jfl"];
//    [self.testSuper logName:@"jfl"];
    [self.testBase logName:@"jfl"];
}

#pragma mark - Accessor

- (Test *)test {
    if (!_test) {
        _test = [Test new];
    }
    return _test;
}

- (TestSuper *)testSuper {
    if (!_testSuper) {
        _testSuper = [TestSuper new];
    }
    return _testSuper;
}

- (TestBase *)testBase {
    if (!_testBase) {
        _testBase = [TestBase new];
    }
    return _testBase;
}

@end
