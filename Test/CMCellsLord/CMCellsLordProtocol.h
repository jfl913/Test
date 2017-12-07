//
//  CMCellsLordProtocol.h
//  Test
//
//  Created by junfeng.li on 2017/12/6.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CMCellsLordProtocol <NSObject>

@required

- (void)updateCell:(id)cellModel;

@optional

- (void)configureCellDelegate:(id)delegate;

- (BOOL)enforceFrameLayout;

@end

@protocol CMCellModelLordProtocol <NSObject>

- (NSInteger)cellType;

@end
