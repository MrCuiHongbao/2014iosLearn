//
//  ObjectTwo.h
//  FrameworkTest
//
//  Created by zhangliang on 14-10-16.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectTwo : NSObject

- (id)init;

- (void)saySelf;

- (int)sum:(int)num and:(int)num2;

- (NSString *)appStr:(NSString *)firStr andSecStr:(NSString *)secStr;

@end
