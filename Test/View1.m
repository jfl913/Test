//
//  View1.m
//  Test
//
//  Created by junfeng.li on 2017/8/1.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "View1.h"
#import "UIResponder+Router.h"

NSString * const View1Event = @"View1";

@implementation View1

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)tapView:(UITapGestureRecognizer *)tapGestureRecognizer {
    NSDictionary *userInfo = @{@"color1": @"red"};
    [self jf_routerEventWithName:View1Event userInfo:userInfo];
}

- (void)jf_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    NSMutableDictionary *decoratedUserInfo = userInfo.mutableCopy;
    decoratedUserInfo[@"color1"] = @"red";
    [super jf_routerEventWithName:eventName userInfo:decoratedUserInfo];
}

@end
