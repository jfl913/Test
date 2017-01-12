//
//  GHIssue.h
//  MantleDemo
//
//  Created by JunfengLi on 16/8/21.
//  Copyright © 2016年 JunfengLi. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "GHUser.h"

@interface GHIssue : NSObject

@property (nonatomic, copy) NSURL *URL;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) GHUser *user;
@property (nonatomic, copy) NSString *name;

-(NSString *)nameWithInstance:(id)instance;

@end
