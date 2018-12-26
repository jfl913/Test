//
//  Teacher+WCTTableCoding.h
//  Test
//
//  Created by junfeng.li on 2018/12/26.
//  Copyright © 2018 LiJunfeng. All rights reserved.
//

#import "Teacher.h"
#import <WCDB/WCDB.h>

@interface Teacher (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(name)
WCDB_PROPERTY(age)
WCDB_PROPERTY(student)

@end
