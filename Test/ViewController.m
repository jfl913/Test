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
    NSDateComponents *dateComponents = [NSDateComponents new];
//    dateComponents.month = 1;
//    dateComponents.day = 3;
//    dateComponents.hour = 0;
//    dateComponents.minute = 1;
    dateComponents.second = 5;
    NSDate *today = [NSDate date];
    NSLog(@"today: %@", today);
    // calculatedDate = today + dateComponents
    NSDate *calculatedDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents
                                                                           toDate:today
                                                                          options:0];
    NSLog(@"calculatedDate: %@", calculatedDate);
    
    UILocalNotification *localNotification = [UILocalNotification new];
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.alertTitle = @"❤️你老婆";
    localNotification.alertBody = @"Love you! 左晓霞！";
    localNotification.alertAction = @"See Lover!";
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = 8;
    localNotification.fireDate = calculatedDate;
    localNotification.userInfo = @{@"lover": @"左晓霞"};
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

@end
