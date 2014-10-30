//
//  AppDelegate.m
//  HelloTodayWidget
//
//  Created by zhangliang on 14-10-10.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()<UIAlertViewDelegate>
@property (nonatomic, retain) ViewController * vc;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds] autorelease];
    self.vc = [[[ViewController alloc] initWithNibName:nil bundle:nil]autorelease];
    
    UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:self.vc];
    self.window.rootViewController = navi;
    [navi release];
    [self.window makeKeyAndVisible];
    
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

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
//    UIAlertController * alertvc = [UIAlertController alertControllerWithTitle:@"提示信息" message:[NSString stringWithFormat:@"url:%@     sourceApplication:%@      annotation:%@", url.description, sourceApplication, annotation] preferredStyle:UIAlertControllerStyleAlert];
//    
//    [self.window.rootViewController.navigationController presentViewController:alertvc animated:YES completion:nil];
    
    UIAlertView * alertview = [[UIAlertView alloc] initWithTitle:@"提示信息" message:[NSString stringWithFormat:@"url:%@     sourceApplication:%@      annotation:%@", url.description, sourceApplication, annotation] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertview show];
    [alertview release];
    
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

}

@end
