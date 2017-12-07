//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"
#import "CMCellsLord.h"
#import "TestCellModel.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CMCellsLord *cellsLord;
@property (nonatomic, strong) NSMutableArray *cellModelArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.tableView];
    
    NSDictionary *dict = @{@1: @"TestTableViewCell",
                           @2: @"TestOneLineTableViewCell"};
    self.cellsLord = [[CMCellsLord alloc] initWithCellNameByTypeDict:dict];
    [self.cellsLord registerTableViewCells:self.tableView];
    
    self.cellModelArray = @[].mutableCopy;
    
    for (NSInteger i = 0; i < 20; i++) {
        TestCellModel *cellModel = [TestCellModel new];
        cellModel.type = 1;
        cellModel.content = @"11 - 若用户曾有两次点击“关闭”按钮，则该提示在下次打开应用则不再显示，否则每次打开均显示。这个逻辑是不是可以去掉，为啥非得两次？用户点关闭就该不再显示了。";
        
        
        TestCellModel *cell2Model = [TestCellModel new];
        cell2Model.type = 2;
        cell2Model.content = @"22 - 若用户曾有两次点击“关闭”按钮，则该提示在下次打开应用则不再显示，否则每次打开均显示。这个逻辑是不是可以去掉，为啥非得两次？用户点关闭就该不再显示了。";
        
        [self.cellModelArray addObject:cellModel];
        [self.cellModelArray addObject:cell2Model];
    }
}

#pragma mark - Delegate - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestCellModel *cellModel = self.cellModelArray[indexPath.row];
    UITableViewCell<CMCellsLordProtocol> *cell = [self.cellsLord tableView:tableView cellForType:cellModel.type configureDelegate:self];
    [cell updateCell:cellModel];
    
    return cell;
}

#pragma mark - Delegate - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestCellModel *cellModel = self.cellModelArray[indexPath.row];
    CGFloat height = [self.cellsLord tableView:tableView heightForType:cellModel.type configureCellModel:cellModel];
    return height;
}

- (IBAction)tapButton:(id)sender
{
    
}

#pragma mark - Accessor

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
