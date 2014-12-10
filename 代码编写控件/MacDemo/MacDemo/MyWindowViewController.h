//
//  MyWindowViewController.h
//  MacDemo
//
//  Created by zhangliang on 14/12/9.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSSegmentedControl (SampleAddition)
- (void)uselectAllSegments;
@end

@implementation NSSegmentedControl (SampleAddition)

- (void)uselectAllSegments
{
    NSSegmentSwitchTracking current;
    current = [[self cell] trackingMode];
    
    [[self cell] setTrackingMode: NSSegmentSwitchTrackingMomentary];
    
    int i;
    for (i = 0; i < [self segmentCount]; i++)
    {
        [self setSelected: NO  forSegment: i];
    }
    
    [[self cell] setTrackingMode: current];
}

@end

@interface MyWindowViewController : NSWindowController

@end
