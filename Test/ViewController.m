//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "BlueView.h"
#import "GreenView.h"
#import "BlackView.h"
#import "RedView.h"
#import "Xtrace.h"

@interface ViewController ()

@property (nonatomic, strong) BlueView *aView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSuperView:)];
//    [self.view addGestureRecognizer:tapGesture];
//
//    {
//        self.aView = [[AView alloc] initWithFrame:CGRectMake(0, 200, 320, 100)];
//        self.aView.backgroundColor = [UIColor redColor];
//        UITapGestureRecognizer *tapAGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAView:)];
//        [self.aView addGestureRecognizer:tapAGesture];
//        [self.view addSubview:self.aView];
//    }
//
//    {
//        UIButton *nilTargetButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        nilTargetButton.frame = CGRectMake(20, 500, 140, 40);
//        [nilTargetButton setTitle:@"nilTarget" forState:UIControlStateNormal];
//        [nilTargetButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//        [nilTargetButton addTarget:nil action:@selector(nilTargetButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:nilTargetButton];
//    }
    
    {
        self.view.backgroundColor = [UIColor purpleColor];
        
        BlueView *blueView = [[BlueView alloc] initWithFrame:CGRectMake(0, 80, 200, 40)];
        blueView.backgroundColor = [UIColor blueColor];
        [self.view addSubview:blueView];
        
        GreenView *greenView = [[GreenView alloc] initWithFrame:CGRectMake(0, 121, 200, 40)];
        greenView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:greenView];
        
        BlackView *blackView = [[BlackView alloc] initWithFrame:CGRectMake(0, 162, 200, 40)];
        blackView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:blackView];
        
        RedView *redView = [[RedView alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        redView.backgroundColor = [UIColor redColor];
        [blueView addSubview:redView];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 80, 20);
        [button setTitle:@"点击" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [redView addSubview:button];
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

//- (void)nilTargetButtonAction:(UIButton *)button {
//    NSLog(@"nilTargetButtonAction: %@", button);
//}

- (void)buttonAction:(UIButton *)button {
    NSLog(@"button");
}

@end
