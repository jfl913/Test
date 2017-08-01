//
//  UIResponder+Router.h
//  Test
//
//  Created by junfeng.li on 2017/8/1.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)

- (void)jf_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
