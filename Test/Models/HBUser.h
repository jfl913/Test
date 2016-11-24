//
//  HBUser.h
//  MantleDemo
//
//  Created by LiJunfeng on 16/9/9.
//  Copyright © 2016年 JunfengLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBUser : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic) BOOL success;

@end
