//
//  AppDelegate.m
//  MacDemo
//
//  Created by zhangliang on 14/12/9.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "AppDelegate.h"
#import "MyWindowViewController.h"


@interface AppDelegate ()
{
//    MyWindowViewController * windowC;
}

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
//    windowC = [[MyWindowViewController alloc] initWithWindowNibName:@"MyWindowViewController"];
//    [windowC showWindow:self];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
