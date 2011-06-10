//
//  MapRender.m
//  slippymap
//
//  Created by Daniel Hahn on 10.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapRender.h"


@implementation MapRender

- (id) init
{
	if(self = [super init]) {
		/*
		 Allocate any permanent resource required by the plug-in.
		 */
		NSImageRep* tempImageRep = [NSImageRep imageRepWithContentsOfURL: [NSURL URLWithString: @"http://a.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/999/256/5/21/9.png"]];
		targetImage = [[NSImage alloc] initWithSize:NSMakeSize(300.0, 300.0)];
		[targetImage lockFocus];
		[tempImageRep draw];
	}
	
	return self;
}

- (NSBitmapImageRep*) imageRep {
	return [[targetImage representations] lastObject];
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
