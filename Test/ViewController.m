//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@property (nonatomic, strong) TestView *testView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    self.testView = [[TestView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    [self.view addSubview:self.testView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
    tapGesture.numberOfTapsRequired = 2;
//    tapGesture.cancelsTouchesInView = NO;
//    tapGesture.delaysTouchesBegan = YES;
//    tapGesture.delaysTouchesEnded = NO;
    [self.testView addGestureRecognizer:tapGesture];
}

- (void)tapView:(UITapGestureRecognizer *)tapGestureRecognizer {
    NSLog(@"%@-%@", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@-%@", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@-%@", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@-%@", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@-%@", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}

- (IBAction)tapButton:(id)sender
{
    
}

@end
