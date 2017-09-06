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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(50, 100, 40, 40);
    [self.button setTitle:@"C" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    self.closebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.closebutton.frame = CGRectMake(50, 300, 40, 40);
    [self.closebutton setTitle:@"C" forState:UIControlStateNormal];
    [self.closebutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.closebutton addTarget:self action:@selector(closebuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.closebutton];
}

- (void)buttonAction:(UIButton *)button {
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)closebuttonAction:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
