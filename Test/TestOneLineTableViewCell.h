//
//  TestOneLineTableViewCell.h
//  Test
//
//  Created by junfeng.li on 2017/12/7.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMCellsLordProtocol.h"
#import "TestCellModel.h"

@interface TestOneLineTableViewCell : UITableViewCell <CMCellsLordProtocol>

- (void)updateCell:(TestCellModel *)cellModel;

@end
