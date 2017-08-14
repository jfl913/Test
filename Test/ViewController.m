//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "BankModel.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *bankModelArray;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *bankNameArray = @[@"招商银行", @"浦发银行", @"交通银行"];
    NSArray *bankSimpleNameArray = @[@"招行", @"浦发", @"交行"];
    NSArray *bankIdArray = @[@1, @2, @3];
    
    self.bankModelArray = @[].mutableCopy;
    [bankNameArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BankModel *bankModel = [BankModel new];
        bankModel.bankName = bankNameArray[idx];
        bankModel.bankSimpleName = bankSimpleNameArray[idx];
        bankModel.bankId = [bankIdArray[idx] integerValue];
        [self.bankModelArray addObject:bankModel];
    }];
}

- (IBAction)tapButton:(id)sender
{
    NSString *searchString = @"招";
    NSPredicate *bankNamePredicate = [NSPredicate predicateWithFormat:@"bankName CONTAINS $searchWord || bankSimpleName CONTAINS $searchWord"];
    NSArray *resultArray = [self.bankModelArray filteredArrayUsingPredicate:[bankNamePredicate predicateWithSubstitutionVariables:@{@"searchWord": searchString}]];
    
//    NSPredicate *bankNamePredicate = [NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
//        return [[evaluatedObject bankName] containsString:searchString] || [[evaluatedObject bankSimpleName] containsString:searchString];
//    }];
//    
//    NSArray *resultArray = [self.bankModelArray filteredArrayUsingPredicate:bankNamePredicate];
    
    NSLog(@"招商银行: %@", resultArray);
}

@end
