/*
    File: EnumerationSample.m
Abstract: Demonstrates various methods of enumerating over the contents of
an EnumerableClass instance.
 Version: 1.1

Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
Inc. ("Apple") in consideration of your agreement to the following
terms, and your use, installation, modification or redistribution of
this Apple software constitutes acceptance of these terms.  If you do
not agree with these terms, please do not use, install, modify or
redistribute this Apple software.

In consideration of your agreement to abide by the following terms, and
subject to these terms, Apple grants you a personal, non-exclusive
license, under Apple's copyrights in this original Apple software (the
"Apple Software"), to use, reproduce, modify and redistribute the Apple
Software, with or without modifications, in source and/or binary forms;
provided that if you redistribute the Apple Software in its entirety and
without modifications, you must retain this notice and the following
text and disclaimers in all such redistributions of the Apple Software.
Neither the name, trademarks, service marks or logos of Apple Inc. may
be used to endorse or promote products derived from the Apple Software
without specific prior written permission from Apple.  Except as
expressly stated in this notice, no other rights or licenses, express or
implied, are granted by Apple herein, including but not limited to any
patent rights that may be infringed by your derivative works or by other
works in which the Apple Software may be incorporated.

The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.

IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

Copyright (C) 2014 Apple Inc. All Rights Reserved.

*/

#import <Foundation/Foundation.h>
#import "EnumerableClass.h"

// -------------------------------------------------------------------------------
//	main()
//  Program entry point.
// -------------------------------------------------------------------------------
int main (int argc, const char * argv[])
{
    @autoreleasepool
    {
        // And to demonstrate, we create an instance of our enumeration sample 
        // class and enumerate over its contents.
        EnumerableClass *example = [[EnumerableClass alloc] initWithCapacity:50];
        
        // Enumerate using a for loop and subscripted access.
        NSLog(@"Enumerating using a for loop...");
        for (NSUInteger i=0; i<example.numItems; i++)
        {
            NSLog(@"Item %li = %@", i, example[i]);
        }
        
        // Enumerate using block-based enumeration.
        NSLog(@"Enumerating using block-based enumeration...");
        [example enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSLog(@"Item %li = %@", idx, obj);
        }];
        
        NSUInteger idx = 0;
        
        // Enumerate using NSEnumerator.
        NSLog(@"Enumerating using NSEnumerator...");
        NSEnumerator *enumerator = [example objectEnumerator];
        id currentObject;
        while ((currentObject = [enumerator nextObject]))
        {
            NSLog(@"Item %li = %@", idx++, currentObject);
        }
        
        NSArray * array = [enumerator allObjects];
        NSLog(@"************** count:%ld", array.count);
        
        // Enumerate using fast enumeration.
        NSLog(@"Enumerating using fast enumeration...");
        idx = 0;
        for(id item in example)
        {
            NSLog(@"Item %li = %@", idx++, item);
        }
        
#if ! __has_feature(objc_arc)
        [example release];
#endif
        
    }

    return 0;
}
