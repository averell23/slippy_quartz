//
//  MapImageProvider.m
//  slippymap
//
//  Created by Daniel Hahn on 03.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapImageProvider.h"


@implementation MapImageProvider

- (id) init {
	
	self = [super init];
    if (self) {
		NSImageRep* tempRep = [NSImageRep imageRepWithContentsOfURL: [NSURL URLWithString: @"http://a.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/999/256/5/21/9.png"]];
		if ([tempRep isKindOfClass:[NSBitmapImageRep class]]) {
			internImageRepresentation = (NSBitmapImageRep*) tempRep;
			[internImageRepresentation retain];
		}
		
    }
	
    return self;
}

- (void) dealloc
{
    [internImageRepresentation release];
    [super dealloc];
}

- (NSRect) imageBounds
{
    // imageBoundaries in pixels
	return NSMakeRect(0.0, 0.0, [internImageRepresentation pixelsWide], [internImageRepresentation pixelsHigh]);
}

- (CGColorSpaceRef) imageColorSpace
{
    return [[internImageRepresentation colorSpace] CGColorSpace];
}


- (NSArray*) supportedBufferPixelFormats
{
    /* Support for only ARGB8, BGRA8 and RGBAf */
    return [NSArray arrayWithObjects:QCPlugInPixelFormatARGB8,
			QCPlugInPixelFormatBGRA8,
			QCPlugInPixelFormatRGBAf,
			nil];
}

- (BOOL) renderToBuffer:(void*)baseAddress
        withBytesPerRow:(NSUInteger)rowBytes
            pixelFormat:(NSString*)format
              forBounds:(NSRect)bounds
{
	baseAddress = [internImageRepresentation bitmapData];
    return YES;
    // if(error != kvImageNoError)
		// return NO;
    // Success!
    // return YES;
}

@end
