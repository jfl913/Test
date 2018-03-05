//
//  TestView.m
//  Test
//
//  Created by junfeng.li on 2018/3/5.
//  Copyright © 2018年 LiJunfeng. All rights reserved.
//

#import "TestView.h"

@implementation TestView

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

@end
