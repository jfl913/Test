//
//  RoundedCorner.m
//  Test
//
//  Created by junfeng.li on 2017/5/8.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "RoundedCorner.h"

@implementation RoundedCorner

+ (UIImage *)drawRoundedCornerImageWithRadius:(CGFloat)radius
                              roundingCorners:(UIRectCorner)corners
                                  borderWidth:(CGFloat)borderWidth
                                  borderColor:(UIColor *)borderColor
                                    fillColor:(UIColor *)fillColor
                                  forContextSize:(CGSize)size {
    CGFloat halfOfBorderWidth = borderWidth / 2.0;
    
    UIGraphicsBeginImageContextWithOptions(size, false, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    /*设置边框和填充色*/
    CGContextSetLineWidth(ctx, borderWidth);
    CGContextSetStrokeColorWithColor(ctx, borderColor.CGColor);
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);
    
    CGFloat width = size.width;
    CGFloat height = size.height;
    CGFloat realRadius = radius - halfOfBorderWidth;
    
    /*绘制边框和圆角*/
    if (corners == UIRectCornerTopLeft) {
        
    } else if (corners == UIRectCornerTopRight) {
        
    }
    
    
    CGContextMoveToPoint(ctx, width - halfOfBorderWidth, radius - halfOfBorderWidth); // 开始坐标右边开始
    CGContextAddArcToPoint(ctx, width - halfOfBorderWidth , height - halfOfBorderWidth, width - radius - halfOfBorderWidth, height - halfOfBorderWidth, realRadius); // 右下角
    CGContextAddArcToPoint(ctx, halfOfBorderWidth, height - halfOfBorderWidth, halfOfBorderWidth, height - radius - halfOfBorderWidth, realRadius); // 左下角
    CGContextAddArcToPoint(ctx, halfOfBorderWidth, halfOfBorderWidth, width - halfOfBorderWidth - radius, halfOfBorderWidth, realRadius); // 左上角
    CGContextAddArcToPoint(ctx, width - halfOfBorderWidth, halfOfBorderWidth, width - halfOfBorderWidth, radius + halfOfBorderWidth, realRadius); // 右上角
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage *outImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return outImage;
}

@end
