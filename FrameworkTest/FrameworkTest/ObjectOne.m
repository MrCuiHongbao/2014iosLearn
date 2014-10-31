//
//  ObjectOne.m
//  FrameworkTest
//
//  Created by zhangliang on 14-10-16.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "ObjectOne.h"
#import "ObjectTwo.h"

@implementation ObjectOne

- (id)init
{
    if (self = [super init]) {
        [self baby];
    }
    return self;
}

- (void)sayHello
{
    ObjectTwo * two = [[ObjectTwo alloc] init];
    [two saySelf];
}

- (void)baby
{
    NSLog(@"baby");
}

@end
