//
//  CViewController.m
//  Test
//
//  Created by junfeng.li on 2017/9/6.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "CViewController.h"

@interface CViewController ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *closebutton;

@end

@implementation CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(50, 50, 80, 40);
    [self.button setTitle:@"pop-C" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    self.closebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.closebutton.frame = CGRectMake(50, 300, 100, 40);
    [self.closebutton setTitle:@"dismiss-C" forState:UIControlStateNormal];
    [self.closebutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.closebutton addTarget:self action:@selector(closebuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.closebutton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@-%@",NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@-%@",NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%@-%@",NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%@-%@",NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}

- (void)buttonAction:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)closebuttonAction:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
