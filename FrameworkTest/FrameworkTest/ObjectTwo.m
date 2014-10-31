//
//  ObjectTwo.m
//  FrameworkTest
//
//  Created by zhangliang on 14-10-16.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "ObjectTwo.h"

@implementation ObjectTwo
- (id)init
{
    if (self = [super init]) {
        [self saySelf];
    }
    return self;
}

- (void)saySelf
{
    NSLog(@"ObjectTwo");
}

- (int)sum:(int)num and:(int)num2
{
    int sum = 0;
    sum = num + num2;
    return sum;
}

- (NSString *)appStr:(NSString *)firStr andSecStr:(NSString *)secStr
{
    NSString * str = [[NSString alloc] initWithFormat:@"%@%@", firStr, secStr];
    return str;
}

@end
