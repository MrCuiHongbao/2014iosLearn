//
//  DocumentPickerViewController.m
//  DocumentProvider
//
//  Created by zhangliang on 14-10-10.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "DocumentPickerViewController.h"

@interface DocumentPickerViewController ()

@end

@implementation DocumentPickerViewController

- (IBAction)openDocument:(id)sender {
    NSURL* documentURL = [self.documentStorageURL URLByAppendingPathComponent:@"Untitled.txt"];
    
    // TODO: if you do not have a corresponding file provider, you must ensure that the URL returned here is backed by a file
    [self dismissGrantingAccessToURL:documentURL];
}

-(void)prepareForPresentationInMode:(UIDocumentPickerMode)mode {
    // TODO: present a view controller appropriate for picker mode here
}

@end
