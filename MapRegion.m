//
//  MapRegion.m
//  slippymap
//
//  Created by Daniel Hahn on 17/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapRegion.h"


@implementation MapRegion

@synthesize topLeft, lowRight;

- (id) initWithLat1: (double) lat1 lon1: (double) lon1 lat2: (double) lat2 lon2: (double) lon2 {
	if(self = [super init]) {
		// sort the coordinates so that we always have a sensible region from top left to low right
		topLeft = [[GeoPoint alloc] initWithLat:((lat1 < lat2) ? lat1 : lat2) lon:((lon1 < lon2) ? lon1 : lon2)];
		lowRight = [[GeoPoint alloc] initWithLat:((lat2 < lat1) ? lat2 : lat1) lon:((lon2 < lon1) ? lon2 : lon1)];
		self.lon = nlon;
	}
	
	return self;
}

- (void) dealloc
{
	[topLeft release];
	[lowRight release];
	/*
	 Release any resources created in -init.
	 */
	
	[super dealloc];
}

@end
