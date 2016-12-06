//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "AView.h"
#import "Xtrace.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (nonatomic, strong) AView *aView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.testLabel.text = @"潇洒";
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSuperView:)];
    [self.view addGestureRecognizer:tapGesture];
    
    {
        self.aView = [[AView alloc] initWithFrame:CGRectMake(0, 200, 320, 320)];
        self.aView.backgroundColor = [UIColor redColor];
        UITapGestureRecognizer *tapAGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAView:)];
        [self.aView addGestureRecognizer:tapAGesture];
        [self.view addSubview:self.aView];
    }
}

- (IBAction)tapButton:(id)sender
{
    
}

- (void)tapSuperView:(UITapGestureRecognizer *)tap
{
    NSLog(@"tapSuperView");
}

- (void)tapAView:(UITapGestureRecognizer *)tap
{
    NSLog(@"tapAView");
}

@end
