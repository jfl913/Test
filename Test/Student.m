//
//  Studeng.m
//  Test
//
//  Created by junfeng.li on 2018/12/26.
//  Copyright © 2018 LiJunfeng. All rights reserved.
//

#import "Student.h"
#import <MJExtension/MJExtension.h>

@implementation Student

- (void)encodeWithCoder:(NSCoder *)encoder {
    [self mj_encode:encoder];
//    [encoder encodeObject:self.name forKey:@"name"];
//    [encoder encodeInteger:self.age forKey:@"age"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        [self mj_decode:decoder];
//        self.name = [decoder decodeObjectForKey:@"name"];
//        self.age = [decoder decodeIntegerForKey:@"age"];
    }
    return self;
}

@end
