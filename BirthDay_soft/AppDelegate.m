//
//  AppDelegate.m
//  BirthDay_soft
//
//  Created by YuLei on 14-5-14.
//  Copyright (c) 2014年 ___DuanYuLei___. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "FocusViewController.h"
#import "FunViewController.h"
#import "BuyCarViewController.h"
#import "MeViewController.h"
#import "Custom_tabbar.h"

@implementation AppDelegate{
    UITabBarController *tabbar;
    Custom_tabbar *customTabbar;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    tabbar = [[UITabBarController alloc] init];
    
    RootViewController *root = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
    FocusViewController *focus = [[FocusViewController alloc] initWithNibName:@"FocusViewController" bundle:nil];
    FunViewController *fun = [[FunViewController alloc] initWithNibName:@"FunViewController" bundle:nil];
    BuyCarViewController *buy = [[BuyCarViewController alloc] initWithNibName:@"BuyCarViewController" bundle:nil];
    MeViewController *me = [[MeViewController alloc] initWithNibName:@"MeViewController" bundle:nil];
    UINavigationController *nav_1 = [[UINavigationController alloc] initWithRootViewController:root];
    UINavigationController *nav_2 = [[UINavigationController alloc] initWithRootViewController:focus];
    UINavigationController *nav_3 = [[UINavigationController alloc] initWithRootViewController:fun];
    UINavigationController *nav_4 = [[UINavigationController alloc] initWithRootViewController:buy];
    UINavigationController *nav_5 = [[UINavigationController alloc] initWithRootViewController:me];
    
    tabbar.viewControllers = @[nav_1, nav_2, nav_3, nav_4, nav_5];
    self.window.backgroundColor = [UIColor colorWithWhite:1 alpha:0.95];
    
    [self customTabbar];
    int index = [[NSUserDefaults standardUserDefaults] integerForKey:@"TabIndex"];
    tabbar.selectedIndex = index;
    [customTabbar setSelectIndex:index];
    
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)customTabbar{
    //tabbar.tabBar.hidden = YES;
    customTabbar = [[NSBundle mainBundle] loadNibNamed:@"Custom_tabbar" owner:self options:nil][0];
    customTabbar.tabbarController = tabbar;
    customTabbar.frame = CGRectMake(0, self.window.bounds.size.height-49, 320, 49);
    [tabbar.view addSubview:customTabbar];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
