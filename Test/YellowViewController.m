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

@property (nonatomic, strong) BlueViewController *blueVC;

@end

@implementation YellowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self addBlue];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"移除蓝色" style:UIBarButtonItemStylePlain target:self action:@selector(removeBlue:)];
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

#pragma mark - Method

- (void)addBlue {
    [self addChildViewController:self.blueVC];
    [self.view addSubview:self.blueVC.view];
    [self.blueVC didMoveToParentViewController:self];
}

- (void)removeBlue:(UIBarButtonItem *)barButtonItem {
    [self.blueVC willMoveToParentViewController:nil];
    [self.blueVC.view removeFromSuperview];
    [self.blueVC removeFromParentViewController];
}

#pragma mark - Accessor

- (BlueViewController *)blueVC {
    if (!_blueVC) {
        _blueVC = [BlueViewController new];
    }
    return _blueVC;
}

@end
