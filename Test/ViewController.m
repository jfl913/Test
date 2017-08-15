//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)tapButton:(id)sender
{
    NSString *testString = @"*9*^&29";
    NSString *regexPattern = @"\\d+";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexPattern
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    NSArray *resultArray = [regex matchesInString:testString
                                          options:NSMatchingReportCompletion
                                            range:NSMakeRange(0, testString.length)];
    for (NSInteger i = resultArray.count - 1; i >= 0; i--) {
        NSTextCheckingResult *result = resultArray[i];
        NSRange resultRange = result.range;
        NSString *resultString = [testString substringWithRange:resultRange];
        NSLog(@"resultString: %@", resultString);
    }
}

@end
