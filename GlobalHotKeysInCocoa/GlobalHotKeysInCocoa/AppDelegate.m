//
//  AppDelegate.m
//  GlobalHotKeysInCocoa
//
//  Created by zhangliang on 14/12/11.
//  Copyright (c) 2014年 GAG. All rights reserved.
//


/**
 *	@brief	参考文章
 */
//http://dbachrach.com/blog/2005/11/program-global-hotkeys-in-cocoa-easily/
//http://www.tanhao.me/pieces/1268.html

#import "AppDelegate.h"
#import <Carbon/Carbon.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end




static NSString * hello;
@implementation AppDelegate

OSStatus OnHotKeyEvent(EventHandlerCallRef nextHandler,EventRef theEvent,void *userData)
{
    EventHotKeyID hkCom;
    
    GetEventParameter(theEvent, kEventParamDirectObject, typeEventHotKeyID, NULL, sizeof(hkCom), NULL, &hkCom);
    
    
    AppDelegate *controller = (__bridge AppDelegate *)userData;
    
    OSType signature = hkCom.signature;
    NSLog(@"%u", signature);
    
    int l = hkCom.id;
    
    switch (l) {
        case 1:
            NSLog(@"Capture area");
            break;
        case 2:
            NSLog(@"Capture screen");
            break;
        case 3:
            NSLog(@"Capture window");
            break;
        case 4:
        {
            NSWindowController *add_window;
            if(!hello){
                //打开QuickWindow
                add_window = [[NSWindowController alloc] initWithWindowNibName:@"HUDWindow"];
                
                [add_window loadWindow];
                hello = @"123";
            }
            
            //打开窗体
            [add_window showWindow:[add_window window]];
            [[add_window window] makeMainWindow];
            
            //下面的有问题
            // Show
            [[add_window window] makeKeyAndOrderFront:controller.window];
            [NSApp activateIgnoringOtherApps:YES];
            
            // Hide
//                [[add_window window] orderOut:controller.window];
        }
            break;
    }
    
    return noErr;
}


-(void)registerHotKeys
{
    EventHotKeyRef gMyHotKeyRef;
    EventHotKeyID gMyHotKeyID;
    EventTypeSpec eventType;
    eventType.eventClass=kEventClassKeyboard;
    eventType.eventKind=kEventHotKeyPressed;
    
    InstallApplicationEventHandler(&OnHotKeyEvent, 1, &eventType, (__bridge void *)self, NULL);
    
    gMyHotKeyID.signature='htk1';
    gMyHotKeyID.id=1;
    //3， 4， 5键
    RegisterEventHotKey(kVK_ANSI_3, cmdKey + optionKey, gMyHotKeyID, GetApplicationEventTarget(), 0, &gMyHotKeyRef);
    
    gMyHotKeyID.signature = 'htk2';
    gMyHotKeyID.id = 2;
    RegisterEventHotKey(kVK_ANSI_4, cmdKey + optionKey, gMyHotKeyID, GetApplicationEventTarget(), 0, &gMyHotKeyRef);
    
    gMyHotKeyID.signature = 'htk3';
    gMyHotKeyID.id = 3;
    RegisterEventHotKey(kVK_ANSI_5, cmdKey + optionKey, gMyHotKeyID, GetApplicationEventTarget(), 0, &gMyHotKeyRef);
    
    gMyHotKeyID.signature = 'htk4';
    gMyHotKeyID.id = 4;
    RegisterEventHotKey(kVK_Return, cmdKey + optionKey, gMyHotKeyID, GetApplicationEventTarget(), 0, &gMyHotKeyRef);
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [self registerHotKeys];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
