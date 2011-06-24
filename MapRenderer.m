//
//  MapRender.m
//  slippymap
//
//  Created by Daniel Hahn on 10.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapRenderer.h"
#import "TileDownloderDelegate.h"

@implementation MapRenderer


@synthesize tileServerUrl, pixelDimension;

- (id) init
{
	if(self = [super init]) {
		/*
		 Allocate any permanent resource required by the plug-in.
		 */
	}
	
	return self;
}

- (BOOL) initializeTileDownloadWithZoomLevel:(int)zoomLevel xPosition:(int)tileX yPosition:(int)tileY drawingRect:(NSRect) drawingRect {
	NSString* urlString = [NSString stringWithFormat: @"%@/%d/%d/%d.png", self.tileServerUrl, zoomLevel, tileX, tileY];
	NSURL* currentUrl = [NSURL URLWithString: urlString];
	TileDownloderDelegate* delegate = [[TileDownloderDelegate alloc] initWithDrawingRect:drawingRect renderer:self];
	NSURLRequest *theRequest=[NSURLRequest requestWithURL:currentUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:2.0];
	NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:delegate];
	if (theConnection) {
		return TRUE;
	} else {
		[delegate release];
		return FALSE;
	}
	
}

- (BOOL) reRender {
	int zoomLevel = ceil(log2(self.pixelDimension / 256.0));
	double tileRange = exp2(zoomLevel);
	
	[targetImage release];
	targetImage = [[NSImage alloc] initWithSize:NSMakeSize(self.pixelDimension, self.pixelDimension)];
	
	[targetImage lockFocus];
	
	// Coordinate system has its origin in the lower left, PS-Style
	for(int x=0 ; x < tileRange ; x++) {
		for(int y=0 ; y < tileRange ; y++) {
			int xpos = x*256;
			int ypos = self.pixelDimension-((y+1)*256);
			[self initializeTileDownloadWithZoomLevel:zoomLevel xPosition:x yPosition:y drawingRect:NSMakeRect(xpos, ypos, 256, 256)];
		}
	}
	
	return YES;
}

- (void) renderWithDownloadedData:(NSData*)data inRect:(NSRect)rect {
	[targetImage lockFocus];
	NSBitmapImageRep* imageRep = [NSBitmapImageRep imageRepWithData:data];
	[imageRep drawInRect:rect];
	[targetImage unlockFocus];
}


- (NSBitmapImageRep*) imageRep {
	NSSize size = [targetImage size];
	[targetImage lockFocus];
	NSBitmapImageRep* rep = [[NSBitmapImageRep alloc] initWithFocusedViewRect: NSMakeRect(0,0,size.width,size.height)];
	[targetImage unlockFocus];
	
	return rep;
}

- (void) dealloc
{
	[targetImage release];
	/*
	 Release any resources created in -init.
	 */
	
	[super dealloc];
}


@end
