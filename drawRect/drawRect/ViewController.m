//
//  ViewController.m
//  drawRect
//
//  Created by zhangliang on 14-10-15.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "ViewController.h"
#import "StarView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    StarView * view = [[StarView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    view.radius = 10;
    view.value = 0.5;
    view.startColor = [UIColor redColor];
    view.boundsColor = [UIColor whiteColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
