//
//  UITableView+CMTemplateLayoutCell.h
//  Test
//
//  Created by junfeng.li on 2017/12/7.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CMTemplateLayoutCell)

- (UITableViewCell *)cm_templateCellForReuseIdentifier:(NSString *)identifier;

- (CGFloat)cm_heightForCellWithIdentifier:(NSString *)identifier configuration:(void (^)(UITableViewCell *cell))configuration;

@end
