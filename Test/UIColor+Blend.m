//
//  UIColor+Blend.m
//  Test
//
//  Created by junfeng.li on 2019/1/17.
//  Copyright © 2019 LiJunfeng. All rights reserved.
//

#import "UIColor+Blend.h"

@implementation UIColor (Blend)

+ (UIColor *)jl_blendColor1:(UIColor *)color1
                     color2:(UIColor *)color2
                      ratio:(CGFloat)ratio {
    if (ratio < 0) {
        ratio = 0.0;
    }
    else if (ratio > 1) {
        ratio = 1.0;
    }
    
    CGFloat red1;
    CGFloat green1;
    CGFloat blue1;
    CGFloat alpha1;
    [color1 getRed:&red1 green:&green1 blue:&blue1 alpha:&alpha1];
    
    CGFloat red2;
    CGFloat green2;
    CGFloat blue2;
    CGFloat alpha2;
    [color2 getRed:&red2 green:&green2 blue:&blue2 alpha:&alpha2];
    
    CGFloat inverseRatio = 1.0 - ratio;
    
    CGFloat blendRed = red1 * inverseRatio + red2 * ratio;
    CGFloat blendGreen = green1 * inverseRatio + green2 * ratio;
    CGFloat blendBlue = blue1 * inverseRatio + blue2 * ratio;
    CGFloat blendAlpha = alpha1 * inverseRatio + alpha2 * ratio;
    
    return [UIColor colorWithRed:blendRed green:blendGreen blue:blendBlue alpha:blendAlpha];
}

@end
