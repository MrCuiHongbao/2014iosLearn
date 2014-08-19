//
//  ViewController.m
//  YouMengShareDemo
//
//  Created by zhangliang on 14-8-19.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<UMSocialUIDelegate>
@property (nonatomic, retain) UITextView * mtextView;
@end

@implementation ViewController
@synthesize mtextView;
- (void)dealloc
{
    [mtextView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 64, 80, 44);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"share" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(toshare) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.mtextView = [[[UITextView alloc] initWithFrame:CGRectMake(20, button.frame.origin.y + button.frame.size.height, 280, 300)] autorelease];
    mtextView.editable = NO;
    [self.view addSubview:self.mtextView];
}

- (void)toshare
{
#ifdef UMSocialDefault 
    //1. 支持分享编辑页和授权页面横屏，必须要在出现列表页面前设置:
    //[UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskLandscape];
    
    
    //2注意：分享到微信好友、微信朋友圈、微信收藏、QQ空间、QQ好友、来往好友、来往朋友圈、易信好友、易信朋友圈、Facebook、Twitter、Instagram等平台需要参考各自的集成方法
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:JIUSHIKUAI_SHARE_KEY
                                      shareText:@"友盟分享测试"
                                     shareImage:[UIImage imageNamed:@"UMS_qzone_icon@2x.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,nil]
                                       delegate:self];
#endif
    
#ifdef UMSocialAPI
//    使用分享API（自动授权后跳转到内容编辑页）
//    适用人群：较深耕细作型开发者，希望自定义分享列表，使用分享底层API，但仍使用友盟提供的分享编辑页。
//    接口说明：如果已经授权，则直接跳转到分享编辑页，否则将进行授权操作然后再跳转到分享编辑页.相比presentSnsIconSheetView方法，该接口不需要弹出分享面板。该接口支持所有平台的分享（QQ好友，微信会有选择好友的界面）。
    [[UMSocialControllerService defaultControllerService] setShareText:@"友盟分享测试" shareImage:[UIImage imageNamed:@"UMS_qzone_icon@2x.png"] socialUIDelegate:self];//设置分享内容和回调对象
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToTencent].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
//    注意：若弹出横屏的页面，必须要在出现编辑页面前设置
//    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskLandscape];
#endif
    
    
#ifdef UMSocialBasicAutoAuth
//    适用人群：较深耕细作型开发者，希望自定义分享列表，希望授权和分享发生，使用分享底层API并自动授权。
//    直接发送微博到对应的微博平台,仅支持分享到一个平台，可以传入文字、图片、地理位置、url资源。图片、地理位置和url资源可以设为nil。
//    只发送到一个微博平台，且该平台没有先授权，SDK会自动打开授权页面，授权完成之后再发送微博。
    CLLocation * location = [[CLLocation alloc] initWithLatitude:256.0 longitude:112.0];
    UMSocialUrlResource * url = [[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeImage url:@"http://su.bdimg.com/static/superplus/img/logo_white_ee663702.png"];
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToSina] content:@"友盟分享测试" image:[UIImage imageNamed:@"UMS_qzone_icon@2x.png"] location:location urlResource:url presentedController:self completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            self.mtextView.text = response.description;
        }
    }];
    [location release];
    [url release];
    
#endif
    
#ifdef UMSocialBasicAuthSepShare 
#endif
}

#pragma mark - Share delegate

#ifdef UMSocialDefault
//3. 点击每个平台后默认会进入内容编辑页面，若想点击后直接分享内容，可以实现下面的回调方法。
//弹出列表方法presentSnsIconSheetView需要设置delegate为self
-(BOOL)isDirectShareInIconActionSheet
{
    return NO;
}

//3 分享成功或失败后回调方法
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
//        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
        self.mtextView.text = response.description;
    }
}

#endif


#ifdef UMSocialAPI

-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        self.mtextView.text = response.description;
    }
}

#endif

#ifdef UMSocialBasicAutoAuth

#endif

#ifdef UMSocialBasicAuthSepShare

#endif

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
