//
//  ViewController.m
//  Localization
//
//  Created by zhangliang on 14-10-13.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    label.text = NSLocalizedString(@"share", @"分享");
    [self.view addSubview:label];
    [label release];
    
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 320, 30)];
//    label2.text = NSLocalizedString(@"share", @"分享");
    label2.text = [NSString localizedStringWithFormat:NSLocalizedString(@"I got %d points in spiral. Come on with me! https://itunes.apple.com/us/app/square-spiral/id920811081", "共享内容"), 10];
    
    [self.view addSubview:label2];
    [label2 release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
