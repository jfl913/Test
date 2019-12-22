//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"
#import "Parent.h"
#import "Child.h"
#import "Parent+Add.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Parent *parent = [Parent new];
//    [parent printName];
    
//    Child *child = [Child new];
//    [child printName];
    
//    Parent *parent = [Parent new];
//    [parent performSelector:@selector(printAge)];
    
//    [Parent performSelector:@selector(printGender)];
}

- (IBAction)tapButton:(id)sender {
//    Parent *parent = [Parent new];
//    [parent printAge];
    
//    [Parent printGender];
    [Parent performSelector:@selector(printGender)];
}

@end
