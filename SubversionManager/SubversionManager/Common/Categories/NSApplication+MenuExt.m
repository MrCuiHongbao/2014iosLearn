//
//  NSApplication+MenuExt.m
//  SubversionManager
//
//  Created by zhangliang on 14/11/28.
//  Copyright (c) 2014年 GAG. All rights reserved.
//

#import "NSApplication+MenuExt.h"

@implementation NSApplication (MenuExt)
+ (void)makeMenu
{
    [self initBasicMenu];
}

+ (void)initBasicMenu
{
    NSMenu * menuBar = [[NSMenu alloc] init];
    [NSApp setMainMenu:menuBar];
    
    NSMenuItem * appMenuItem = [[NSMenuItem alloc] init];
    [menuBar addItem:appMenuItem];
    
    NSMenuItem * fileMenuItem = [[NSMenuItem alloc] init];
    [menuBar addItem:fileMenuItem];
    
    NSMenuItem * editMenuItem = [[NSMenuItem alloc] init];
    [menuBar addItem:editMenuItem];
    
    NSMenuItem * formatMenuItem = [[NSMenuItem alloc] init];
    [menuBar addItem:formatMenuItem];
    
    NSMenuItem * viewMenuItem = [[NSMenuItem alloc] init];
    [menuBar addItem:viewMenuItem];
    
    NSMenuItem * windowMenuItem = [[NSMenuItem alloc] init];
    [menuBar addItem:windowMenuItem];
    
    NSMenuItem * helpMenuItem = [[NSMenuItem alloc] init];
    [menuBar addItem:helpMenuItem];
    
    [appMenuItem setSubmenu:[self appMenu]];
    
    [fileMenuItem setSubmenu:[self fileMenu]];
    
    [editMenuItem setSubmenu:[self editMenu]];
    
    [formatMenuItem setSubmenu:[self formatMenu]];
    
    [viewMenuItem setSubmenu:[self viewMenu]];
    
    [windowMenuItem setSubmenu:[self windowMenu]];
    
    [helpMenuItem setSubmenu:[self helpMenu]];
}

