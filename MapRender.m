//
//  MapRender.m
//  slippymap
//
//  Created by Daniel Hahn on 10.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapRender.h"


@implementation MapRender


@synthesize tileServerUrl;

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
	[targetImage release];
	
	NSImageRep* tempImageRep1 = [NSImageRep imageRepWithContentsOfURL: [NSURL URLWithString: [self.tileServerUrl stringByAppendingString: @"/1/0/0.png"]]];
	NSImageRep* tempImageRep2 = [NSImageRep imageRepWithContentsOfURL: [NSURL URLWithString: [self.tileServerUrl stringByAppendingString: @"/1/1/0.png"]]];
    // NSImageRep* tempImageRep2 = [NSImageRep imageRepWithContentsOfURL: [NSURL URLWithString: @"http://a.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/999/256/1/1/0.png"]];
	targetImage = [[NSImage alloc] initWithSize:NSMakeSize(300.0, 300.0)];
	[targetImage lockFocus];
	[tempImageRep1 drawInRect:NSMakeRect(0, 0, 150.0, 300.0)];
	[tempImageRep2 drawInRect:NSMakeRect(150.0, 0, 300.0, 300.0)];
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
