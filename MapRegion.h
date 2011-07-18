//
//  MapRegion.h
//  slippymap
//
//  Created by Daniel Hahn on 17/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GeoPoint.h"


@interface MapRegion : NSObject {
	GeoPoint* topLeft;
	GeoPoint* lowRight;
}

@property(readonly) topLeft;
@property(readonly) lowRight;

- (id) initWithLat1: (double) lat1 lon1: (double) lon1 lat2: (double) lat2 lon2: (double) lon2;

@end
