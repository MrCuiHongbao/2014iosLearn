//
//  ZLCommandLine.m
//  SubversionManager
//
//  Created by zhangliang on 14/11/28.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "ZLCommandLine.h"

@implementation ZLCommandLine

+ (NSString *)valueOfArgument:(NSString *)arg
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:arg];
}

@end
