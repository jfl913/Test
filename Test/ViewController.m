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
    /**
     Printing description of documentAttributeDict:
     {
     BottomMargin = 72;
     Converted = "-1";
     DocumentType = NSHTML;
     LeftMargin = 90;
     PaperMargin = "UIEdgeInsets: {72, 90, 72, 90}";
     PaperSize = "NSSize: {612, 792}";
     RightMargin = 90;
     TopMargin = 72;
     UTI = "public.html";
     }
     */
    NSDictionary *documentAttributeDict;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithData:htmlData
                                                                                          options:optionDict
                                                                               documentAttributes:&documentAttributeDict
                                                                                            error:nil];
    [attributedString addAttribute:NSFontAttributeName
                             value:[UIFont systemFontOfSize:17.0]
                             range:NSMakeRange(0, attributedString.length)];
    self.htmlLabel.attributedText = attributedString;
}

@end
