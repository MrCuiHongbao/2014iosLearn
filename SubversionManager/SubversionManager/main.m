//
//  main.m
//  SubversionManager
//
//  Created by zhangliang on 14/11/27.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    [NSApplication sharedApplication];
    
    AppDelegate * appDelegate = [[AppDelegate alloc] init];
    [[NSApplication sharedApplication] setDelegate:appDelegate];
    
    [NSApp run];
    return 0;
}


