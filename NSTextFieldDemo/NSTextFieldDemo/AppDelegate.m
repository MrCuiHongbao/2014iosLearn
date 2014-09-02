//
//  AppDelegate.m
//  NSTextFieldDemo
//
//  Created by zhangliang on 14-9-2.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSTextField *text =[[NSTextField alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    [text setBackgroundColor:[NSColor colorWithRed:127.0/255.0 green:127.0/255.0 blue:127.0/255.0 alpha:1]];
    text.delegate = self;
    NSView * view = [[NSView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [view addSubview:text];
    [self.window.contentView addSubview:view];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textchanged:) name:NSControlTextDidChangeNotification object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textEnded:) name:NSControlTextDidEndEditingNotification object:nil];
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
