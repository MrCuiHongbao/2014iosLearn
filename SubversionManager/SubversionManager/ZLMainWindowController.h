//
//  ZLMainWindowController.h
//  SubversionManager
//
//  Created by zhangliang on 14/11/28.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ZLMainWindowController : NSWindowController
@property (weak) IBOutlet NSButton *startButton;
@property (weak) IBOutlet NSButton *stopButton;

- (IBAction)sayIt:(id)sender;

- (IBAction)stop:(id)sender;

@end
