//
//  UIView+MethodSwizzle.m
//  Test
//
//  Created by LiJunfeng on 2016/12/2.
//  Copyright © 2016年 LiJunfeng. All rights reserved.
//

#import "UIView+MethodSwizzle.h"
#import <objc/runtime.h>
#import "BlueView.h"

@implementation UIView (MethodSwizzle)

//+ (void)load {
//    Method origin = class_getInstanceMethod([AView class], @selector(touchesBegan:withEvent:));
//    Method custom = class_getInstanceMethod([AView class], @selector(lxd_touchesBegan:withEvent:));
//    method_exchangeImplementations(origin, custom);
//
//    origin = class_getInstanceMethod([AView class], @selector(touchesMoved:withEvent:));
//    custom = class_getInstanceMethod([AView class], @selector(lxd_touchesMoved:withEvent:));
//    method_exchangeImplementations(origin, custom);
//
//    origin = class_getInstanceMethod([AView class], @selector(touchesEnded:withEvent:));
//    custom = class_getInstanceMethod([AView class], @selector(lxd_touchesEnded:withEvent:));
//    method_exchangeImplementations(origin, custom);
//}
//
//- (void)lxd_touchesBegan: (NSSet<UITouch *> *)touches withEvent: (UIEvent *)event
//{
//    NSLog(@"%@ --- begin", self.class);
//    [self lxd_touchesBegan: touches withEvent: event];
//}

//- (void)lxd_touchesMoved: (NSSet<UITouch *> *)touches withEvent: (UIEvent *)event
//{
//    NSLog(@"%@ --- move", self.class);
//    [self lxd_touchesMoved: touches withEvent: event];
//}
//
//- (void)lxd_touchesEnded: (NSSet<UITouch *> *)touches withEvent: (UIEvent *)event
//{
//    NSLog(@"%@ --- end", self.class);
//    [self lxd_touchesEnded: touches withEvent: event];
//}

+ (void)load
{
    Method origin = class_getInstanceMethod([self class], @selector(hitTest:withEvent:));
    Method custom = class_getInstanceMethod([self class], @selector(jfl_hitTest:withEvent:));
    method_exchangeImplementations(origin, custom);

//    Method originPointInside = class_getInstanceMethod([self class], @selector(pointInside:withEvent:));
//    Method customPointInside = class_getInstanceMethod([self class], @selector(jfl_pointInside:withEvent:));
//    method_exchangeImplementations(originPointInside, customPointInside);
}

-(UIView *)jfl_hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *testView = [self jfl_hitTest:point withEvent:event];
    NSLog(@"hitTest-self: %@, test-view: %@-%@", NSStringFromClass([self class]),NSStringFromClass([testView class]),testView);
    return testView;
}

//- (BOOL)jfl_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    BOOL inside = [self jfl_pointInside:point withEvent:event];
//    NSLog(@"pointInside-self: %@, inside: %@", NSStringFromClass([self class]),[NSNumber numberWithBool:inside]);
//    return inside;
//}

@end
