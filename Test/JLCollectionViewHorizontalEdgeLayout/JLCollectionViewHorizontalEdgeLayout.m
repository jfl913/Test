//
//  JLCollectionViewHorizontalEdgeLayout.m
//  Test
//
//  Created by junfeng.li on 2019/1/14.
//  Copyright © 2019 LiJunfeng. All rights reserved.
//

#import "JLCollectionViewHorizontalEdgeLayout.h"

@implementation JLCollectionViewHorizontalEdgeLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}


/**
 *  参考：https://www.jianshu.com/p/a16ffb4bbcc2
 *  只要手一松开就会调用
 *  这个方法的返回值，就决定了CollectionView停止滚动时的偏移量
 *  proposedContentOffset这个是最终的 偏移量的值 但是实际的情况还是要根据返回值来定
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGFloat referenceCenterX = proposedContentOffset.x + self.collectionView.frame.size.width / 2.0;
    
    CGFloat minSpacing = MAXFLOAT;
    
    CGRect rect;
    rect.origin = proposedContentOffset;
    rect.size = self.collectionView.frame.size;
    NSArray *layoutAttributesArray = [self layoutAttributesForElementsInRect:rect];
    for (NSInteger i = 0; i < layoutAttributesArray.count; i++) {
        UICollectionViewLayoutAttributes *attributes = layoutAttributesArray[i];
        if (ABS(minSpacing) > ABS(attributes.center.x - referenceCenterX)) {
            minSpacing = attributes.center.x - referenceCenterX;
        }
    }
    proposedContentOffset.x += minSpacing;
    return proposedContentOffset;
}

@end
