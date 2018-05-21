//
//  NSString+CMChainSyntax.h
//  Test
//
//  Created by junfeng.li on 2018/5/17.
//  Copyright © 2018年 LiJunfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableAttributedString+CMChainSyntax.h"

@interface NSString (CMChainSyntax)

// 生成 Attributed String
- (NSMutableAttributedString *)attributedBuild;

@end
