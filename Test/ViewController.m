//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "ClassContainer.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)tapButton:(id)sender {
    ClassContainer *containerObject = [ClassContainer new];
    ClassUnsafeUnretained *unsafeUnretainedObject = [ClassUnsafeUnretained new];
    ClassWeak *weakObject = [ClassWeak new];
    
    containerObject.unsafeUnretainedObject = unsafeUnretainedObject;
    containerObject.weakObject = weakObject;
    
    BOOL testWeak = NO;
    if (testWeak) {
        [containerObject.weakObject print];
        [weakObject print];
        weakObject = nil;
        [containerObject.weakObject print];
    } else {
        [containerObject.unsafeUnretainedObject print];
        [unsafeUnretainedObject print];
        unsafeUnretainedObject = nil;
        [containerObject.unsafeUnretainedObject print];
    }
}

@end
