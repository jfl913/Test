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
    /* Indices 0 and 1 indicate the hidden arguments self and _cmd
     * 第0个参数为target
     * 第1个参数为selector
     * 自己的参数一般从第2个开始
     */
    [invocation setArgument:&userInfo atIndex:2];
    // 如果不持有参数，调用下面的- (void)getArgument:(void *)argumentLocation atIndex:(NSInteger)idx 方法会因为参数的消失而崩溃。
    [invocation retainArguments];
    [invocation invoke];
    NSLog(@"eventName: %@, userInfo: %@", eventName, userInfo);
    
    id argument0;
    char *argumnet1;
    id argument2;
    [invocation getArgument:&argument0 atIndex:0];
    [invocation getArgument:&argumnet1 atIndex:1];
    [invocation getArgument:&argument2 atIndex:2];
    
    /*
     * argument0: <ViewController: 0x7f9dcfc108c0>,
     * argument1: view3Event:,
     * argument2: {
     *  color1 = red;
     *  color2 = green;
     *  color3 = blue;
     * }
     */
    
    NSLog(@"argument0: %@, argument1: %s, argument2: %@", argument0, argumnet1, argument2);
    
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
