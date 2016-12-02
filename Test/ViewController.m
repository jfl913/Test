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
#import "GHIssue.h"
#import "HBUser.h"
#import <YYModel.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@property (nonatomic, strong) NSDictionary *dictionary;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [GHIssue xtrace];
//    [YYClassInfo xtrace];
    
    NSDictionary *userDict = @{@"name": @"李俊峰",
                               @"gender": @"男",
                               };
    self.dictionary = @{@"url": @"www.baidu.com",
                        @"title": @"百度",
                        @"user": userDict,
                        };
}

- (IBAction)tapButton:(id)sender
{
    GHIssue *issue = [GHIssue yy_modelWithJSON:self.dictionary];
    NSLog(@"issue: %@", issue);
    
//    GHUser *user = [GHUser new];
//    user.name = @"jfl";
//    user.gender = @"male";
//    user.age = 18;
//    user.success = 0;
//    
//    NSDictionary *userDict = [user yy_modelToJSONObject];
//    HBUser *otherUser = [HBUser yy_modelWithDictionary:userDict];
//    NSLog(@"otherUser: %@", otherUser);
}

@end
