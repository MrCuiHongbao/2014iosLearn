//
//  MyWindowViewController.m
//  MacDemo
//
//  Created by zhangliang on 14/12/9.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "MyWindowViewController.h"

@interface MyWindowViewController ()

@end

@implementation MyWindowViewController
{
    NSLevelIndicator * levelIndicator;
    NSSegmentedControl * segmentedControl;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    [self.window setStyleMask:NSClosableWindowMask | NSMiniaturizableWindowMask | NSTitledWindowMask | NSResizableWindowMask];
    
    self.window.title = @"One two three";
    
    NSRect rect = self.window.frame;
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;
    
    
#pragma mark - NSPopUpButton
    NSMenu * menu = [[NSMenu alloc] initWithTitle:@"Hello"];
    NSMenuItem * menuItem = [[NSMenuItem alloc] initWithTitle:@"" action:nil keyEquivalent:@""];
    [menuItem setImage:[NSImage imageNamed:@"moof"]];
    [menu addItem:menuItem];
    
    menuItem = [[NSMenuItem alloc] initWithTitle:@"Now is the time" action:nil keyEquivalent:@""];
    [menu addItem:menuItem];
    
    menuItem = [[NSMenuItem alloc] initWithTitle:@"For all good programmers" action:nil keyEquivalent:@""];
    [menu addItem:menuItem];
    
    menuItem = [[NSMenuItem alloc] initWithTitle:@"To come to serve their code" action:nil keyEquivalent:@""];
    [menu addItem:menuItem];
    
    NSPopUpButton * popUpDownButton = [[NSPopUpButton alloc] initWithFrame:NSMakeRect(0, height-20, 60, 60) pullsDown:YES];
    [popUpDownButton.cell setArrowPosition:NSPopUpArrowAtBottom];
    [popUpDownButton.cell setBezelStyle:NSRegularSquareBezelStyle];
    [popUpDownButton setMenu:menu];
    
    [self.window.contentView addSubview:popUpDownButton];
    
    
    NSPopUpButton * popUpRightButton = [[NSPopUpButton alloc] initWithFrame:NSMakeRect(popUpDownButton.frame.origin.x + popUpDownButton.frame.size.width + 10, height-20, 60, 60) pullsDown:YES];
    [popUpRightButton.cell setArrowPosition:NSPopUpArrowAtBottom];
    popUpRightButton.preferredEdge = NSMaxXEdge;//使弹出menu在右边
    [popUpRightButton.cell setBezelStyle:NSShadowlessSquareBezelStyle];
    [popUpRightButton setMenu:menu];
    [popUpRightButton.cell setHighlightsBy:NSChangeGrayCellMask];
    [self.window.contentView addSubview:popUpRightButton];
    
#pragma mark - NSButton
    
    NSImage * iconImage = [NSImage imageNamed:@"moof"];
    NSImage * alternateImage = [NSImage imageNamed: @"moof2"];
    
    NSButton * roundMomentaryButton = [[NSButton alloc] initWithFrame:NSMakeRect(popUpRightButton.frame.origin.x + popUpRightButton.frame.size.width + 30, height-20, 120, 60)];
    
    //想让此button点击时title及图片有变化所以添加下面设置
    [roundMomentaryButton setButtonType:NSMomentaryChangeButton];
    [roundMomentaryButton setTitle:@"NSButton"];
    [roundMomentaryButton setAlternateTitle:@"(pressed)"];
    [roundMomentaryButton setImage:iconImage];
    [roundMomentaryButton setAlternateImage:alternateImage];
    
    [roundMomentaryButton setBezelStyle:NSRegularSquareBezelStyle];
    [roundMomentaryButton setImagePosition:NSImageLeft];
    [roundMomentaryButton.cell setAlignment:NSLeftTextAlignment];
    [roundMomentaryButton setFont:[NSFont systemFontOfSize:[NSFont smallSystemFontSize]]];
    [roundMomentaryButton setSound:[NSSound soundNamed:@"Pop"]];
    [roundMomentaryButton setTarget:self];
    [roundMomentaryButton setAction:@selector(roundMomentaryButtonClicked:)];
    [self.window.contentView addSubview:roundMomentaryButton];
    
    NSButton * shadowlessSquareButton = [[NSButton alloc] initWithFrame:NSMakeRect(roundMomentaryButton.frame.origin.x + roundMomentaryButton.frame.size.width + 10, height-20, 120, 60)];
    [shadowlessSquareButton setTitle:@"NSButton"];
    [shadowlessSquareButton setImage:iconImage];
    [shadowlessSquareButton setImagePosition:NSImageLeft];
    [shadowlessSquareButton setBezelStyle:NSShadowlessSquareBezelStyle];
    [shadowlessSquareButton setImagePosition:NSImageLeft];
    [shadowlessSquareButton.cell setAlignment:NSLeftTextAlignment];
    [shadowlessSquareButton setFont:[NSFont systemFontOfSize:[NSFont smallSystemFontSize]]];
    [shadowlessSquareButton setSound:[NSSound soundNamed:@"Pop"]];
    [shadowlessSquareButton setTarget:self];
    [shadowlessSquareButton setAction:@selector(shadowlessSquareButtonClicked:)];
    [self.window.contentView addSubview:shadowlessSquareButton];
    
#pragma mark - NSSegmentedControl
    segmentedControl = [[NSSegmentedControl alloc] initWithFrame:NSMakeRect(0, popUpDownButton.frame.origin.y - popUpDownButton.frame.size.height, 210,  30)];
    [segmentedControl setSegmentCount:3];
    
    [segmentedControl setWidth:70 forSegment:0];
    [segmentedControl setWidth:70 forSegment:1];
    [segmentedControl setWidth:70 forSegment:2];
    
    [segmentedControl setLabel:@"One" forSegment:0];
    [segmentedControl setLabel:@"Two" forSegment:1];
    [segmentedControl setLabel:@"Three" forSegment:2];
    
    [segmentedControl setTarget:self];
    [segmentedControl setAction:@selector(segmentControl:)];
    
    [segmentedControl setMenu:menu forSegment:0];
    
    [self.window.contentView addSubview:segmentedControl];
    
    // add icons to each segment (applied to both nib-based and code-based)
    iconImage = [[NSWorkspace sharedWorkspace] iconForFileType:NSFileTypeForHFSTypeCode(kComputerIcon)];
    [iconImage setSize:NSMakeSize(16,16)];
    [segmentedControl setImage:iconImage forSegment:0];
    
    iconImage = [[NSWorkspace sharedWorkspace] iconForFileType:NSFileTypeForHFSTypeCode(kDesktopIcon)];
    [iconImage setSize:NSMakeSize(16,16)];
    [segmentedControl setImage:iconImage forSegment:1];
    
    iconImage = [[NSWorkspace sharedWorkspace] iconForFileType:NSFileTypeForHFSTypeCode(kFinderIcon)];
    [iconImage setSize:NSMakeSize(16,16)];
    [segmentedControl setImage:iconImage forSegment:2];
    
    NSButton * unselectButton = [[NSButton alloc] initWithFrame:NSMakeRect(segmentedControl.frame.origin.x + segmentedControl.frame.size.width + 20, popUpDownButton.frame.origin.y - popUpDownButton.frame.size.height, 80,  30)];
    [unselectButton setTitle:@"Unselect"];
    [unselectButton setButtonType:NSMomentaryPushInButton];
    [unselectButton setBezelStyle:NSRoundedBezelStyle];
    unselectButton.bordered = YES;
    [unselectButton setTarget:self];
    [unselectButton setAction:@selector(unselectSegment:)];
    [self.window.contentView addSubview:unselectButton];
    
#pragma mark - NSMatrix
    //first create a radio cell prototype
    NSButtonCell * radioCell;
    radioCell = [[NSButtonCell alloc] init];
    [radioCell setButtonType:NSRadioButton];
    [radioCell setTitle:@"RadioCell"];
    
    //create the NSMatrix
    NSMatrix * matrix = [[NSMatrix alloc] initWithFrame:NSMakeRect(30, segmentedControl.frame.origin.y - segmentedControl.frame.size.height - 50, 100, 60) mode:NSRadioModeMatrix prototype:radioCell numberOfRows:2 numberOfColumns:1];
    
    // add the cells to the matrix
    NSCell * cellToChange = [matrix cellAtRow:0 column:0];
    [cellToChange setTitle:@"Radio 1"];
    
    cellToChange = [matrix cellAtRow:1 column:0];
    [cellToChange setTitle:@"Radio 2"];
    
    [matrix setTarget:self];
    [matrix setAction:@selector(matrixAction:)];
    
    [self.window.contentView addSubview:matrix];
    
#pragma mark - NSColorWell
    NSColorWell * colorWell = [[NSColorWell alloc] initWithFrame:NSMakeRect(20, matrix.frame.origin.y - matrix.frame.size.height - 30, 60, 60)];
    [colorWell setColor: [NSColor blueColor]];
    [self.window.contentView addSubview:colorWell];
    [colorWell setAction:@selector(colorAction:)];
    
#pragma mark - NSLevelIndicator
    levelIndicator = [[NSLevelIndicator alloc] initWithFrame:NSMakeRect(colorWell.frame.size.width + colorWell.frame.origin.x + 30, colorWell.frame.origin.y, 300, 60)];
    [levelIndicator setMaxValue:10];
    [levelIndicator setNumberOfMajorTickMarks:4];//重要标记数
    [levelIndicator setNumberOfTickMarks:5];//分段标记数
    [levelIndicator setWarningValue:6];//警告值
    [levelIndicator setCriticalValue:9];//临界值
    levelIndicator.doubleValue = 7;
    [levelIndicator.cell setLevelIndicatorStyle:NSDiscreteCapacityLevelIndicatorStyle];
    [levelIndicator setAction:@selector(levelAction:)];
    [self.window.contentView addSubview:levelIndicator];
    
    NSStepper * stepper = [[NSStepper alloc] initWithFrame:NSMakeRect(levelIndicator.frame.origin.x + levelIndicator.frame.size.width + 10, levelIndicator.frame.origin.y, 20, levelIndicator.frame.size.height)];
    stepper.valueWraps = YES;
    stepper.autorepeat = YES;
    stepper.minValue = 0;
    stepper.maxValue = 10;
    stepper.increment = 1;
//    stepper.objectValue = [NSNumber numberWithDouble:0.0];
    stepper.doubleValue = 7;
    [stepper setTarget:self];
    [stepper setAction:@selector(stepperAction:)];
    [self.window.contentView addSubview:stepper];
    
    NSPopUpButton * typeButton = [[NSPopUpButton alloc] initWithFrame:NSMakeRect(matrix.frame.origin.x + matrix.frame.size.width + 10, matrix.frame.origin.y, 200, 30) pullsDown:NO];
    [typeButton setButtonType:NSMomentaryLightButton];
    typeButton.bezelStyle = NSRoundedBezelStyle;
    [typeButton.cell setArrowPosition:NSPopUpArrowAtCenter];
    typeButton.bordered = YES;
    typeButton.state = NSOnState;
    typeButton.alignment = NSCenterTextAlignment;
    
    NSMenu * subMenu = [[NSMenu alloc] initWithTitle:@"Type"];
    NSMenuItem * subMenuItem = [[NSMenuItem alloc] initWithTitle:@"NSRelevancyLevelIndicatorStyle" action:nil keyEquivalent:@""];
    subMenuItem.tag = 0;
    [subMenu addItem:subMenuItem];
    
    subMenuItem = [[NSMenuItem alloc] initWithTitle:@"NSContinuousCapacityLevelIndicatorStyle" action:nil keyEquivalent:@""];
    subMenuItem.tag = 1;
    [subMenu addItem:subMenuItem];
    
    subMenuItem = [[NSMenuItem alloc] initWithTitle:@"NSDiscreteCapacityLevelIndicatorStyle" action:nil keyEquivalent:@""];
    subMenuItem.tag = 2;
    [subMenu addItem:subMenuItem];
    
    subMenuItem = [[NSMenuItem alloc] initWithTitle:@"NSRatingLevelIndicatorStyle" action:nil keyEquivalent:@""];
    subMenuItem.tag = 3;
    [subMenu addItem:subMenuItem];
    
    [typeButton setMenu:subMenu];
    
    [typeButton setTarget:self];
    
    SEL menuItemSelectAction = @selector(setStyleAction:);
    
    
    [typeButton setAction:menuItemSelectAction];
    
    [self.window.contentView addSubview:typeButton];
}

- (void)roundMomentaryButtonClicked:(id)sender
{
    
}

- (void)shadowlessSquareButtonClicked:(id)sender
{
    
}

- (void)segmentControl:(id)sender
{
    
}

- (void)unselectSegment:(id)sender
{
    [segmentedControl uselectAllSegments];
}

- (void)matrixAction:(id)sender
{
    NSCell * selectedCell = [sender selectedCell];
    NSLog(@"%@", selectedCell.title);
}

- (void)colorAction:(id)sender
{
    
}

- (void)levelAction:(id)sender
{
    
}

- (void)stepperAction:(NSStepper *)sender
{
    [levelIndicator setDoubleValue:[sender doubleValue]];
}

- (void)setStyleAction:(NSPopUpButton *)sender
{
    sender.title = [sender.selectedItem title];
    NSInteger selected = [sender selectedTag];
    [levelIndicator.cell setLevelIndicatorStyle:selected];
}

@end
