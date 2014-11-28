//
//  ZLCommandLine.h
//  SubversionManager
//
//  Created by zhangliang on 14/11/28.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLCommandLine : NSObject

/**
 *	@brief	获取命令行参数
 *
 *  例如：那你如果进行如下操作，可以得到”abc”
 *         defaults write com.your.App myType abc
 *   或者执行
 *         ./build/Debug/your.app/Contents/MacOS/app -myType abc
 *
 *	@param 	arg 	上例中的myType
 *
 *	@return	对应的参数
 */
+ (NSString *)valueOfArgument:(NSString *)arg;


@end
