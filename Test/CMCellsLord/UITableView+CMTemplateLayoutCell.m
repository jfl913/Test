//
//  UITableView+CMTemplateLayoutCell.m
//  Test
//
//  Created by junfeng.li on 2017/12/7.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "UITableView+CMTemplateLayoutCell.h"
#import <objc/runtime.h>

@implementation UITableView (CMTemplateLayoutCell)

- (UITableViewCell *)cm_templateCellForReuseIdentifier:(NSString *)identifier {
    NSAssert(identifier.length > 0, @"Expect a valid identifier: %@", identifier);
    
    NSMutableDictionary<NSString *, UITableViewCell *> *templateCellsByIdentifiersDict = objc_getAssociatedObject(self, _cmd);
    if (!templateCellsByIdentifiersDict) {
        templateCellsByIdentifiersDict = @{}.mutableCopy;
        objc_setAssociatedObject(self, _cmd, templateCellsByIdentifiersDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    UITableViewCell *templateCell = templateCellsByIdentifiersDict[identifier];
    if (!templateCell) {
        templateCell = [self dequeueReusableCellWithIdentifier:identifier];
        NSAssert(templateCell != nil, @"Cell must be registerd to table view for identifier: %@", identifier);
        templateCell.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        templateCellsByIdentifiersDict[identifier] = templateCell;
    }
    
    return templateCell;
}

- (CGFloat)cm_heightForCellWithIdentifier:(NSString *)identifier configuration:(void (^)(UITableViewCell *cell))configuration {
    if (identifier.length == 0) {
        return 0.0;
    }
    
    UITableViewCell *templateLayoutCell = [self cm_templateCellForReuseIdentifier:identifier];
    // Manually calls to ensure consistent behavior with actual cells. (that are displayed on screen).
    [templateLayoutCell prepareForReuse];
    
    if (configuration) {
        configuration(templateLayoutCell);
    }
    
    return [self cm_systemFittingHeightForConfiguratedCell:templateLayoutCell];
}

- (CGFloat)cm_systemFittingHeightForConfiguratedCell:(UITableViewCell *)cell {
    CGFloat contentViewWidth = CGRectGetWidth(self.frame);
    
    CGRect cellBounds = cell.bounds;
    cellBounds.size.width = contentViewWidth;
    cell.bounds = cellBounds;
    
    CGFloat rightSystemViewWidth = 0.0;
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITableViewIndex")]) {
            rightSystemViewWidth = CGRectGetWidth(view.frame);
            break;
        }
    }
    
    // If a cell has accessory view or system accessory type, its content view's width is smaller
    // than cell's by some fixed values.
    if (cell.accessoryView) {
        rightSystemViewWidth += 16 + CGRectGetWidth(cell.accessoryView.frame);
    } else {
        static const CGFloat systemAccessoryWidths[] = {
            [UITableViewCellAccessoryNone] = 0,
            [UITableViewCellAccessoryDisclosureIndicator] = 34,
            [UITableViewCellAccessoryDetailDisclosureButton] = 68,
            [UITableViewCellAccessoryCheckmark] = 40,
            [UITableViewCellAccessoryDetailButton] = 48
        };
        rightSystemViewWidth += systemAccessoryWidths[cell.accessoryType];
    }
    
    if ([UIScreen mainScreen].scale >= 3 && [UIScreen mainScreen].bounds.size.width >= 414) {
        rightSystemViewWidth += 4;
    }
    
    contentViewWidth -= rightSystemViewWidth;
    
    CGFloat fittingHeight = 0.0;
    
    // If not using auto layout, you have to override "-sizeThatFits:" to provide a fitting size by yourself.
    // This is the same height calculation passes used in iOS8 self-sizing cell's implementation.
    //
    // 1. Try "- systemLayoutSizeFittingSize:" first. (skip this step if 'enforceFrameLayout' return to YES.)
    // 2. Warning once if step 1 still returns 0 when using AutoLayout
    // 3. Try "- sizeThatFits:" if step 1 returns 0
    // 4. Use a valid height or default row height (44) if not exist one
    
    BOOL enforceFrameLayout = NO;
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if ([cell respondsToSelector:@selector(enforceFrameLayout)]) {
        enforceFrameLayout = [cell performSelector:@selector(enforceFrameLayout)];
    }
#pragma clang diagnostic pop
    
    if (!enforceFrameLayout && contentViewWidth > 0) {
        // Add a hard width constraint to make dynamic content views (like labels) expand vertically instead
        // of growing horizontally, in a flow-layout manner.
        NSLayoutConstraint *widthFenceConstraint = [NSLayoutConstraint constraintWithItem:cell.contentView
                                                                                attribute:NSLayoutAttributeWidth
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:nil
                                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                                               multiplier:1.0
                                                                                 constant:contentViewWidth];
        // [bug fix] after iOS 10.2, Auto Layout engine will add an additional 0 width constraint onto cell's content view, to avoid that, we add constraints to content view's left, right, top and bottom.
        static BOOL isSystemVersionEqualOrGreaterThan10_2 = NO;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            isSystemVersionEqualOrGreaterThan10_2 = [UIDevice.currentDevice.systemVersion compare:@"10.2" options:NSNumericSearch] != NSOrderedAscending;
        });
        
        NSArray<NSLayoutConstraint *> *edgeConstraintsArray;
        if (isSystemVersionEqualOrGreaterThan10_2) {
            // To avoid confilicts, make width constraint lower than required (1000)
            widthFenceConstraint.priority = UILayoutPriorityRequired - 1;
            
            NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:cell.contentView
                                                                              attribute:NSLayoutAttributeLeft
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:cell
                                                                              attribute:NSLayoutAttributeLeft
                                                                             multiplier:1.0
                                                                               constant:0];
            NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:cell.contentView
                                                                              attribute:NSLayoutAttributeRight
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:cell
                                                                              attribute:NSLayoutAttributeRight
                                                                             multiplier:1.0
                                                                               constant:-rightSystemViewWidth];
            NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:cell.contentView
                                                                              attribute:NSLayoutAttributeTop
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:cell
                                                                              attribute:NSLayoutAttributeTop
                                                                             multiplier:1.0
                                                                               constant:0];
            NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:cell.contentView
                                                                              attribute:NSLayoutAttributeBottom
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:cell
                                                                              attribute:NSLayoutAttributeBottom
                                                                             multiplier:1.0
                                                                               constant:0];
            edgeConstraintsArray = @[leftConstraint, rightConstraint, topConstraint, bottomConstraint];
            [cell addConstraints:edgeConstraintsArray];
        }
        
        [cell.contentView addConstraint:widthFenceConstraint];
        
        fittingHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        
        [cell.contentView removeConstraint:widthFenceConstraint];
        if (isSystemVersionEqualOrGreaterThan10_2) {
            [cell removeConstraints:edgeConstraintsArray];
        }
    }
    
    if (fittingHeight == 0.0) {
#if DEBUG
        // Warn if using AutoLayout but get zero height.
        if (cell.contentView.constraints.count > 0) {
            if (!objc_getAssociatedObject(self, _cmd)) {
                NSLog(@"[CMTemplateLayoutCell] waning only once: Can not get a proper cell height (now 0) from 'systemLayoutSizeFittingSize:'. You should check how constraints are builted in cell, make it into self-sizing cell.");
                objc_setAssociatedObject(self, _cmd, @(YES), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
        }
#endif
        // Try '- sizeThatFits:' for frame layout.
        // Note: fitting height should not include separator view.
        fittingHeight = [cell sizeThatFits:CGSizeMake(contentViewWidth, 0.0)].height;
    }
    
    // Still zero height after all above.
    if (fittingHeight == 0.0) {
        // Use default row height.
        fittingHeight = 44.0;
    }
    
    // Add 1px extra space for separator line if needed, simulating default UITableViewCell.
    if (self.separatorStyle != UITableViewCellSeparatorStyleNone) {
        fittingHeight += 1.0 / [UIScreen mainScreen].scale;
    }
    
    return fittingHeight;
}

@end
