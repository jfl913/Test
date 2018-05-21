//
//  NSString+CMChainSyntax.m
//  Test
//
//  Created by junfeng.li on 2018/5/17.
//  Copyright © 2018年 LiJunfeng. All rights reserved.
//

#import "NSString+CMChainSyntax.h"

@implementation NSString (CMChainSyntax)

- (NSMutableAttributedString *)attributedBuild {
    return NSMutableAttributedString.build(self);
}

@end
