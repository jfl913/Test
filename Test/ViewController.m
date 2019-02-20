//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "RedViewController.h"
#import "YellowViewController.h"
#import "BlueViewController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) NSMutableArray *childViewControllerArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.currentIndex = 0;
    self.childViewControllerArray = @[].mutableCopy;
    
    [self addSubViews];
}

#pragma mark - Helper Method - UI

- (void)addSubViews {
    [self.view addSubview:self.scrollView];
    
    RedViewController *redViewController = [RedViewController new];
    YellowViewController *yellowViewController = [YellowViewController new];
    BlueViewController *blueViewController = [BlueViewController new];
    [self.childViewControllerArray addObject:redViewController];
    [self.childViewControllerArray addObject:yellowViewController];
    [self.childViewControllerArray addObject:blueViewController];
    
    
    UIView *redView = redViewController.view;
    UIView *yellowView = yellowViewController.view;
    UIView *blueView = blueViewController.view;
    redView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64.0);
    yellowView.frame = CGRectMake(ScreenWidth, 0, ScreenWidth, ScreenHeight - 64.0);
    blueView.frame = CGRectMake(ScreenWidth * 2, 0, ScreenWidth, ScreenHeight - 64.0);
    
    [self addChildViewController:redViewController];
    [self.scrollView addSubview:redView];
    [redViewController didMoveToParentViewController:self];
    
    [self.scrollView addSubview:yellowView];
    [self.scrollView addSubview:blueView];
    
    self.scrollView.contentSize = CGSizeMake(ScreenWidth * 3, ScreenHeight - 64.0);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat xOffset = scrollView.contentOffset.x;
    [self switchToViewWithXOffset:xOffset];
}

#pragma mark - Method 

- (void)switchToViewWithXOffset:(CGFloat)xOffset {
    NSInteger index = xOffset / ScreenWidth;
    
    if (index == self.currentIndex || index >= self.childViewControllerArray.count) {
        return;
    }
    
    UIViewController *fromChildViewController = self.childViewControllerArray[self.currentIndex];
    self.currentIndex = index;
    UIViewController *toChildViewController = self.childViewControllerArray[self.currentIndex];
    
    [fromChildViewController beginAppearanceTransition:NO animated:YES];
    [toChildViewController beginAppearanceTransition:YES animated:YES];
    [fromChildViewController endAppearanceTransition];
    [toChildViewController endAppearanceTransition];
}

#pragma mark - UIContainerViewControllerCallbacks

- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}

#pragma mark - Accessor

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64.0, ScreenWidth, ScreenHeight - 64.0)];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

@end
