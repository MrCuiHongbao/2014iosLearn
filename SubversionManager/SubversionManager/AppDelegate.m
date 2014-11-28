//
//  AppDelegate.m
//  SubversionManager
//
//  Created by zhangliang on 14/11/27.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "AppDelegate.h"
#import "NSApplication+MenuExt.h"

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

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    NSRect rc = CGRectMake(0, 0, 100, 100);/*[[NSScreen mainScreen] visibleFrame];*/
    NSUInteger uistyle = NSTitledWindowMask | NSResizableWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask;
    NSBackingStoreType backingStoreStyle = NSBackingStoreBuffered;
    
    self.window = [[NSWindow alloc] initWithContentRect:rc styleMask:uistyle backing:backingStoreStyle defer:YES/* screen:screen*/];
//    [_window setFrameOrigin:NSMakePoint((rc.size.width-[_window frame].size.width)/2, (rc.size.height-[_window frame].size.height)/2)];
    [_window setTitle:@"SubversionControl"];
    [_window makeKeyAndOrderFront:nil];
//    [_window center];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
