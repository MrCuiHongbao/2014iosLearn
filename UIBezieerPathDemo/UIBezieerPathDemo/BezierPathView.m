//
//  BezierPathView.m
//  UIBezieerPathDemo
//
//  Created by zhangliang on 14/12/8.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "BezierPathView.h"

//参考文章
//http://blog.csdn.net/guo_hongjun1611/article/details/7842110
//http://blog.csdn.net/guo_hongjun1611/article/details/7839371

@implementation BezierPathView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIBezierPath*    aPath = [self createArcPath]; /* [self createShapePath]*/
    
    // Set the render colors
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    
    
    
    
    CGContextRef aRef = UIGraphicsGetCurrentContext();
    
    // If you have content to draw after the shape,
    // save the current state before changing the transform
    //CGContextSaveGState(aRef);
    
    // Adjust the view's origin temporarily. The oval is
    // now drawn relative to the new origin point.
    CGContextTranslateCTM(aRef, 20, 20);
    
    // Adjust the drawing options as needed.
    aPath.lineWidth = 5;
    
    // Fill the path before stroking it so that the fill
    // color does not obscure the stroked line.
    [aPath fill];
    [aPath stroke];
    
    // Restore the graphics state before drawing any other content.
    //CGContextRestoreGState(aRef);
    
}

- (UIBezierPath *)createShapePath
{
    UIBezierPath*    aPath = [UIBezierPath bezierPath];
    
    // Set the starting point of the shape.
    [aPath moveToPoint:CGPointMake(100.0, 0.0)];
    
    // Draw the lines
    [aPath addLineToPoint:CGPointMake(200.0, 40.0)];
    [aPath addLineToPoint:CGPointMake(160, 140)];
    [aPath addLineToPoint:CGPointMake(40.0, 140)];
    [aPath addLineToPoint:CGPointMake(0.0, 40.0)];
    [aPath closePath];
    
    return aPath;
}

- (UIBezierPath *)createArcPath
{
    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100)
                                                         radius:75
                                                     startAngle:0
                                                       endAngle:M_PI * 1.25
                                                      clockwise:YES];
    return aPath;
}

