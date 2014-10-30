//
//  AppDelegate.h
//  NSTextFieldDemo
//
//  Created by zhangliang on 14-9-2.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTextFieldDelegate, NSTextDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (retain) NSTextField *text;
@end
