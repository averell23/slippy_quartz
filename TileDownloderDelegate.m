//
//  TileDownloderDelegate.m
//  slippymap
//
//  Created by Daniel Hahn on 23/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TileDownloderDelegate.h"


@implementation TileDownloderDelegate

- (id)initWithDrawingRect:(NSRect)rect {
	if(self = [super init]) {
		/*
		 Allocate any permanent resource required by the plug-in.
		 */
		drawingRect = rect;
		receivedData = [[NSMutableData data] retain];
	}
	
	return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[receivedData setLength:0];
}

@end
