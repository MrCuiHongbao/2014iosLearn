//
//  ViewController.m
//  FrameWorkBaseProject
//
//  Created by zhangliang on 14-10-16.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "ViewController.h"
#import <FrameworkTest/FrameworkTest.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ObjectOne * object = [[ObjectOne alloc] init];
    [object sayHello];
    [object baby];
    
    
    ObjectTwo * objectTwo = [[ObjectTwo alloc] init];
    [objectTwo saySelf];
    NSLog(@"%d", [objectTwo sum:3 and:4]);
    NSLog(@"%@", [objectTwo appStr:@"123456" andSecStr:@"7890"]);
    
    
    NSLog(@"%d", [self sum:3 and:4]);
    NSLog(@"%@", [self appStr:@"123456" andSecStr:@"7890"]);
    
    NSLog(@"hello, baby");
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
