//
//  UIColor+Blend.h
//  Test
//
//  Created by junfeng.li on 2019/1/17.
//  Copyright © 2019 LiJunfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Blend)

+ (UIColor *)jl_blendColor1:(UIColor *)color1
                     color2:(UIColor *)color2
                      ratio:(CGFloat)ratio;

@end

NS_ASSUME_NONNULL_END
