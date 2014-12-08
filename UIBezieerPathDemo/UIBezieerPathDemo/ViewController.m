//
//  ViewController.m
//  UIBezieerPathDemo
//
//  Created by zhangliang on 14/12/8.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "ViewController.h"
#import "BezierPathView.h"
#import "KACircleProgressView.h"

////根据一个矩形画曲线
//+ (UIBezierPath *)bezierPathWithRect:(CGRect)rect
//
//
//
////根据矩形框的内切圆画曲线
//
//+ (UIBezierPath *)bezierPathWithOvalInRect:(CGRect)rect
//
//
//
////根据矩形画带圆角的曲线
//+ (UIBezierPath *)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius
//
////在矩形中，可以针对四角中的某个角加圆角
//
//+ (UIBezierPath *)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii
//
//参数：
//
//corners:枚举值，可以选择某个角
//
//cornerRadii:圆角的大小
//
////以某个中心点画弧线
//+ (UIBezierPath *)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
//参数：
//
//center:弧线中心点的坐标
//
//radius:弧线所在圆的半径
//
//startAngle:弧线开始的角度值
//
//endAngle:弧线结束的角度值
//
//clockwise:是否顺时针画弧线
//
//
//
////画二元曲线，一般和moveToPoint配合使用
//- (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint
//
//参数：
//
//endPoint:曲线的终点
//
//controlPoint:画曲线的基准点
//
//
//
////以三个点画一段曲线，一般和moveToPoint配合使用
//- (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2
//
//参数：
//
//endPoint:曲线的终点
//
//controlPoint1:画曲线的第一个基准点
//
//controlPoint2:画曲线的第二个基准点

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    BezierPathView * bezier = [[BezierPathView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    [self.view addSubview:bezier];
    
    KACircleProgressView *progress = [[KACircleProgressView alloc] initWithFrame:CGRectMake(0, 200, 100, 100)];
    [self.view addSubview:progress];
    progress.trackColor = [UIColor blackColor];
    progress.progressColor = [UIColor orangeColor];
    progress.progress = .7;
    progress.progressWidth = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
