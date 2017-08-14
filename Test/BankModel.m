//
//  BankModel.m
//  Test
//
//  Created by junfeng.li on 2017/8/14.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "BankModel.h"

@implementation BankModel

- (NSString *)description {
    return [NSString stringWithFormat:@"%@(%@): %@", self.bankName, self.bankSimpleName, @(self.bankId)];
}

@end
