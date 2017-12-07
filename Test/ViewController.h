//
//  ViewController.h
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMCellsLordProtocol <NSObject>

@required

- (NSInteger)cellType;

- (void)updateCell:(id)cellModel;

@optional

- (void)configureCellDelegate:(id)delegate;

- (BOOL)enforceFrameLayout;

@end

@interface ViewController : UIViewController


@end

