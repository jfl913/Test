//
//  TeacherDao.m
//  Test
//
//  Created by junfeng.li on 2018/12/26.
//  Copyright © 2018 LiJunfeng. All rights reserved.
//

#import "TeacherDao.h"
#import <WCDB/WCDB.h>
#import "Teacher.h"
#import "Student.h"
#import "Teacher+WCTTableCoding.h"
#import <MJExtension/MJExtension.h>

@implementation TeacherDao

+ (void)save {
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *wcdbPath = [documentPath stringByAppendingPathComponent:@"wcdb.db"];
    WCTDatabase *database = [[WCTDatabase alloc] initWithPath:wcdbPath];
    [database createTableAndIndexesOfName:@"teacher" withClass:Teacher.class];
    
    
    NSString *jsonString = @"{\"name\":\"Jack\", \"age\":20}";
    
    Student *jsonStudent = [Student mj_objectWithKeyValues:jsonString];
    
    Student *student = [Student new];
    student.name = @"xx";
    student.age = 18;
    
    Teacher *teacher = [Teacher new];
    teacher.name = @"jfl";
    teacher.age = 32;
    teacher.student = student;
    
    [database insertObject:teacher into:@"teacher"];
    
    NSArray *teacherArray = [database getAllObjectsOfClass:Teacher.class fromTable:@"teacher"];
    Teacher *firstTeacher = teacherArray.firstObject;
    NSLog(@"teacher: %@", firstTeacher);
    
    
}

@end
