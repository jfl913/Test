//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *htmlLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tapButton:nil];
}

- (IBAction)tapButton:(id)sender {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"html" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSString *htmlStr = dict[@"html"];
    
    NSData *htmlData = [htmlStr dataUsingEncoding:NSUnicodeStringEncoding];
    NSDictionary *optionDict = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithData:htmlData
                                                                                          options:optionDict
                                                                               documentAttributes:nil
                                                                                            error:nil];
//    [attributedString addAttribute:NSFontAttributeName
//                             value:[UIFont systemFontOfSize:14.0]
//                             range:NSMakeRange(0, attributedString.length)];
    self.htmlLabel.attributedText = attributedString;
    
}

@end
