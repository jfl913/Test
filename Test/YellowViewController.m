//
//  YellowViewController.m
//  Test
//
//  Created by junfeng.li on 2017/12/5.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "YellowViewController.h"
#import "BlueViewController.h"

@interface YellowViewController ()

@end

@implementation YellowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    BlueViewController *childViewController = [BlueViewController new];
    [self addChildViewController:childViewController];
    [self.view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"%@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"%@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"%@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"%@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

@end
