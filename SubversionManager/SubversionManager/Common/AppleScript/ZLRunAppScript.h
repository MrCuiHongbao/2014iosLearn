//
//  ZLRunAppScript.h
//  SubversionManager
//
//  Created by zhangliang on 14/11/28.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLRunAppScript : NSObject



/**
 *	@brief	执行AppleScript脚本
 *
 *  例 apple.script
 *	@param 	scriptName 	脚本名称  apple
 *	@param 	scriptType 	脚本类型  script
 *
 */
+ (void)runAppleScriptWithName:(NSString *)scriptName andType:(NSString *)scriptType;


@end
