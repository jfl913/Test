//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "UIResponder+Router.h"
#import <Masonry.h>
#import "View1.h"
#import "View2.h"
#import "View3.h"

@interface ViewController ()

@property (nonatomic, strong) View1 *view1;
@property (nonatomic, strong) View2 *view2;
@property (nonatomic, strong) View3 *view3;

@property (nonatomic, strong) NSDictionary *eventStrategy;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view1 = [View1 new];
    self.view2 = [View2 new];
    self.view3 = [View3 new];
    
    [self.view addSubview:self.view1];
    [self.view1 addSubview:self.view2];
    [self.view2 addSubview:self.view3];
    
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(20, 20, 20, 20));
    }];
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view1).with.insets(UIEdgeInsetsMake(20, 20, 20, 20));
    }];
    [self.view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view2).with.insets(UIEdgeInsetsMake(20, 20, 20, 20));
    }];
}

- (void)jf_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    NSInvocation *invocation = self.eventStrategy[eventName];
    [invocation setArgument:&userInfo atIndex:2];
    [invocation invoke];
    NSLog(@"eventName: %@, userInfo: %@", eventName, userInfo);
}

- (void)view1Event:(NSDictionary *)userInfo {
    NSLog(@"view1Event: %@", userInfo);
}

- (void)view2Event:(NSDictionary *)userInfo {
    NSLog(@"view2Event: %@", userInfo);
}

- (void)view3Event:(NSDictionary *)userInfo {
    NSLog(@"view3Event: %@", userInfo);
}

- (NSDictionary <NSString *, NSInvocation *> *)eventStrategy
{
    if (_eventStrategy == nil) {
        _eventStrategy = @{
                           View1Event:[self jf_createInvocationWithSelector:@selector(view1Event:)],
                           View2Event:[self jf_createInvocationWithSelector:@selector(view2Event:)],
                           View3Event:[self jf_createInvocationWithSelector:@selector(view3Event:)],
                           };
    }
    return _eventStrategy;
}

@end
