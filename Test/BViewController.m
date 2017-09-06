//
//  BViewController.m
//  Test
//
//  Created by junfeng.li on 2017/9/6.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "BViewController.h"
#import "CViewController.h"

@interface BViewController ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *closebutton;

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(50, 100, 40, 40);
    [self.button setTitle:@"B" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    self.closebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.closebutton.frame = CGRectMake(50, 300, 40, 40);
    [self.closebutton setTitle:@"B" forState:UIControlStateNormal];
    [self.closebutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.closebutton addTarget:self action:@selector(closebuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.closebutton];
}

- (void)buttonAction:(UIButton *)button {
    CViewController *vc = [CViewController new];
//    [self presentViewController:vc animated:YES completion:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)closebuttonAction:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
