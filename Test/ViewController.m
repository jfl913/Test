//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "TeacherDao.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)tapButton:(id)sender
{
    [TeacherDao save];
    
    
}

@end
