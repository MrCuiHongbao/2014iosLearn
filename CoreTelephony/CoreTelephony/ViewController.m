//
//  ViewController.m
//  CoreTelephony
//
//  Created by zhangliang on 14-8-11.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "ViewController.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>


@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(30, 100, 200, 300)];
    [self.view addSubview:textView];
    
    
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = info.subscriberCellularProvider;
//    carrierName    用户移动电话服务提供商
//    mobileCountryCode   用数字表示的，用户移动电话服务提供商的国家编码
//    mobileNetworkCode   用数字表示的，用户移动电话服务提供商的移动网络编码
//    isoCountryCode      用户移动电话服务提供商的iso国家编码
    

//    /*
//     * allowsVOIP
//     *
//     * Discussion:
//     *   A BOOL value that is YES if this carrier allows VOIP calls to be
//     *   made on its network, NO otherwise.
//     */
//    
//    @property (nonatomic, readonly, assign) BOOL allowsVOIP __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);
//    
//    @end

    textView.text = [NSString stringWithFormat:@"Carrier name:%@\nMobile Country Code:%@\nMobile Network Code:%@\nISO Country Code:%@\nAllows VOIP:%d", carrier.carrierName, carrier.mobileCountryCode, carrier.mobileNetworkCode, carrier.isoCountryCode, carrier.allowsVOIP];

    
    
    [textView release];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidTakeScreenshot:) name:UIApplicationUserDidTakeScreenshotNotification object:nil];
}

- (void)userDidTakeScreenshot:(NSNotification *)noti
{
    NSLog(@"%@", [noti description]);
    NSLog(@"%@", [noti userInfo]);
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"截屏了" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
