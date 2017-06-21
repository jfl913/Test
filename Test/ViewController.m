//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"
#import "Xtrace.h"
#import "RoundedCorner.h"
#import "TestTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *sectionArray;
@property (nonatomic, strong) NSMutableDictionary *dict1;
@property (nonatomic, strong) NSMutableDictionary *dict2;
@property (nonatomic, strong) NSMutableDictionary *dict3;
@property (nonatomic, strong) NSMutableArray *isExpandArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"TestTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TestTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1)];
    self.tableView.tableFooterView = footerView;
    [self.view addSubview:self.tableView];
    
    self.sectionArray = @[].mutableCopy;
    self.dict1 = @{}.mutableCopy;
    self.dict2 = @{}.mutableCopy;
    self.dict3 = @{}.mutableCopy;
    self.isExpandArray = @[].mutableCopy;
    
    self.dict1[@"Section1"] = @[@"1", @"2",@"3"];
    self.dict2[@"Section2"] = @[@"4",@"5",@"6"];
    self.dict3[@"Section3"] = @[@"7",@"8",@"9"];
    
    [self.sectionArray addObject:self.dict1];
    [self.sectionArray addObject:self.dict2];
    [self.sectionArray addObject:self.dict3];
    
    for (NSInteger i = 0; i < self.sectionArray.count; i++) {
        [self.isExpandArray addObject:[NSNumber numberWithBool:NO]];
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    BOOL isExpand = [self.isExpandArray[indexPath.section] boolValue];
    if (isExpand) {
        return 40;
    } else {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    sectionView.tag = section;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:15];
    NSDictionary *dict = self.sectionArray[section];
    label.text = dict.allKeys.firstObject;
    [sectionView addSubview:label];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSection:)];
    [sectionView addGestureRecognizer:tapGesture];
    
    return sectionView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    BOOL isExpand = [self.isExpandArray[section] boolValue];
    if (isExpand) {
        NSDictionary *dict = self.sectionArray[section];
        NSArray *valueArray = dict.allValues.firstObject;
        return valueArray.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestTableViewCell" forIndexPath:indexPath];
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    NSDictionary *dict = self.sectionArray[section];
    NSArray *valueArray = dict.allValues.firstObject;
    NSString *title = valueArray[row];
    cell.testLabel.text = title;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionArray.count;
}

- (void)tapSection:(UITapGestureRecognizer *)tapGestureRecognizer {
    NSInteger section = tapGestureRecognizer.view.tag;
    BOOL isExpand = [self.isExpandArray[section] boolValue];
    self.isExpandArray[section] = [NSNumber numberWithBool:!isExpand];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (IBAction)tapButton:(id)sender
{
    
}

@end
