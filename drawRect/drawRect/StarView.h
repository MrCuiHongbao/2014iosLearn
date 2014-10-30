//
//  StarView.h
//  drawRect
//
//  Created by zhangliang on 14-10-15.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat th;
@property (nonatomic, retain) UIColor * startColor;
@property (nonatomic, retain) UIColor * boundsColor;
@property (nonatomic, assign) CGFloat value;
@end
