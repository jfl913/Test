//
//  View3.m
//  Test
//
//  Created by junfeng.li on 2017/8/1.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "View3.h"
#import "UIResponder+Router.h"

@implementation View3

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)tapView:(UITapGestureRecognizer *)tapGestureRecognizer {
    NSDictionary *userInfo = @{@"color3": @"blue"};
    [self jf_routerEventWithName:@"View3" userInfo:userInfo];
}

@end
