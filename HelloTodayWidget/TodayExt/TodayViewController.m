//
//  TodayViewController.m
//  TodayExt
//
//  Created by zhangliang on 14-10-13.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "MyTestView.h"

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSArray * array = [[NSBundle mainBundle] loadNibNamed:@"MyTestView" owner:self options:nil];
    MyTestView * view = [array objectAtIndex:0];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(0, 0, 320, 130);
    
    [self.view addSubview:view];
    [self setPreferredContentSize:CGSizeMake(self.view.frame.size.width, view.frame.size.height)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
