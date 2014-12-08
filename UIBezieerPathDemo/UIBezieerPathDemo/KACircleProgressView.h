//
//  KACircleProgressView.h
//  UIBezieerPathDemo
//
//  Created by  on 14/12/8.
//  Copyright (c) 2014年 . All rights reserved.
//

//参考文章
//http://blog.csdn.net/volcan1987/article/details/9969455

//使用CAShapeLayer与UIBezierPath可以实现不在view的drawRect方法中就画出一些想要的图形
//
//步骤：
//1、新建UIBezierPath对象bezierPath
//2、新建CAShapeLayer对象caShapeLayer
//3、将bezierPath的CGPath赋值给caShapeLayer的path，即caShapeLayer.path = bezierPath.CGPath
//4、把caShapeLayer添加到某个显示该图形的layer中

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface KACircleProgressView : UIView {
    CAShapeLayer *_trackLayer;
    UIBezierPath *_trackPath;
    CAShapeLayer *_progressLayer;
    UIBezierPath *_progressPath;
}

@property (nonatomic, strong) UIColor *trackColor;
@property (nonatomic, strong) UIColor *progressColor;
@property (nonatomic) float progress;//0~1之间的数
@property (nonatomic) float progressWidth;

- (void)setProgress:(float)progress animated:(BOOL)animated;

@end
