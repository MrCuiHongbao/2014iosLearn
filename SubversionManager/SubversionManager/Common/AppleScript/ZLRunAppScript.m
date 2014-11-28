//
//  ZLRunAppScript.m
//  SubversionManager
//
//  Created by zhangliang on 14/11/28.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "ZLRunAppScript.h"

@implementation ZLRunAppScript

+ (void)runAppleScriptWithName:(NSString *)scriptName andType:(NSString *)scriptType
{
    NSString *scriptPath = [[NSBundle mainBundle]
                            pathForResource:scriptName
                            ofType:scriptType];
    NSURL *scriptURL = [NSURL fileURLWithPath:scriptPath];
    
    NSAppleScript *as = [[NSAppleScript alloc]
                         initWithContentsOfURL:scriptURL
                         error: nil];
    [as executeAndReturnError: NULL];
}

@end
