//
//  NSView+NSViewCategory.m
//  ZLPlugin
//
//  Created by zhangliang on 14/11/3.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "NSView+NSViewCategory.h"

@implementation NSView (NSViewCategory)

-(void)dumpWithIndent:(NSString *)indent {
    NSString *class = NSStringFromClass([self class]);
    NSString *info = @"";
    if ([self respondsToSelector:@selector(title)]) {
        NSString *title = [self performSelector:@selector(title)];
        if (title != nil && [title length] > 0) {
            info = [info stringByAppendingFormat:@" title=%@", title];
        }
    }
    if ([self respondsToSelector:@selector(stringValue)]) {
        NSString *string = [self performSelector:@selector(stringValue)];
        if (string != nil && [string length] > 0) {
            info = [info stringByAppendingFormat:@" stringValue=%@", string];
        }
    }
    NSString *tooltip = [self toolTip];
    if (tooltip != nil && [tooltip length] > 0) {
        info = [info stringByAppendingFormat:@" tooltip=%@", tooltip];
    }
    
    NSLog(@"%@%@%@", indent, class, info);
    
    if ([[self subviews] count] > 0) {
        NSString *subIndent = [NSString stringWithFormat:@"%@%@", indent, ([indent length]/2)%2==0 ? @"| " : @": "];
        for (NSView *subview in [self subviews]) {
            [subview dumpWithIndent:subIndent];
        }
    }
}

@end
