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
	double lat, lon;
	
	BOOL needsRedraw; // Indicates if the plugin needs to re-render the contents (because a tile arrived)
	BOOL needsRedownload; // Indicates if we need to re-download the tiles, because parameters changed
}

@property(assign) NSString* tileServerUrl;
@property(assign) NSUInteger pixelDimension;
@property(assign) BOOL needsRedraw;
@property(assign) double lat;
@property(assign) double lon;

- (void) renderWithDownloadedData:(NSData*)data inRect:(NSRect)rect;
- (NSBitmapImageRep*) imageRep;
- (BOOL) startRedownloadIfNeeded;

@end
