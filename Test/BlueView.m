//
//  AView.m
//  Test
//
//  Created by LiJunfeng on 2016/12/2.
//  Copyright © 2016年 LiJunfeng. All rights reserved.
//

#import "BlueView.h"
#import "UIView+MethodSwizzle.h"

@implementation BlueView

//-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
//{
//    return NO;
//}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
//{
//    UIResponder * next = [self nextResponder];
//    NSMutableString * prefix = @"".mutableCopy;
//
//    while (next != nil) {
//        NSLog(@"%@%@", prefix, [next class]);
//        [prefix appendString: @"--"];
//        next = [next nextResponder];
//    }
//    NSLog(@"%@", NSStringFromSelector(_cmd));
//}

//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
//{
//    NSLog(@"%@", NSStringFromSelector(_cmd));
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
//{
//    NSLog(@"%@", NSStringFromSelector(_cmd));
//}

@end
