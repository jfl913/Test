//
//  Teacher.h
//  Test
//
//  Created by junfeng.li on 2018/12/26.
//  Copyright © 2018 LiJunfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Student;

@interface Teacher : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) Student *student;
@property (nonatomic, strong) NSArray<Student *> *studentArray;

@end
