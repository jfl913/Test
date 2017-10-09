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

@property (weak, nonatomic) IBOutlet UILabel *htmlLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)tapButton:(id)sender
{
    NSString *htmlStr = @"<!DOCTYPE html><html><head><meta charset=\"UTF-8\"><title></title></head><body><font color=\"#ff0000\">测测你的投资风格</font></body></html>";
    NSData *htmlData = [htmlStr dataUsingEncoding:NSUnicodeStringEncoding];
    NSDictionary *optionDict = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithData:htmlData
                                                                                          options:optionDict
                                                                               documentAttributes:nil
                                                                                            error:nil];
    [attributedString addAttribute:NSFontAttributeName
                             value:[UIFont systemFontOfSize:17.0]
                             range:NSMakeRange(0, attributedString.length)];
    self.htmlLabel.attributedText = attributedString;
}

@end
