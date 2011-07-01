/*
 *  calculations.c
 *  slippymap
 *
 *  Created by Daniel Hahn on 01.07.11.
 *  Copyright 2011 __MyCompanyName__. All rights reserved.
 *
 */

#include "calculations.h"
#include <math.h>

coordinate target_coordinate(coordinate startPoint, double distance, double trueCourse) {
	double lat = asin(sin(startPoint.lat)*cos(distance)+cos(startPoint.lat)*sin(distance)*cos(trueCourse));
	double dlon = atan2(sin(trueCourse)*sin(distance)*cos(startPoint.lat),cos(distance)-sin(startPoint.lat)*sin(lat));
	double lon = fmod(startPoint.lon-dlon+M_PI,2*M_PI )-M_PI;
	coordinate result = { lat, lon };
	return result;
}

double distance_to_radians(double meters) {
	return (M_PI/(180*60))*(meters / 1852.0); // 1852m is one nautical mile
}

double distance_to_meters(double radians) {
	return (((180*60)/M_PI)*radians) * 1852.0; // 1852 is one nautical mile
}