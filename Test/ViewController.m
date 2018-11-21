//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "AXAttributedString.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)tapButton:(id)sender {
    self.testLabel.attributedText = [AXAttributedString makeAttributedString:^(AXAttributedStringMaker *make) {
        make.text(@"第一段").foregroundColor([UIColor redColor]).font([UIFont systemFontOfSize:14]).underline(NSUnderlineStyleSingle);
        make.text(@"第二段").font([UIFont systemFontOfSize:14]).foregroundColor(UIColor.blueColor).backgroundColor(UIColor.lightGrayColor);
        make.text(@"第一段").foregroundColor([UIColor orangeColor]).font([UIFont systemFontOfSize:14]).underline(NSUnderlineStyleSingle);
        make.text(@"\n");
        make.text(@"第四段").foregroundColor([UIColor redColor]).font([UIFont boldSystemFontOfSize:30]).underline(NSUnderlineStyleSingle).baseline(-15);
    }];
}

@end
