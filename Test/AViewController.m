//
//  AViewController.m
//  Test
//
//  Created by junfeng.li on 2017/9/6.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "AViewController.h"
#import "ModalContainerViewController.h"
#import "BViewController.h"

@interface AViewController ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *closebutton;

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"A";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(50, 100, 90, 40);
    [self.button setTitle:@"present-B" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    self.closebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.closebutton.frame = CGRectMake(50, 300, 60, 40);
    [self.closebutton setTitle:@"pop-A" forState:UIControlStateNormal];
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
    BViewController *vc = [BViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.hidden = YES;
    
    ModalContainerViewController *modalVC = [ModalContainerViewController new];
    modalVC.contentViewController = nav;
    
    [self presentViewController:modalVC animated:YES completion:nil];
}

- (void)closebuttonAction:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
