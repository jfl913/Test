//
//  AViewController.m
//  Test
//
//  Created by junfeng.li on 2017/12/5.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "RedViewController.h"
#import "YellowViewController.h"

@interface RedViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.button.frame = CGRectMake(100, 100, 50, 40);
    [self.view addSubview:self.button];
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

#pragma mark - Push

- (void)push:(UIButton *)button {
    YellowViewController *viewController = [YellowViewController new];
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - Accessor

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"跳转" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

@end
