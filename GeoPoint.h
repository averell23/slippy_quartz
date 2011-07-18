//
//  GeoPoint.h
//  slippymap
//
//  Created by Daniel Hahn on 17/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface GeoPoint : NSObject {
	double lat;
	double lon;
}

@property(assign) double lat;
@property(assign) double lon;

- (id) initWithLat: (double) lat lon: (double) lon;
- (int) xTileWithZoomLevel: (int) zoomLevel;
- (int) yTileWithZoomLevel: (int) zoomLevel;


@end
