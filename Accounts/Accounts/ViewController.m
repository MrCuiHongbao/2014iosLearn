//
//  ViewController.m
//  Accounts
//
//  Created by zhangliang on 14-8-8.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "ViewController.h"
#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>


#define BARBUTTONITEM(bar,title,act) UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithTitle:title \
style:UIBarButtonItemStylePlain \
target:self \
action:act];

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
