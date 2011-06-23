//
//  slippymapPlugIn.h
//  slippymap
//
//  Created by Daniel Hahn on 03.06.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Quartz/Quartz.h>
#import <AppKit/AppKit.h>
#import "MapRenderer.h"

@interface slippymapPlugIn : QCPlugIn
{
	MapRenderer* mapRenderer;
}

/*
Declare here the Obj-C 2.0 properties to be used as input and output ports for the plug-in e.g.
@property double inputFoo;
@property(assign) NSString* outputBar;
You can access their values in the appropriate plug-in methods using self.inputFoo or self.inputBar
*/

@property(assign) id<QCPlugInOutputImageProvider> outputImage;
@property(assign) NSString* inputTileServerUrl;
@property(assign) NSUInteger inputPixelDimension;

@end
