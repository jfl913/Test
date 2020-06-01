//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person = [Person new];
    self.person.age = 34;
    [self.person addObserver:self
                  forKeyPath:@"age"
                     options: NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                     context:nil];
    self.person.age = 35;
}

- (void)dealloc {
    [self.person removeObserver:self forKeyPath:@"age"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"监听到 %@ 的 %@ 改变了 %@", object, keyPath, change);
}

- (IBAction)tapButton:(id)sender {
    
}

@end
