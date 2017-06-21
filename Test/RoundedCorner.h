//
//  RoundedCorner.h
//  Test
//
//  Created by junfeng.li on 2017/5/8.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RoundedCorner : NSObject

+ (UIImage *)drawRectWithRoundedCornerWithRadius:(CGFloat)radius
                                     borderWidth:(CGFloat)borderWidth
                                     borderColor:(UIColor *)borderColor
                                       fillColor:(UIColor *)fillColor
                                  forContextSize:(CGSize)size;

@end
