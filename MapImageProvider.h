//
//  MapImageProvider.h
//  slippymap
//
//  Created by Daniel Hahn on 03.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface MapImageProvider : NSObject <QCPlugInOutputImageProvider> {
	NSBitmapImageRep* internImageRepresentation;
}

@end
