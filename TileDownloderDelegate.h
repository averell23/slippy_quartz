//
//  TileDownloderDelegate.h
//  slippymap
//
//  Created by Daniel Hahn on 23/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MapRenderer.h"


@interface TileDownloderDelegate : NSObject {
	NSRect drawingRect;
	NSMutableData* receivedData;
	MapRenderer* mapRenderer;
}

- (id)initWithDrawingRect:(NSRect)rect renderer:(MapRenderer*)renderer;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;

@end
