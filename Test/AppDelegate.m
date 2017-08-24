//
//  AppDelegate.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ViewController *vc = [ViewController new];
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor yellowColor];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    self.normalWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.normalWindow.backgroundColor = [UIColor blueColor];
    self.normalWindow.windowLevel = UIWindowLevelNormal;
    self.normalWindow.rootViewController = vc;
    [self.normalWindow makeKeyAndVisible];
    
    CGRect windowRect = CGRectMake(50,
                                   50,
                                   [[UIScreen mainScreen] bounds].size.width - 100,
                                   [[UIScreen mainScreen] bounds].size.height - 100);
    self.alertLevelWindow = [[UIWindow alloc] initWithFrame:windowRect];
    self.alertLevelWindow.windowLevel = UIWindowLevelAlert;
    self.alertLevelWindow.backgroundColor = [UIColor redColor];
    self.alertLevelWindow.rootViewController = vc;
    [self.alertLevelWindow makeKeyAndVisible];
    
    self.statusLevelWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, 50, screenWidth, 20)];
    self.statusLevelWindow.windowLevel = UIWindowLevelStatusBar;
    self.statusLevelWindow.backgroundColor = [UIColor blackColor];
    self.statusLevelWindow.rootViewController = vc;
    [self.statusLevelWindow makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
