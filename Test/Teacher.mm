//
//  Teacher.m
//  Test
//
//  Created by junfeng.li on 2018/12/26.
//  Copyright © 2018 LiJunfeng. All rights reserved.
//

#import "Teacher.h"
#import "Teacher+WCTTableCoding.h"
#import <WCDB/WCDB.h>

@implementation Teacher

WCDB_IMPLEMENTATION(Teacher)
WCDB_SYNTHESIZE(Teacher, name)
WCDB_SYNTHESIZE(Teacher, age)
WCDB_SYNTHESIZE(Teacher, student)
WCDB_SYNTHESIZE(Teacher, studentArray)

@end
