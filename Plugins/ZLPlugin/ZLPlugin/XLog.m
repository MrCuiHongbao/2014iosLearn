//
//  XLog.m
//  ZLPlugin
//
//  Created by zhangliang on 14/10/31.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "XLog.h"

@interface XLog()

@property (nonatomic, strong) NSString * selectedText;

@end

@implementation XLog


+ (void)load
{
    NSLog(@"123456789***********************");
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

+ (void)pluginDidLoad:(NSBundle *)bundle
{
    [self shared];
}

+(id) shared {
    static dispatch_once_t once;
    static id instance = nil;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)init
{
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidFinishLaunching:) name:NSApplicationDidFinishLaunchingNotification object:nil];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)noti {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(selectionDidChange:)
                                                 name:NSTextViewDidChangeSelectionNotification
                                               object:nil];
    NSMenuItem *editMenuItem = [[NSApp mainMenu] itemWithTitle:@"Edit"];
    if (editMenuItem) {
        NSMenu * editSubMenu = [editMenuItem submenu];
        
        NSLog(@"count:*********%ld", editSubMenu.itemArray.count);
        for (NSMenuItem * item in editSubMenu.itemArray) {
            NSLog(@"title : ******  %@", item.title);
        }
        
        NSMenuItem * separatorItem = [NSMenuItem separatorItem];
        [editSubMenu addItem:separatorItem];
        
        NSMenuItem *newMenuItem = [[NSMenuItem alloc] initWithTitle:@"What is selected" action:@selector(showSelected:) keyEquivalent:@""];
        [newMenuItem setTarget:self];
        [newMenuItem setKeyEquivalentModifierMask: NSAlternateKeyMask];
        [[editMenuItem submenu] addItem:newMenuItem];
    }   
}

-(void) selectionDidChange:(NSNotification *)noti {
    //Nothing now. Just in case of crash.
    if ([[noti object] isKindOfClass:[NSTextView class]]) {
        NSTextView * textView = (NSTextView *)[noti object];
        NSArray * selectedRanges = [textView selectedRanges];
        if (selectedRanges.count == 0) {
            return;
        }
        
        NSRange selectedRange = [[selectedRanges objectAtIndex:0] rangeValue];
        NSString * text = textView.textStorage.string;
        self.selectedText = [text substringWithRange:selectedRange];
    }
}

-(void) showSelected:(NSNotification *)noti {
    //Nothing now. Just in case of crash.
    NSAlert * alert = [[NSAlert alloc] init];
    [alert setMessageText:self.selectedText];
    [alert runModal];
}

@end
