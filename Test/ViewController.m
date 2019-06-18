//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"
#import "AViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"首页";
}

- (IBAction)tapButton:(id)sender
{
    AViewController *vc = [AViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
