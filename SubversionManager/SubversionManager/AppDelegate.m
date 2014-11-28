//
//  AppDelegate.m
//  SubversionManager
//
//  Created by zhangliang on 14/11/27.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "AppDelegate.h"
#import "NSApplication+MenuExt.h"
#import "ZLMainWindowController.h"

@interface AppDelegate ()

@property (strong) NSWindow *window;
@end

@implementation AppDelegate

#pragma mark - 初始化Menu
- (id)init
{
    if (self = [super init]) {
        [NSApplication makeMenu];
    }
    return self;
}

- (void)applicationWillFinishLaunching:(NSNotification *)notification
{
    
}

- (void)showWindow
{
    NSRect rc = CGRectMake(0, 0, 0, 0);/*[[NSScreen mainScreen] visibleFrame];*/
    NSUInteger uistyle = NSTitledWindowMask | NSResizableWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask;
    NSBackingStoreType backingStoreStyle = NSBackingStoreBuffered;
    
    self.window = [[NSWindow alloc] initWithContentRect:rc styleMask:uistyle backing:backingStoreStyle defer:YES/* screen:screen*/];
    [_window setTitle:@"SubversionControl"];
    [_window makeKeyAndOrderFront:nil];
    //    [_window center];
}

- (void)showNewWindow
{
    [self showWindow];
    
    ZLMainWindowController * mainwindowCon = [[ZLMainWindowController alloc] initWithWindowNibName:@"ZLMainWindowController"];
    [self.window addChildWindow:mainwindowCon.window ordered:NSWindowAbove];
}

- (void)customMenuItemView
{
    NSMenuItem * aboutMenuItem = [[NSMenuItem alloc] initWithTitle:@"DockMenu" action:nil keyEquivalent:@""];
    
    NSMenu * menu = [[NSMenu alloc] initWithTitle:@"DockMenu"];
    NSMenuItem *newItem = [[NSMenuItem alloc] initWithTitle:@"About"
                                                                               action:@selector(aboutDockAction:)
                                                                        keyEquivalent:@""];
    [newItem setTarget: self];
    [menu addItem:newItem];
    [aboutMenuItem setSubmenu:menu];
    
    [[NSApp mainMenu] addItem:aboutMenuItem];
    
    [self showNewWindow];
}

- (void)aboutDockAction:(id)sender
{
    [[NSApplication sharedApplication] orderFrontStandardAboutPanel:self];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [self customMenuItemView];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
