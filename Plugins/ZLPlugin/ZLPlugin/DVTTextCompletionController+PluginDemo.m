//
//  DVTTextCompletionController+PluginDemo.m
//  ZLPlugin
//
//  Created by zhangliang on 14/11/3.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "DVTTextCompletionController+PluginDemo.h"

@implementation DVTTextCompletionController (PluginDemo)

+ (void)load
{
    MethodSwizzle(self, @selector(acceptCurrentCompletion), @selector(swizzledAcceptCurrentCompletion));
}

- (BOOL)swizzledAcceptCurrentCompletion {
    NSLog(@"acceptCurrentCompletion is called by %@", self);
    return [self swizzledAcceptCurrentCompletion];
}

@end
