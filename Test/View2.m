//
//  View2.m
//  Test
//
//  Created by junfeng.li on 2017/8/1.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "View2.h"
#import "UIResponder+Router.h"

NSString * const View2Event = @"View2";

@implementation View2

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)tapView:(UITapGestureRecognizer *)tapGestureRecognizer {
    NSDictionary *userInfo = @{@"color2": @"green"};
    [self jf_routerEventWithName:View2Event userInfo:userInfo];
}

- (void)jf_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    NSMutableDictionary *decoratedUserInfo = userInfo.mutableCopy;
    decoratedUserInfo[@"color2"] = @"green";
    [super jf_routerEventWithName:eventName userInfo:decoratedUserInfo];
}

@end
