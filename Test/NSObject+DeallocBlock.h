//
//  NSObject+DeallocBlock.h
//  Test
//
//  Created by Li Junfeng on 2020/5/5.
//  Copyright © 2020 LiJunfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeallocBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DeallocBlock)

- (void)runBlockOnDealloc:(Block)block;

@end

NS_ASSUME_NONNULL_END
