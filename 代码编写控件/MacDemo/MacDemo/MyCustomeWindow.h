//
//  MyCustomeWindow.h
//  MacDemo
//
//  Created by zhangliang on 14/12/11.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyCustomeWindow : NSWindow
{
    NSWindow * trackingWin;
    
    BOOL movingVertically;
}

@end