#pragma mark - App menu
+ (NSMenu *)appMenu
{
    NSString * appName = [[NSProcessInfo processInfo] processName];
    NSMenu * appMenu = [[NSMenu alloc] initWithTitle:appName];
    NSString * aboutTitle = [@"About " stringByAppendingString:appName];
    NSMenuItem * aboutMenuItem = [[NSMenuItem alloc] initWithTitle:aboutTitle action:@selector(orderFrontStandardAboutPanel:) keyEquivalent:@""];
    [appMenu addItem:aboutMenuItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * preferencesItem = [[NSMenuItem alloc] initWithTitle:@"Preferences…" action:@selector(showPreferenceWindow) keyEquivalent:@","];
    [appMenu addItem:preferencesItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * servicesItem = [[NSMenuItem alloc] initWithTitle:@"Services" action:nil keyEquivalent:@""];
    
    NSMenu * servicesMenu = [[NSMenu alloc] initWithTitle:@"Services"];
    
    NSMenuItem * noServiceItem = [[NSMenuItem alloc] initWithTitle:@"No Services Apply" action:nil keyEquivalent:@""];
    [servicesMenu addItem:noServiceItem];
    
    NSMenuItem * servicesPreferencesItem = [[NSMenuItem alloc] initWithTitle:@"Services Preferences…" action:nil keyEquivalent:@""];
    [servicesPreferencesItem setImage:[NSImage imageNamed:NSImageNameSmartBadgeTemplate]];
    [servicesMenu addItem:servicesPreferencesItem];
    
    [appMenu setSubmenu:servicesMenu forItem:servicesItem];
    [appMenu addItem:servicesItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * hideItem = [[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:@"Hide %@", appName] action:@selector(hide:) keyEquivalent:@"h"];
    [appMenu addItem:hideItem];
    
    NSMenuItem * hideOthersItem = [[NSMenuItem alloc] initWithTitle:@"Hide Others" action:@selector(hideOtherApplications:) keyEquivalent:@"h"];
    [hideOthersItem setKeyEquivalentModifierMask:NSAlternateKeyMask | NSCommandKeyMask];
    [appMenu addItem:hideOthersItem];
    
    NSMenuItem * showAllItem = [[NSMenuItem alloc] initWithTitle:@"Show All" action:@selector(unhideAllApplications:) keyEquivalent:@""];
    [appMenu addItem:showAllItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * quitItem = [[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:@"Quit %@", appName] action:@selector(terminate:) keyEquivalent:@"q"];
    [appMenu addItem:quitItem];
    
    //对于keyEquivalent，大写字母和小写字母不同，大写字母为shift-cmd  小写为cmd， 也可以通过setKeyEquivalentModifierMask来设置
    
    return appMenu;
}

- (void)showPreferenceWindow
{
    
}

- (void)showServiceMenu
{
    
}

#pragma mark - File menu
+ (NSMenu *)fileMenu
{
    NSMenu * appMenu = [[NSMenu alloc] initWithTitle:@"File"];
    NSMenuItem * newItem = [[NSMenuItem alloc] initWithTitle:@"New" action:@selector(newDocument:) keyEquivalent:@"n"];
    [appMenu addItem:newItem];
    
    
    NSMenuItem * openItem = [[NSMenuItem alloc] initWithTitle:@"Open…" action:@selector(openDocument:) keyEquivalent:@"o"];
    [appMenu addItem:openItem];
    
    NSMenuItem * openRecentItem = [[NSMenuItem alloc] initWithTitle:@"Open Recent" action:@selector(openDocument:) keyEquivalent:@""];
    [appMenu addItem:openRecentItem];
    
    NSMenu * openRecentMenu = [[NSMenu alloc] initWithTitle:@"Open Recent"];
    NSMenuItem * clearMenu = [[NSMenuItem alloc] initWithTitle:@"Clear Menu" action:@selector(clearRecentDocuments:) keyEquivalent:@""];
    [openRecentMenu addItem:clearMenu];
    [appMenu setSubmenu:openRecentMenu forItem:openRecentItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * closeItem = [[NSMenuItem alloc] initWithTitle:@"Close" action:@selector(performClose:) keyEquivalent:@"w"];
    [appMenu addItem:closeItem];
    
    NSMenuItem * saveItem = [[NSMenuItem alloc] initWithTitle:@"Save…" action:@selector(saveDocument:) keyEquivalent:@"s"];
    [appMenu addItem:saveItem];
    
    NSMenuItem * saveAsItem = [[NSMenuItem alloc] initWithTitle:@"Save As…" action:@selector(saveDocumentAs:) keyEquivalent:@"S"];
    [appMenu addItem:saveAsItem];
    
    NSMenuItem * revertToSavedItem = [[NSMenuItem alloc] initWithTitle:@"Revert to Saved" action:@selector(revertDocumentToSaved:) keyEquivalent:@""];
    [appMenu addItem:revertToSavedItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * pageSetUpItem = [[NSMenuItem alloc] initWithTitle:@"Page Setup…" action:@selector(runPageLayout:) keyEquivalent:@"P"];
    [appMenu addItem:pageSetUpItem];
    
    NSMenuItem * printItem = [[NSMenuItem alloc] initWithTitle:@"Print…" action:@selector(print:) keyEquivalent:@"p"];
    [appMenu addItem:printItem];
    
    return appMenu;
}

- (void)newDocument:(id)sender
{
    
}

- (void)openDocument:(id)sender
{
    
}

- (void)saveDocument:(id)sender
{
    
}

- (void)saveDocumentAs:(id)sender
{
    
}

- (void)saveDocumentTo:(id)sender
{
    
}

- (void)runPageLayout:(id)sender
{
    
}

- (void)print:(id)sender
{
    
}

#pragma mark - Edit menu
+ (NSMenu *)editMenu
{
    NSMenu * appMenu = [[NSMenu alloc] initWithTitle:@"Edit"];
    NSString * undo = @"Undo";
    NSMenuItem * undoItem = [[NSMenuItem alloc] initWithTitle:undo action:@selector(undo:) keyEquivalent:@"z"];
    [appMenu addItem:undoItem];
    
    NSMenuItem * redoItem = [[NSMenuItem alloc] initWithTitle:@"Redo" action:@selector(redo:) keyEquivalent:@"Z"];
    [appMenu addItem:redoItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * cutItem = [[NSMenuItem alloc] initWithTitle:@"Cut" action:@selector(cut:) keyEquivalent:@"x"];
    [appMenu addItem:cutItem];
    
    NSMenuItem * copyItem = [[NSMenuItem alloc] initWithTitle:@"Copy" action:@selector(copy:) keyEquivalent:@"c"];
    [appMenu addItem:copyItem];
    
    NSMenuItem * pasteItem = [[NSMenuItem alloc] initWithTitle:@"Paste" action:@selector(paste:) keyEquivalent:@"v"];
    [appMenu addItem:pasteItem];
    
    NSMenuItem * pasteAndMatchItem = [[NSMenuItem alloc] initWithTitle:@"Paste and Match Style" action:@selector(pasteAsPlainText:) keyEquivalent:@"V"];
    [pasteAndMatchItem setKeyEquivalentModifierMask:NSCommandKeyMask|NSShiftKeyMask|NSAlternateKeyMask];
    [appMenu addItem:pasteAndMatchItem];
    
    NSMenuItem * deleteItem = [[NSMenuItem alloc] initWithTitle:@"Delete" action:@selector(delete:) keyEquivalent:@""];
    [appMenu addItem:deleteItem];
    
    NSMenuItem * selectAllItem = [[NSMenuItem alloc] initWithTitle:@"Select All" action:@selector(selectAll:) keyEquivalent:@"a"];
    [appMenu addItem:selectAllItem];
    
    [appMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * findItem = [[NSMenuItem alloc] initWithTitle:@"Find" action:nil keyEquivalent:@""];
    [appMenu addItem:findItem];
    
    NSMenu * findMenu = [[NSMenu alloc] initWithTitle:@"Find"];
    NSMenuItem * findMenuItem = [[NSMenuItem alloc] initWithTitle:@"Find…" action:@selector(performFindPanelAction:) keyEquivalent:@"f"];
    [findMenu addItem:findMenuItem];
    
    NSMenuItem * findAndReplaceMenuItem = [[NSMenuItem alloc] initWithTitle:@"Find and Replace…" action:@selector(performFindPanelAction:) keyEquivalent:@"f"];
    [findAndReplaceMenuItem setKeyEquivalentModifierMask:NSAlternateKeyMask|NSCommandKeyMask];
    [findMenu addItem:findAndReplaceMenuItem];
    
    NSMenuItem * findNextMenuItem = [[NSMenuItem alloc] initWithTitle:@"Find Next" action:@selector(performFindPanelAction:) keyEquivalent:@"g"];
    [findMenu addItem:findNextMenuItem];
    
    NSMenuItem * findPreviousMenuItem = [[NSMenuItem alloc] initWithTitle:@"Find Previous" action:@selector(performFindPanelAction:) keyEquivalent:@"G"];
    [findMenu addItem:findPreviousMenuItem];
    
    NSMenuItem * useSelectionForFindMenuItem = [[NSMenuItem alloc] initWithTitle:@"Use Selection for Find" action:@selector(performFindPanelAction:) keyEquivalent:@"e"];
    [findMenu addItem:useSelectionForFindMenuItem];
    
    NSMenuItem * jumpToSelectionMenuItem = [[NSMenuItem alloc] initWithTitle:@"Jump to Selection" action:@selector(centerSelectionInVisibleArea:) keyEquivalent:@"j"];
    [findMenu addItem:jumpToSelectionMenuItem];
    
    [appMenu setSubmenu:findMenu forItem:findItem];
    
    NSMenuItem * spellingAndGrammarItem = [[NSMenuItem alloc] initWithTitle:@"Spelling and Grammar" action:nil keyEquivalent:@""];
    
    [appMenu addItem:spellingAndGrammarItem];
    
    NSMenu * spellingMenu = [[NSMenu alloc] initWithTitle:@"Spell"];
    NSMenuItem * showSpellingAndGrammar = [[NSMenuItem alloc] initWithTitle:@"Show Spelling and Grammar" action:@selector(showGuessPanel:) keyEquivalent:@":"];
    [spellingMenu addItem:showSpellingAndGrammar];
    
    NSMenuItem * checkDocumentNow = [[NSMenuItem alloc] initWithTitle:@"Check Document Now" action:@selector(checkSpelling:) keyEquivalent:@";"];
    [spellingMenu addItem:checkDocumentNow];
    
    [spellingMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * checkSpellingWhileTyping = [[NSMenuItem alloc] initWithTitle:@"Check Spelling While Typing" action:@selector(toggleContinuousSpellChecking:) keyEquivalent:@""];
    [spellingMenu addItem:checkSpellingWhileTyping];
    
    NSMenuItem * checkGrammarWithSpelling = [[NSMenuItem alloc] initWithTitle:@"Check Grammar With Spelling" action:@selector(toggleGrammarChecking:) keyEquivalent:@""];
    [spellingMenu addItem:checkGrammarWithSpelling];
    
    NSMenuItem * correctSpellingAutomatically = [[NSMenuItem alloc] initWithTitle:@"Correct Spelling Automatically" action:@selector(toggleAutomaticSpellingCorrection:) keyEquivalent:@""];
    [spellingMenu addItem:correctSpellingAutomatically];
    
    [appMenu setSubmenu:spellingMenu forItem:spellingAndGrammarItem];
    
    NSMenuItem * substitutionsItem = [[NSMenuItem alloc] initWithTitle:@"Substitutions" action:nil keyEquivalent:@""];
    [appMenu addItem:substitutionsItem];
    
    NSMenu * substitutionsMenu = [[NSMenu alloc] initWithTitle:@"Substitutions"];
    NSMenuItem * showSubstitutions = [[NSMenuItem alloc] initWithTitle:@"Show Substitutions" action:@selector(orderFrontSubstitutionsPanel:) keyEquivalent:@""];
    [substitutionsMenu addItem:showSubstitutions];
    
    [substitutionsMenu addItem:[NSMenuItem separatorItem]];
    
    NSMenuItem * smartCopyOrPaste = [[NSMenuItem alloc] initWithTitle:@"Smart Copy/Paste" action:@selector(toggleSmartInsertDelete:) keyEquivalent:@""];
    [substitutionsMenu addItem:smartCopyOrPaste];
    
    NSMenuItem * smartQuotes = [[NSMenuItem alloc] initWithTitle:@"Smart Quotes" action:@selector(toggleAutomaticQuoteSubstitution:) keyEquivalent:@""];
    [substitutionsMenu addItem:smartQuotes];
    
    NSMenuItem * smartDashes = [[NSMenuItem alloc] initWithTitle:@"Smart Dashes" action:@selector(toggleAutomaticDashSubstitution:) keyEquivalent:@"c"];
    [substitutionsMenu addItem:smartDashes];
    
    NSMenuItem * smartLinks = [[NSMenuItem alloc] initWithTitle:@"Smart Links" action:@selector(toggleAutomaticLinkDetection:) keyEquivalent:@""];
    [substitutionsMenu addItem:smartLinks];
    
    NSMenuItem * dataDetectors = [[NSMenuItem alloc] initWithTitle:@"Data Detectors" action:@selector(toggleAutomaticDataDetection:) keyEquivalent:@""];
    [substitutionsMenu addItem:dataDetectors];
    
    NSMenuItem * textReplacement = [[NSMenuItem alloc] initWithTitle:@"Text Replacement" action:@selector(toggleAutomaticTextReplacement:) keyEquivalent:@""];
    [substitutionsMenu addItem:textReplacement];
    
    [appMenu setSubmenu:substitutionsMenu forItem:substitutionsItem];
    
    NSMenuItem * transformationsItem = [[NSMenuItem alloc] initWithTitle:@"Transformations" action:nil keyEquivalent:@""];
    [appMenu addItem:transformationsItem];
    
    NSMenu * transformationsMenu = [[NSMenu alloc] initWithTitle:@"Transformations"];
    
    NSMenuItem * makeUpperCase = [[NSMenuItem alloc] initWithTitle:@"Make Upper Case" action:@selector(uppercaseWord:) keyEquivalent:@""];
    [transformationsMenu addItem:makeUpperCase];
    
    NSMenuItem * makeLowerCase = [[NSMenuItem alloc] initWithTitle:@"Make Lower Case" action:@selector(lowercaseWord:) keyEquivalent:@""];
    [transformationsMenu addItem:makeLowerCase];
    
    NSMenuItem * capitalize = [[NSMenuItem alloc] initWithTitle:@"Capitalize" action:@selector(capitalizeWord:) keyEquivalent:@""];
    [transformationsMenu addItem:capitalize];
    
    [appMenu setSubmenu:transformationsMenu forItem:transformationsItem];
    
    NSMenuItem * speechItem = [[NSMenuItem alloc] initWithTitle:@"Speech" action:nil keyEquivalent:@""];
    [appMenu addItem:speechItem];
    
    NSMenu * speechMenu = [[NSMenu alloc] initWithTitle:@"Speech"];
    
    NSMenuItem * startSpeaking = [[NSMenuItem alloc] initWithTitle:@"Start Speaking" action:@selector(startSpeaking:) keyEquivalent:@""];
    [speechMenu addItem:startSpeaking];
    
    NSMenuItem * stopSpeaking = [[NSMenuItem alloc] initWithTitle:@"Stop Speaking" action:@selector(stopSpeaking:) keyEquivalent:@""];
    [speechMenu addItem:stopSpeaking];
    
    [appMenu setSubmenu:speechMenu forItem:speechItem];
    
    return appMenu;
}

- (void)undo:(id)sender
{
    
}

- (void)redo:(id)sender
{
    
}

- (void)cut:(id)sender
{
    
}

- (void)copy:(id)sender
{
    
}

- (void)paste:(id)sender
{
    
}

- (void)delete:(id)sender
{
    
}

- (void)selectAll:(id)sender
{
    
}

#pragma mark - spelling

- (void)showGuessPanel:(id)sender
{
    
}

- (void)checkSpelling:(id)sender
{
    
}

- (void)toggleContinuousSpellChecking:(id)sender
{
    
    
}

- (void)toggleGrammarChecking:(id)sender
{
    
}

- (void)toggleAutomaticSpellingCorrection:(id)sender
{
    
}

- (void)orderFrontSubstitutionsPanel:(id)sender
{
    
}

- (void)toggleSmartInsertDelete:(id)sender
{
    
}

- (void)toggleAutomaticQuoteSubstitution:(id)sender
{
    
}

- (void)toggleAutomaticDashSubstitution:(id)sender
{
    
}

- (void)toggleAutomaticLinkDetection:(id)sender
{
    
}

- (void)toggleAutomaticDataDetection:(id)sender
{
    
}

- (void)toggleAutomaticTextReplacement:(id)sender
{
    
}

- (void)uppercaseWord:(id)sender
{
    
}

- (void)lowercaseWord:(id)sender
{
    
}

- (void)capitalizeWord:(id)sender
{
    
}

- (void)startSpeaking:(id)sender
{
    
}

- (void)stopSpeaking:(id)sender
{
    
}

- (void)performFindPanelAction:(id)sender
{
    
}

- (void)pasteAsPlainText:(id)sender
{
    
}

- (void)centerSelectionInVisibleArea:(id)sender
{
    
}

+ (NSMenu *)formatMenu
{
    NSMenu * appMenu = [[NSMenu alloc] initWithTitle:@"Format"];
    
    return appMenu;
}

+ (NSMenu *)viewMenu
{
    NSMenu * appMenu = [[NSMenu alloc] initWithTitle:@"View"];
    
    return appMenu;
}

+ (NSMenu *)windowMenu
{
    NSMenu * appMenu = [[NSMenu alloc] initWithTitle:@"Window"];
    
    return appMenu;
}

+ (NSMenu *)helpMenu
{
    NSMenu * appMenu = [[NSMenu alloc] initWithTitle:@"Help"];
    
    return appMenu;
}

@end

