//
//  MyCustomeWindow.m
//  MacDemo
//
//  Created by zhangliang on 14/12/11.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "MyCustomeWindow.h"

#define ALPHAVALUE 0.2

@implementation MyCustomeWindow

- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    self = [super initWithContentRect:contentRect styleMask:NSBorderlessWindowMask backing:bufferingType defer:flag];
    if (self) {
        [self setOpaque:NO];
        [self setHasShadow:YES];
        [self setLevel:NSFloatingWindowLevel];
        [self setAlphaValue:ALPHAVALUE];
    }
    
    return self;
}

- (void)awakeFromNib
{
    
}

@end
