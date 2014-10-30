//
//  AppDelegate.m
//  NSTextFieldDemo
//
//  Created by zhangliang on 14-9-2.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize text;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.text = [[NSTextField alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    [text setBackgroundColor:[NSColor colorWithRed:127.0/255.0 green:127.0/255.0 blue:127.0/255.0 alpha:1]];
    [text setEditable:NO];
    text.delegate = self;
    NSView * view = [[NSView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [view addSubview:text];
    [self.window.contentView addSubview:view];
    
    text.stringValue = @"111";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textchanged:) name:NSControlTextDidChangeNotification object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textEnded:) name:NSControlTextDidEndEditingNotification object:nil];
    
    NSButton * button = [[NSButton alloc] initWithFrame:CGRectMake(300, 0, 50, 50)];
    [button setAction:@selector(hello)];
    [self.window.contentView addSubview:button];
}

- (void)hello
{
    self.text.stringValue = @"123456789";
}

- (BOOL)textShouldBeginEditing:(NSText *)textObject
{
    return NO;
}

- (void)textchanged:(NSNotification *)noti
{
    NSTextField *textfield = noti.object;
    NSLog(@"%@", textfield.stringValue);
}

- (void)textEnded:(NSNotification *)noti
{
    NSTextField *textfield = noti.object;
    NSLog(@"%@", textfield.stringValue);
    NSLog(@"babab:%@", [noti description]);
}
@end
