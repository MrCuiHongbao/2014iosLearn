//
//  ZLMainWindowController.m
//  SubversionManager
//
//  Created by zhangliang on 14/11/28.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "ZLMainWindowController.h"

@interface ZLMainWindowController ()<NSSpeechSynthesizerDelegate, NSTableViewDataSource, NSTableViewDelegate>
{
    NSArray * voices;
}

@property (strong) NSTextField * personLabel;
@property (strong) NSSpeechSynthesizer * sppechSynth;

@end

@implementation ZLMainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
//    [self initViews];
    [self saySomething];
}

- (void)initViews
{
    self.personLabel = [[NSTextField alloc] initWithFrame:CGRectMake(17, 159, 200, 20)];
    _personLabel.font = [NSFont systemFontOfSize:[NSFont labelFontSize]];
//    [_personLabel setBordered:NO];
    _personLabel.stringValue = @"Person:";
    
//    [_personLabel setEditable:NO];
    [_personLabel setBackgroundColor:[NSColor clearColor]];
    [self.window.contentView addSubview:_personLabel];
    
    
    NSButton * buttonSave = [[NSButton alloc] initWithFrame:NSRectFromCGRect(CGRectMake(120,  _personLabel.frame.origin.y - _personLabel.frame.size.height - 10, 80, 20))];
    [buttonSave setButtonType:NSMomentaryPushInButton];
    [buttonSave setImagePosition:NSNoImage];//设置为只有文本的
//    [buttonSave setImagePosition:NSImageOnly];//设置为只有图片
    [buttonSave setBezelStyle:NSRoundedBezelStyle];
    [buttonSave setTarget:self];
    buttonSave.stringValue = @"save";
    [buttonSave setAction:@selector(showText:)];
    [self.window.contentView addSubview:buttonSave];
    
    buttonSave = [[NSButton alloc] initWithFrame:NSRectFromCGRect(CGRectMake(buttonSave.frame.origin.x + buttonSave.frame.size.width + 10,  _personLabel.frame.origin.y - _personLabel.frame.size.height - 10, 40, 20))];
    buttonSave.stringValue = @"Speak";
    [buttonSave setTarget:self];
    [buttonSave setButtonType:NSPushOnPushOffButton];
    [buttonSave setAction:@selector(speak:)];
    [self.window.contentView addSubview:buttonSave];

}

- (void)saySomething
{
    
    
}

- (void)showText:(id)button
{
    [_sppechSynth startSpeakingString:@"Hello, how are you ?"];

}

- (void)speak:(id)button
{
    
}

#pragma mark - SpeechSynthesizer Delegate
- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking
{
    NSLog(@"finishedSpeaking = %d", finishedSpeaking);
}

- (IBAction)sayIt:(id)sender {
    self.sppechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
    voices = [NSSpeechSynthesizer availableVoices];
    [_sppechSynth setDelegate:self];
    [self.sppechSynth startSpeakingString:@"Hello, baby"];
    [_stopButton setEnabled:YES];
    [_startButton setEnabled:NO];
}

- (IBAction)stop:(id)sender {
    [self.sppechSynth stopSpeaking];
    [_stopButton setEnabled:NO];
    [_startButton setEnabled:YES];
}

#pragma mark - Tableview delegate、datasource
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return (NSInteger)[voices count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSString * v = [voices objectAtIndex:row];
    NSDictionary * dict = [NSSpeechSynthesizer attributesForVoice:v];
    return [dict objectForKey:NSVoiceName];
}



@end
