//
//  MyTestView.m
//  HelloTodayWidget
//
//  Created by zhangliang on 14-10-13.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "MyTestView.h"

@implementation MyTestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)buttonClicked:(UIButton *)sender {
    
    self.resultLabel.text = @"2";
    
}
- (void)dealloc {
    [_resultLabel release];
    [super dealloc];
}
@end
