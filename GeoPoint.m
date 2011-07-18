//
//  GeoPoint.m
//  slippymap
//
//  Created by Daniel Hahn on 17/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GeoPoint.h"


@implementation GeoPoint

@synthesize lat, lon;

- (id) initWithLat: (double) nlat lon: (double) nlon {
	if(self = [super init]) {
		self.lat = nlat;
		self.lon = nlon;
	}
	
	return self;
}

- (int) xTileWithZoomLevel: (int) zoomLevel {
	return (int)(floor((self.lon + 180.0) / 360.0 * pow(2.0, zoomLevel)));
}

- (int) yTileWithZoomLevel: (int) zoomLevel {
	return (int)(floor((1.0 - log( tan(self.lat * M_PI/180.0) + 1.0 / cos(self.lat * M_PI/180.0)) / M_PI) / 2.0 * pow(2.0, zoomLevel)));
}

@end
