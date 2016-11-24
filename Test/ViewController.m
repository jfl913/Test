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

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [Xtrace showCaller:YES];
    [Xtrace describeValues:YES];
    [Xtrace setDelegate:self];
    [Xtrace forClass:[UILabel class] before:@selector(setText:) callbackBlock:^(UILabel *label){
        NSLog(@"before text: %@", label.text);
    }];
    [Xtrace forClass:[UILabel class] after:@selector(setText:) callbackBlock:^(UILabel *label){
        NSLog(@"after text: %@", label.text);
    }];
    
    
    [self.testLabel xtrace];
    
    self.testLabel.text = @"潇洒";
}

- (IBAction)tapButton:(id)sender
{
    @try {
        Test *test = [Test new];
        
        NSDictionary *dict = @{
                               @"name":@"jfl",
                               @"age":@"12",
                               };
        [test setValuesForKeysWithDictionary:dict];
        
        NSString *address = @"国风美域";
        NSError *error = nil;
        if ([test validateValue:&address forKey:@"address" error:&error]) {
            [test setValue:address forKey:@"address"];
        }
        
        NSString *phoneNum = @"15558069552";
        if ([test validateValue:&phoneNum forKey:@"phoneNum" error:&error]) {
            [test setValue:phoneNum forKey:@"phoneNum"];
        }
        
        NSLog(@"test: %@", test);
    } @catch (NSException *exception) {
        NSLog(@"exception: %@", exception);
    } @finally {
        NSLog(@"error");
    }
}

@end
