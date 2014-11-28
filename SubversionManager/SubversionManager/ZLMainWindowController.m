//
//  ZLMainWindowController.m
//  SubversionManager
//
//  Created by zhangliang on 14/11/28.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "ZLMainWindowController.h"
#import "Person.h"

@interface ZLMainWindowController ()
@property (nonatomic, retain) NSArrayController * arrayController;
@end

@implementation ZLMainWindowController
@synthesize arrayController;

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    [self initViews];
    [self initData];
}

- (void)initViews
{
    NSTextField * personLabel = [[NSTextField alloc] initWithFrame:CGRectMake(17, 159, 52, 14)];
    personLabel.font = [NSFont systemFontOfSize:[NSFont smallSystemFontSize]];
    [personLabel setBordered:NO];
    personLabel.stringValue = @"Person:";
    [personLabel setEditable:NO];
    [personLabel setBackgroundColor:[NSColor clearColor]];
    [self.window.contentView addSubview:personLabel];
    
    NSPopUpButton * popUpButton = [[NSPopUpButton alloc] initWithFrame:CGRectMake(personLabel.frame.origin.x + personLabel.frame.size.width, personLabel.frame.origin.y, 131, 22) pullsDown:NO];
    [self.window.contentView addSubview:popUpButton];
}

- (void)initData
{
    self.arrayController = [[NSArrayController alloc] init];
    
    NSArray *keys = [NSArray arrayWithObjects: @"name", @"age", @"addressStreet", @"addressCity",
                     @"addressState", @"addressZip", nil];
    
    // add the following four people to our NSArrayController
    //
    NSArray *values = [NSArray arrayWithObjects: @"Joe Smith",
                       [NSNumber numberWithInt:21],
                       @"451 University Avenue", @"Palo Alto", @"CA",
                       @"94301",
                       nil];
    NSDictionary* properties = [NSMutableDictionary dictionaryWithObjects:values forKeys:keys];
    Person *personToAdd = [[Person alloc] init];
    personToAdd.attributes = properties;
    [arrayController addObject: personToAdd];
    
    values = [NSArray arrayWithObjects: @"John Doe",
              [NSNumber numberWithInt:31],
              @"767 Fifth Ave.", @"New York", @"NY", @"10153",
              nil];
    properties = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    personToAdd = [[Person alloc] init];
    personToAdd.attributes = properties;
    [arrayController addObject: personToAdd];
    
    values = [NSArray arrayWithObjects: @"Sally Sixpack",
              [NSNumber numberWithInt:41],
              @"679 North Michigan Ave.", @"Chicago", @"IL", @"60611",
              nil];
    properties = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    personToAdd = [[Person alloc] init];
    personToAdd.attributes = properties;
    [arrayController addObject: personToAdd];
    
    values = [NSArray arrayWithObjects: @"John Q. Public",
              [NSNumber numberWithInt:92],
              @"5085 Westheimer Rd.", @"Houston", @"TX", @"77056",
              nil];
    properties = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    personToAdd = [[Person alloc] init];
    personToAdd.attributes = properties;
    [arrayController addObject: personToAdd];
    
    [arrayController setSelectionIndex:0];	// select the first popup menu item
}

@end
