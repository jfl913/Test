//
//  ClassContainer.h
//  Test
//
//  Created by Li Junfeng on 2020/5/4.
//  Copyright © 2020 LiJunfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassUnsafeUnretained.h"
#import "ClassWeak.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClassContainer : NSObject

@property (nonatomic, unsafe_unretained) ClassUnsafeUnretained *unsafeUnretainedObject;
@property (nonatomic, weak) ClassWeak *weakObject;

@end

NS_ASSUME_NONNULL_END
