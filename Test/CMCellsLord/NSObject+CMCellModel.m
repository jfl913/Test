//
//  NSObject+CMCellModel.m
//  Test
//
//  Created by junfeng.li on 2017/12/7.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "NSObject+CMCellModel.h"
#import <objc/runtime.h>

@implementation NSObject (CMCellModel)

- (CGFloat)cm_cellHeight {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setCm_cellHeight:(CGFloat)cm_cellHeight {
    objc_setAssociatedObject(self, @selector(cm_cellHeight), @(cm_cellHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
