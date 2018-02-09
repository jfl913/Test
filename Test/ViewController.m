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
    NSMutableArray *mutableArray = @[].mutableCopy;
    if ([mutableArray isKindOfClass:[NSArray class]]) {
        NSLog(@"mutableArray isKindOfClass NSArray");
    } else {
        NSLog(@"mutableArray is not KindOfClass NSArray");
    }
    
    if ([mutableArray isKindOfClass:[NSMutableArray class]]) {
        NSLog(@"mutableArray isKindOfClass NSMutableArray");
    } else {
        NSLog(@"mutableArray is not KindOfClass NSMutableArray");
    }
    
    if ([mutableArray isMemberOfClass:[NSArray class]]) {
        NSLog(@"mutableArray isMemberOfClass NSArray");
    } else {
        NSLog(@"mutableArray is not MemberOfClass NSArray");
    }
    
    if ([mutableArray isMemberOfClass:[NSMutableArray class]]) {
        NSLog(@"mutableArray isMemberOfClass NSMutableArray");
    } else {
        NSLog(@"mutableArray is not MemberOfClass NSMutableArray");
    }
    
    if ([NSMutableArray isSubclassOfClass:[NSArray class]]) {
        NSLog(@"NSMutableArray isSubclassOfClass NSArray");
    } else {
        NSLog(@"NSMutableArray is not SubclassOfClass NSArray");
    }
    
    NSString *classString = NSStringFromClass([mutableArray class]);
    NSLog(@"classString: %@", classString);
    
    if ([mutableArray respondsToSelector:@selector(addObject:)]) {
        NSLog(@"NSMutableArray respondsToSelector addObject");
    } else {
        NSLog(@"NSMutableArray not respondsToSelector addObject");
    }
    
    NSArray *array =@[];
    if ([array respondsToSelector:@selector(addObject:)]) {
        NSLog(@"NSArray respondsToSelector addObject");
    } else {
        NSLog(@"NSArray not respondsToSelector addObject");
    }
    
    if ([array isKindOfClass:[NSArray class]]) {
        NSLog(@"array isKindOfClass NSArray");
    } else {
        NSLog(@"array is not KindOfClass NSArray");
    }
    
    if ([NSArray isSubclassOfClass:[NSArray class]]) {
        NSLog(@"NSArray isSubclassOfClass NSArray");
    } else {
        NSLog(@"NSArray is not SubclassOfClass NSArray");
    }
    
    if ([NSArray instancesRespondToSelector:@selector(addObject:)]) {
        NSLog(@"NSArray instancesRespondToSelector addObject");
    } else {
        NSLog(@"NSArray not instancesRespondToSelector addObject");
    }
    
    if ([NSMutableArray instancesRespondToSelector:@selector(addObject:)]) {
        NSLog(@"NSMutableArray instancesRespondToSelector addObject");
    } else {
        NSLog(@"NSMutableArray not instancesRespondToSelector addObject");
    }
}

@end
