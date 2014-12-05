//
//  AppDelegate.m
//  ZLWindowTest
//
//  Created by zhangliang on 14/12/4.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "AppDelegate.h"
#import "ZLMainWindowController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    ZLMainWindowController * mainCon = [[ZLMainWindowController alloc] initWithWindowNibName:@"ZLMainWindowController"];
    [self.window setWindowController:mainCon];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
