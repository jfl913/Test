//
//  CMCellsLord.h
//  Test
//
//  Created by junfeng.li on 2017/12/7.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CMCellsLordProtocol.h"

@interface CMCellsLord : NSObject

- (instancetype)initWithCellNameByTypeDict:(NSDictionary<NSNumber *, NSString *> *)cellNameByTypeDict;

- (void)registerTableViewCells:(UITableView *)tableView;

- (UITableViewCell<CMCellsLordProtocol> *)tableView:(UITableView *)tableView cellForType:(NSInteger)cellType configureDelegate:(id)delegate;

- (CGFloat)tableView:(UITableView *)tableView heightForType:(NSInteger)cellType configureCellModel:(NSObject *)cellModel;

@end