//
//使用UIBezierPath类可以创建基于矢量的路径。此类是Core Graphics框架关于path的一个封装。使用此类可以定义简单的形状，如椭圆或者矩形，或者有多个直线和曲线段组成的形状。
//
//1.Bezier Path 基础
//UIBezierPath对象是CGPathRef数据类型的封装。path如果是基于矢量形状的，都用直线和曲线段去创建。我们使用直线段去创建矩形和多边形，使用曲线段去创建弧（arc），圆或者其他复杂的曲线形状。每一段都包括一个或者多个点，绘图命令定义如何去诠释这些点。每一个直线段或者曲线段的结束的地方是下一个的开始的地方。每一个连接的直线或者曲线段的集合成为subpath。一个UIBezierPath对象定义一个完整的路径包括一个或者多个subpaths。
//
//创建和使用一个path对象的过程是分开的。创建path是第一步，包含一下步骤：
//（1）创建一个path对象。
//（2）使用方法moveToPoint:去设置初始线段的起点。
//（3）添加line或者curve去定义一个或者多个subpaths。
//（4）改变UIBezierPath对象跟绘图相关的属性。例如，我们可以设置stroked path的属性lineWidth和lineJoinStyle。也可以设置filled path的属性usesEvenOddFillRule。
//
//当创建path，我们应该管理path上面的点相对于原点（0，0），这样我们在随后就可以很容易的移动path了。为了绘制path对象，我们要用到stroke和fill方法。这些方法在current graphic context下渲染path的line和curve段。
//
//
//2.在path下面添加线或者多边形。
//线和多边形是一些简单的形状，我们可以用moveToPoint:或者addLineToPoint:方法去构建。方法moveToPoint:设置我们想要创建形状的起点。从这点开始，我们可以用方法addLineToPoint:去创建一个形状的线段。我们可以连续的创建line，每一个line的起点都是先前的终点，终点就是指定的点。
//
//下面的代码描述了如何用线段去创建一个五边形。第五条线通过调用closePath方法得到的，它连接了最后一个点（0，40）和第一个点（100，0）
//UIBezierPath*    aPath = [UIBezierPath bezierPath];
//
//// Set the starting point of the shape.
//[aPath moveToPoint:CGPointMake(100.0, 0.0)];
//
//// Draw the lines
//[aPath addLineToPoint:CGPointMake(200.0, 40.0)];
//[aPath addLineToPoint:CGPointMake(160, 140)];
//[aPath addLineToPoint:CGPointMake(40.0, 140)];
//[aPath addLineToPoint:CGPointMake(0.0, 40.0)];
//[aPath closePath];
//closePath方法不仅结束一个shape的subpath表述，它也在最后一个点和第一个点之间画一条线段，如果我们画多边形的话，这个一个便利的方法我们不需要去画最后一条线。
//
//
//3.在path中添加arcs
//UIBezierPath类对用arc段去初始化一个new path对象提供了支持。方法bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise: 的参数定义了我们想要的arc的圆，以及arc的起点和终点。
//下图就是创建的一个，arc是在顺时针（clockwise）的情况下创建的。（如果在逆时针方向创建的话，则为图中虚线部分）
//[转载]IOS--关于Drawing（4）［使用Bezier <wbr>Paths］
//
//下面是代码实现：
//Creating a new arc path
//// pi is approximately equal to 3.14159265359
//#define   DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)
//
//- (UIBezierPath*)createArcPath
//{
//    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150)
//                                                         radius:75
//                                                     startAngle:0
//                                                       endAngle:DEGREES_TO_RADIANS(135)
//                                                      clockwise:YES];
//    return aPath;
//}
//如果我们想要把arc 段加入到path中，我们必须直接修改path对象的CGPathRef数据类型。
//
//4.在path中添加curve。
//UIBezierPath类提供了添加立方和二次贝塞尔曲线的支持。曲线段在当前点开始，在指定的点结束。曲线的形状有开始点，结束点，一个或者多个控制点的切线定义。下图显示了两种曲线类型的相似，以及控制点和curve形状的关系。
//[转载]IOS--关于Drawing（4）［使用Bezier <wbr>Paths］
//通过下面两个方法可以添加曲线path。
//Cubic curve:addCurveToPoint:controlPoint1:controlPoint2:
//Quadratic curve:addQuadCurveToPoint:controlPoint:
//因为curve依赖于path的当前点，所以在调用上面两个方法之前要设置当前点。当曲线完成之后，current点会被更新为指定的end point。
//
//5.创建椭圆或者矩形path。
//椭圆和长方形是最常见的path。都采用曲线和直线段的组合。UIBezierPath类包括bezierPathWithRect: and bezierPathWithOvalInRect:方法去创建椭圆或者矩形形状的path。这两个方法都创建了一个新的path对象，并用指定的形状去初始化它们。我们可以使用返回的path对象或者根据需要去添加更多的形状。
//
//如果我们想在一个存在的path对象上面添加一个矩形，则我们必须使用moveToPoint，addLinePoint，和closePath方法，此可以做任何多边形。
//如果想在一个存在path对象上添加一个椭圆，则最简单的方法是使用core Graphics。尽管可以使用addQuadCurveToPoint:controlPoint:去创建一个近似的椭圆，core Graphics的 CGPathAddEllipseInRect 方法非常的简单使用，也更准确。
//
//
//6.使用Core Graphics函数去修改path。
//UIBezierPath类只是CGPathRef数据类型和path绘图属性的一个封装。虽然通常我们可以用UIBezierPath类的方法去添加直线段和曲线段，UIBezierPath类还提供了一个属性CGPath，我们可以用来直接修改底层的path data type。如果我们希望用Core Graphics 框架函数去创建path，则我们要用到此属性。
//
//有两种方法可以用来修改和UIBezierPath对象相关的path。可以完全的使用Core Graphics函数去修改path，也可以使用Core Graphics函数和UIBezierPath函数混合去修改。第一种方法在某些方面相对来说比较容易。我们可以创建一个CGPathRef数据类型，并调用我们需要修改path信息的函数。
//下面的代码就是赋值一个新的CGPathRef给UIBezierPath对象。
//// Create the path data
//CGMutablePathRef cgPath = CGPathCreateMutable();
//CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(0, 0, 300, 300));
//CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(50, 50, 200, 200));
//
//// Now create the UIBezierPath object
//UIBezierPath* aPath = [UIBezierPath bezierPath];
//aPath.CGPath = cgPath;
//aPath.usesEvenOddFillRule = YES;
//
//// After assigning it to the UIBezierPath object, you can release
//// your CGPathRef data type safely.
//CGPathRelease(cgPath);
//如果我们使用Core Graphics函数和UIBezierPath函数混合方法，我们必须小心的移动path 信息在两者之间。因为UIBezierPath类拥有自己底层的CGPathRef data type，我们不能简单的检索该类型并直接的修改它。相反，我们应该生成一个副本，然后修改此副本，然后赋值此副本给CGPath属性，如下代码：
//Mixing Core Graphics and UIBezierPath calls
//UIBezierPath*    aPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 300, 300)];
//
//// Get the CGPathRef and create a mutable version.
//CGPathRef cgPath = aPath.CGPath;
//CGMutablePathRef  mutablePath = CGPathCreateMutableCopy(cgPath);
//
//// Modify the path and assign it back to the UIBezierPath object
//CGPathAddEllipseInRect(mutablePath, NULL, CGRectMake(50, 50, 200, 200));
//aPath.CGPath = mutablePath;
//
//// Release both the mutable copy of the path.
//CGPathRelease(mutablePath);
//
//7.rendering（渲染）Bezier Path对象的内容。
//当创建一个UIBezierPath对象之后，我们可以使用它的stroke和fill方法在current graphics context中去渲染它。在调用这些方法之前，我们要进行一些其他的任务去确保正确的绘制path。
//使用UIColor类的方法去stroke和fill想要的颜色。
//设置形状在目标视图中的位置。如果我们创建的path相对于原点（0，0），则我们可以给current drawing context应用一个适当的affie transform。例如，我想drawing一个形状起始点在（0，0），我可以调用函数CGContextTranslateCTM,并指定水平和垂直方向的translation值为10。调整graphic context相对于调整path对象的points是首选的方法，因为我们可以很容易的保存和撤销先前的graphics state。
//更新path对象的drawing 属性。当渲染path时，UIBezierPath实例的drawing属性会覆盖graphics context下的属性值。
//
//下面的代码实现了在一个自定义view中实现drawRect：方法中去绘制一个椭圆。椭圆边框矩形的左上角位于视图坐标系统的点（50，50）处。
//Drawing a path in a view
//- (void)drawRect:(CGRect)rect
//{
//    // Create an oval shape to draw.
//    UIBezierPath* aPath = [UIBezierPath bezierPathWithOvalInRect:
//                           CGRectMake(0, 0, 200, 100)];
//    
//    // Set the render colors
//    [[UIColor blackColor] setStroke];
//    [[UIColor redColor] setFill];
//    
//    CGContextRef aRef = UIGraphicsGetCurrentContext();
//    
//    // If you have content to draw after the shape,
//    // save the current state before changing the transform
//    //CGContextSaveGState(aRef);
//    
//    // Adjust the view's origin temporarily. The oval is
//    // now drawn relative to the new origin point.
//    CGContextTranslateCTM(aRef, 50, 50);
//    
//    // Adjust the drawing options as needed.
//    aPath.lineWidth = 5;
//    
//    // Fill the path before stroking it so that the fill
//    // color does not obscure the stroked line.
//    [aPath fill];
//    [aPath stroke];
//    
//    // Restore the graphics state before drawing any other content.
//    //CGContextRestoreGState(aRef);
//}

@end
