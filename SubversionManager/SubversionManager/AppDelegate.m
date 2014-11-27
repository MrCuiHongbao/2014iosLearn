//
//  AppDelegate.m
//  SubversionManager
//
//  Created by zhangliang on 14/11/27.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) NSWindow *window;
@end

@implementation AppDelegate

#pragma mark - 初始化Menu
- (id)init
{
    if (self = [super init]) {
        [self initBasicMenu];
    }
    return self;
}

- (void)initBasicMenu
{
    NSMenu * menuBar = [[NSMenu alloc] init];
    [NSApp setMainMenu:menuBar];
    
    NSMenuItem * appMenuItem = [[NSMenuItem alloc] init];
    [menuBar addItem:appMenuItem];
    
    NSMenuItem * fileMenuItem = [[NSMenuItem alloc] init];
    [menuBar addItem:fileMenuItem];
    
    NSMenuItem * editMenuItem = [[NSMenuItem alloc] init];
    [menuBar addItem:editMenuItem];
    

    
    [appMenuItem setSubmenu:[self appMenu]];
    
    [fileMenuItem setSubmenu:[self fileMenu]];
    
    [editMenuItem setSubmenu:[self editMenu]];
}

#pragma mark - App menu
- (NSMenu *)appMenu
{
    NSString * appName = [[NSProcessInfo processInfo] processName];
    NSMenu * appMenu = [[NSMenu alloc] initWithTitle:appName];
    NSString * aboutTitle = [@"About " stringByAppendingString:appName];
    NSMenuItem * aboutMenuItem = [[NSMenuItem alloc] initWithTitle:aboutTitle action:@selector(orderFrontStandardAboutPanel:) keyEquivalent:@""];
    [appMenu addItem:aboutMenuItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * preferencesItem = [[NSMenuItem alloc] initWithTitle:@"Preferences…" action:@selector(showPreferenceWindow) keyEquivalent:@","];
    [appMenu addItem:preferencesItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * servicesItem = [[NSMenuItem alloc] initWithTitle:@"Services" action:nil keyEquivalent:@""];
    
    NSMenu * servicesMenu = [[NSMenu alloc] initWithTitle:@"Services"];
    
    NSMenuItem * noServiceItem = [[NSMenuItem alloc] initWithTitle:@"No Services Apply" action:nil keyEquivalent:@""];
    [servicesMenu addItem:noServiceItem];
    
    NSMenuItem * servicesPreferencesItem = [[NSMenuItem alloc] initWithTitle:@"Services Preferences…" action:nil keyEquivalent:@""];
    [servicesPreferencesItem setImage:[NSImage imageNamed:NSImageNameSmartBadgeTemplate]];
    [servicesMenu addItem:servicesPreferencesItem];
    
    [appMenu setSubmenu:servicesMenu forItem:servicesItem];
    [appMenu addItem:servicesItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * hideItem = [[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:@"Hide %@", appName] action:@selector(hide:) keyEquivalent:@"h"];
    [appMenu addItem:hideItem];
    
    NSMenuItem * hideOthersItem = [[NSMenuItem alloc] initWithTitle:@"Hide Others" action:@selector(hideOtherApplications:) keyEquivalent:@"h"];
    [hideOthersItem setKeyEquivalentModifierMask:NSAlternateKeyMask | NSCommandKeyMask];
    [appMenu addItem:hideOthersItem];
    
    NSMenuItem * showAllItem = [[NSMenuItem alloc] initWithTitle:@"Show All" action:@selector(unhideAllApplications:) keyEquivalent:@""];
    [appMenu addItem:showAllItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * quitItem = [[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:@"Quit %@", appName] action:@selector(terminate:) keyEquivalent:@"q"];
    [appMenu addItem:quitItem];
    
    //对于keyEquivalent，大写字母和小写字母不同，大写字母为shift-cmd  小写为cmd， 也可以通过setKeyEquivalentModifierMask来设置
    
    return appMenu;
}

- (void)showPreferenceWindow
{
    
}

- (void)showServiceMenu
{
    
}

#pragma mark - File menu
- (NSMenu *)fileMenu
{
    NSString * appName = [[NSProcessInfo processInfo] processName];
    NSMenu * appMenu = [[NSMenu alloc] initWithTitle:@"File"];
    NSMenuItem * newItem = [[NSMenuItem alloc] initWithTitle:@"New" action:@selector(newDocument:) keyEquivalent:@"n"];
    [appMenu addItem:newItem];
    
    
    NSMenuItem * openItem = [[NSMenuItem alloc] initWithTitle:@"Open…" action:@selector(openDocument:) keyEquivalent:@"o"];
    [appMenu addItem:openItem];
    
    NSMenuItem * openRecentItem = [[NSMenuItem alloc] initWithTitle:@"Open Recent" action:@selector(openDocument:) keyEquivalent:@""];
    [appMenu addItem:openRecentItem];
    
    NSMenu * openRecentMenu = [[NSMenu alloc] initWithTitle:@"Open Recent"];
    NSMenuItem * clearMenu = [[NSMenuItem alloc] initWithTitle:@"Clear Menu" action:@selector(clearRecentDocuments:) keyEquivalent:@""];
    [openRecentMenu addItem:clearMenu];
    [appMenu setSubmenu:openRecentMenu forItem:openRecentItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * servicesItem = [[NSMenuItem alloc] initWithTitle:@"Services" action:@selector(showServiceMenu) keyEquivalent:@""];
    [appMenu addItem:servicesItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * hideItem = [[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:@"Hide %@", appName] action:@selector(hide:) keyEquivalent:@"h"];
    [appMenu addItem:hideItem];
    
    NSMenuItem * hideOthersItem = [[NSMenuItem alloc] initWithTitle:@"Hide Others" action:@selector(hideOtherApplications:) keyEquivalent:@"h"];
    [hideOthersItem setKeyEquivalentModifierMask:NSAlternateKeyMask | NSCommandKeyMask];
    [appMenu addItem:hideOthersItem];
    
    NSMenuItem * showAllItem = [[NSMenuItem alloc] initWithTitle:@"Show All" action:@selector(unhideAllApplications:) keyEquivalent:@""];
    [appMenu addItem:showAllItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * quitItem = [[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:@"Quit %@", appName] action:@selector(terminate:) keyEquivalent:@"q"];
    [appMenu addItem:quitItem];
    
    //对于keyEquivalent，大写字母和小写字母不同，大写字母为shift-cmd  小写为cmd， 也可以通过setKeyEquivalentModifierMask来设置
    
    return appMenu;
}

- (void)newDocument:(id)sender
{
    
}

- (void)openDocument:(id)sender
{
    
}

#pragma mark - Edit menu
- (NSMenu *)editMenu
{
    NSString * appName = [[NSProcessInfo processInfo] processName];
    NSMenu * appMenu = [[NSMenu alloc] initWithTitle:@"Edit"];
    NSString * aboutTitle = @"New";
    NSMenuItem * aboutMenuItem = [[NSMenuItem alloc] initWithTitle:aboutTitle action:@selector(orderFrontStandardAboutPanel:) keyEquivalent:@""];
    [appMenu addItem:aboutMenuItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * preferencesItem = [[NSMenuItem alloc] initWithTitle:@"Open" action:@selector(showPreferenceWindow) keyEquivalent:@","];
    [appMenu addItem:preferencesItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * servicesItem = [[NSMenuItem alloc] initWithTitle:@"Open recent" action:@selector(showServiceMenu) keyEquivalent:@""];
    [appMenu addItem:servicesItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * hideItem = [[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:@"Hide %@", appName] action:@selector(hide:) keyEquivalent:@"h"];
    [appMenu addItem:hideItem];
    
    NSMenuItem * hideOthersItem = [[NSMenuItem alloc] initWithTitle:@"Hide Others" action:@selector(hideOtherApplications:) keyEquivalent:@"h"];
    [hideOthersItem setKeyEquivalentModifierMask:NSAlternateKeyMask | NSCommandKeyMask];
    [appMenu addItem:hideOthersItem];
    
    NSMenuItem * showAllItem = [[NSMenuItem alloc] initWithTitle:@"Show All" action:@selector(unhideAllApplications:) keyEquivalent:@""];
    [appMenu addItem:showAllItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * quitItem = [[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:@"Quit %@", appName] action:@selector(terminate:) keyEquivalent:@"q"];
    [appMenu addItem:quitItem];
    
    //对于keyEquivalent，大写字母和小写字母不同，大写字母为shift-cmd  小写为cmd， 也可以通过setKeyEquivalentModifierMask来设置
    
    return appMenu;
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
