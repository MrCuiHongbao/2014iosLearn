//
//  MyTestView.h
//  HelloTodayWidget
//
//  Created by zhangliang on 14-10-13.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTestView : UIView
- (IBAction)buttonClicked:(UIButton *)sender;
@property (retain, nonatomic) IBOutlet UILabel *resultLabel;

@end
