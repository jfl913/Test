//
//  GHIssue.m
//  MantleDemo
//
//  Created by JunfengLi on 16/8/21.
//  Copyright © 2016年 JunfengLi. All rights reserved.
//

#import "GHIssue.h"

@class GHUser;

@implementation GHIssue

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"URL": @"url",
             @"name": @"user.name",
             };
}

@end
