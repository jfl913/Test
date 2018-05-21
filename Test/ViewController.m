//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "NSString+CMChainSyntax.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *text = @"测试多行文字链接测试多行文字链接测试多行文字测试多行文字链接测试多行文字";
    self.label.attributedText = @"颜色/字体\n".attributedBuild.fontSize(30).color([UIColor purpleColor])
    .append(text).firstLineHeadIndent(20).lineHeight(25).paragraphSpacing(20)
    .match(@"链接").hexColor(0xFF4400).backgroundColor([UIColor lightGrayColor])
    .matchFirst(@"链接").underlineStyle(NSUnderlineStyleThick).underlineColor([UIColor greenColor])
    .matchLast(@"链接").strikethroughStyle(NSUnderlineStyleSingle).strikethroughColor([UIColor yellowColor])
    .append(text).alignment(NSTextAlignmentCenter).lineSpacing(10)
    .append(@"路飞").font([UIFont systemFontOfSize:25]).strokeWidth(2).strokeColor([UIColor darkGrayColor])
    .appendSizeImage([UIImage imageNamed:@"luffer"], CGSizeMake(50, 50));
}

- (IBAction)tapButton:(id)sender
{
    
    
}

@end
