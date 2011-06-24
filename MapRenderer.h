//
//  MapRenderer.h
//  slippymap
//
//  Created by Daniel Hahn on 10.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AppKit/AppKit.h>


@interface MapRenderer : NSObject {
	NSImage* targetImage;
	NSMutableArray* tileImages;
	NSString* tileServerUrl;
	NSUInteger pixelDimension;
}

@property(assign) NSString* tileServerUrl;
@property(assign) NSUInteger pixelDimension;

- (void) renderWithDownloadedData:(NSData*)data inRect:(NSRect)rect;
- (NSBitmapImageRep*) imageRep;
- (BOOL) reRender;

@end
