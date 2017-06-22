//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "AnotherViewController.h"
#import "BlocksKitTimerViewController.h"
#import <BlocksKit.h>

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)tapButton:(id)sender
{
    AnotherViewController *anotherVC= [AnotherViewController new];
    [self.navigationController pushViewController:anotherVC animated:YES];
}

- (IBAction)tapBlocksKitNSTimerButton:(id)sender {
    BlocksKitTimerViewController *blocksKitTimerVC = [BlocksKitTimerViewController new];
    [self.navigationController pushViewController:blocksKitTimerVC animated:YES];
}

@end
