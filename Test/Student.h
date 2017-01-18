//
//  Student.h
//  Test
//
//  Created by LiJunfeng on 2017/1/17.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StudentProtocol <NSObject>

@optional

- (void)test;

@end

@interface Student : NSObject <StudentProtocol>

+ (void)learnClass:(NSString *) string;
- (void)goToSchool:(NSString *) name;

@end
