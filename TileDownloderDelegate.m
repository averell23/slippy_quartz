//
//  TileDownloderDelegate.m
//  slippymap
//
//  Created by Daniel Hahn on 23/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TileDownloderDelegate.h"


@implementation TileDownloderDelegate

- (id)initWithDrawingRect:(NSRect)rect renderer:(MapRenderer*)renderer {
	if(self = [super init]) {
		/*
		 Allocate any permanent resource required by the plug-in.
		 */
		drawingRect = rect;
		receivedData = [[NSMutableData data] retain];
		mapRenderer = renderer;
	}
	
	return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	// release the connection, and the data object
    [connection release];
    [receivedData release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	// do something with the data
    // receivedData is declared as a method instance elsewhere
    NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
	
    // release the connection, and the data object
    [connection release];
    [receivedData release];
}

@end
