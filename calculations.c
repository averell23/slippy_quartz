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
	return (M_PI/(180.0*60.0))*(meters / 1852.0); // 1852m is one nautical mile
}

double distance_to_meters(double radians) {
	return (((180.0*60.0)/M_PI)*radians) * 1852.0; // 1852 is one nautical mile
}

double rad(double degrees) {
	return (M_PI/180.0)*degrees;
}

double deg(double radians) {
	return (180.0/M_PI)*radians;
}

int long2tilex(double lon, int zoom_level) 
{ 
	return (int)(floor((lon + 180.0) / 360.0 * pow(2.0, zoom_level))); 
}

int lat2tiley(double lat, int zoom_level)
{ 
	return (int)(floor((1.0 - log( tan(lat * M_PI/180.0) + 1.0 / cos(lat * M_PI/180.0)) / M_PI) / 2.0 * pow(2.0, zoom_level))); 
}

double tilex2long(int x, int zoom_level) 
{
	return x / pow(2.0, zoom_level) * 360.0 - 180;
}

double tiley2lat(int y, int zoom_level) 
{
	double n = M_PI - 2.0 * M_PI * y / pow(2.0, zoom_level);
	return 180.0 / M_PI * atan(0.5 * (exp(n) - exp(-n)));
}