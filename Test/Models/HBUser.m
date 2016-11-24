//
//  HBUser.m
//  MantleDemo
//
//  Created by LiJunfeng on 16/9/9.
//  Copyright © 2016年 JunfengLi. All rights reserved.
//

#import "HBUser.h"

@implementation HBUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"name": @"name",
             @"gender": @"gender",
             @"age": @"age",
             @"success": @"success",
             };
}

@end
