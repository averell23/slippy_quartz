//
//  MapRender.m
//  slippymap
//
//  Created by Daniel Hahn on 10.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapRender.h"


@implementation MapRender


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

- (BOOL) reRender {
	double zoomLevel = ceil(log2(self.pixelDimension / 256.0));
	double tileRange = exp2(zoomLevel);
	
	[targetImage release];
	targetImage = [[NSImage alloc] initWithSize:NSMakeSize(self.pixelDimension, self.pixelDimension)];
	
	[targetImage lockFocus];
	
	// for(int x=0 ; x < tileRange ; x++) {
		// for(int y=0 ; y < tileRange ; y++) {
	int x = 0;
	int y = 0;
			NSString* urlString = [self.tileServerUrl stringByAppendingFormat:@"/%@/%@/%@.png", zoomLevel, x, y];
			NSURL* currentUrl = [NSURL URLWithString: urlString];
			NSImageRep* currentImageRep = [NSImageRep imageRepWithContentsOfURL: currentUrl];
			[currentImageRep drawInRect:NSMakeRect(256*x, 256*y, 256, 256)];
		// }
	// }
	
	[targetImage unlockFocus];
	
	
	return YES;
}


- (NSBitmapImageRep*) imageRep {
	
	NSSize size = [targetImage size];
	
	[targetImage lockFocus];
	
	NSBitmapImageRep* rep = [[NSBitmapImageRep alloc] initWithFocusedViewRect:
							 
							 NSMakeRect(0,0,size.width,size.height)];
	
	
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
