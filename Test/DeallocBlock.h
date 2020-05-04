//
//  DeallocBlock.h
//  Test
//
//  Created by Li Junfeng on 2020/5/5.
//  Copyright © 2020 LiJunfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^Block)();

@interface DeallocBlock : NSObject

@property (nonatomic, copy) Block block;

- (instancetype)initWithBlock:(Block)block;

@end

NS_ASSUME_NONNULL_END
