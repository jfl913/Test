//
//  CMCellsLord.m
//  Test
//
//  Created by junfeng.li on 2017/12/7.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "CMCellsLord.h"
#import "NSObject+CMCellModel.h"
#import "UITableView+CMTemplateLayoutCell.h"

@interface CMCellsLord ()

@property (nonatomic, strong) NSDictionary<NSNumber *, NSString *> *cellNameByTypeDict;
@property (nonatomic, strong) NSArray *cellNameArray;

@end

@implementation CMCellsLord

- (instancetype)initWithCellNameByTypeDict:(NSDictionary<NSNumber *, NSString *> *)cellNameByTypeDict {
    self = [super init];
    if (self) {
        self.cellNameByTypeDict = cellNameByTypeDict.copy;
        self.cellNameArray = self.cellNameByTypeDict.allValues;
    }
    return self;
}

- (void)registerTableViewCells:(UITableView *)tableView {
    for (NSString *cellName in self.cellNameArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:cellName ofType:@"nib"];
        if (path.length > 0) {
            UINib *nib = [UINib nibWithNibName:cellName bundle:[NSBundle mainBundle]];
            [tableView registerNib:nib forCellReuseIdentifier:cellName];
        } else {
            [tableView registerClass:NSClassFromString(cellName) forCellReuseIdentifier:cellName];
        }
    }
}

- (UITableViewCell<CMCellsLordProtocol> *)tableView:(UITableView *)tableView cellForType:(NSInteger)cellType configureDelegate:(id)delegate {
    UITableViewCell<CMCellsLordProtocol> *cell = nil;
    NSString *cellName = self.cellNameByTypeDict[@(cellType)];
    if (cellName.length > 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if ([cell respondsToSelector:@selector(configureCellDelegate:)]) {
            [cell configureCellDelegate:delegate];
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForType:(NSInteger)cellType configureCellModel:(NSObject *)cellModel {
    if (cellModel.cm_cellHeight > 0.0) {
        return cellModel.cm_cellHeight;
    }
    
    CGFloat height = 0.0;
    
    NSString *cellName = self.cellNameByTypeDict[@(cellType)];
    if (cellName.length > 0) {
        height = [tableView cm_heightForCellWithIdentifier:cellName configuration:^(UITableViewCell<CMCellsLordProtocol> *cell) {
            [cell updateCell:cellModel];
        }];
        cellModel.cm_cellHeight = height;
    }
    
    return height;
}

@end
