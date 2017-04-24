//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"
#import "Xtrace.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.testLabel.text = @"潇洒";
}

- (IBAction)tapButton:(id)sender
{
    NSComparisonResult result1 = [@"A" compare:@"B"];
    NSLog(@"A compare B : %ld", (long)result1);
    
    NSComparisonResult result2 = [@"2017-03-10" compare:@"2017-04-24"];
    NSLog(@"2017-03-10 compare 2017-04-24 : %ld", (long)result2);
}

@end
