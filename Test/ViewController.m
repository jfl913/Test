//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"
#import "NSString+HTML.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)tapButton:(id)sender
{
    NSString *test = @"<font color=\"#999999\">2</font>";
    NSString *result = [test cm_stringByTrimmingHTMLTags];
    NSLog(@"%@", result);
}

@end
