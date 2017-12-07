//
//  TestTableViewCell.m
//  Test
//
//  Created by junfeng.li on 2017/12/7.
//  Copyright © 2017年 LiJunfeng. All rights reserved.
//

#import "TestTableViewCell.h"

@interface TestTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation TestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)updateCell:(TestCellModel *)cellModel {
    self.testLabel.text = cellModel.content;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
