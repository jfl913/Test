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
//    GHIssue *issue = [GHIssue yy_modelWithJSON:self.dictionary];
//    NSLog(@"issue: %@", issue);
    
//    GHUser *user = [GHUser new];
//    user.name = @"jfl";
//    user.gender = @"male";
//    user.age = 18;
//    user.success = 0;
//    
//    NSDictionary *userDict = [user yy_modelToJSONObject];
//    HBUser *otherUser = [HBUser yy_modelWithDictionary:userDict];
//    NSLog(@"otherUser: %@", otherUser);
    
    [self testMessage];
    [self testIMP];
}

-(NSString *)nameWithInstance:(id)instance {
    unsigned int numIvars = 0;
    NSString *key = nil;
    Ivar * ivars = class_copyIvarList([self class], &numIvars);
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = ivars[i];
        const char *type = ivar_getTypeEncoding(thisIvar);
        NSString *stringType =  [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
        if (![stringType hasPrefix:@"@"]) {
            continue;
        }
        if ((object_getIvar(self, thisIvar) == instance)) {//此处若 crash 不要慌！
            key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
            break;
        }
    }
    free(ivars);
    return key;
}

- (void)testIMP
{
    NSDate *before = [NSDate date];
    void (*test)(id, SEL, BOOL);
    
    test = (void (*)(id, SEL, BOOL))[self methodForSelector:@selector(testMethod:)];
    for (NSInteger i = 0; i < 100000000; i++) {
        test(self, @selector(testMethod:), YES);
    }
    NSDate *after = [NSDate date];
    NSTimeInterval interval = [after timeIntervalSinceDate:before];
    NSLog(@"¥¥¥¥¥¥¥¥¥¥¥¥: %f", interval);
}

- (void)testMethod:(BOOL)isTest
{
    BOOL test = isTest;
}

- (void)testMessage
{
    NSDate *before = [NSDate date];
    
    for (NSInteger i = 0; i < 100000000; i++) {
        [self testMethod:YES];
    }
    
    NSDate *after = [NSDate date];
    NSTimeInterval interval = [after timeIntervalSinceDate:before];
    NSLog(@"$$$$$$$$$$$$: %f", interval);
}

@end
