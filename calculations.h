/*
 *  calculations.h
 *  slippymap
 *
 *  Created by Daniel Hahn on 01.07.11.
 *  Copyright 2011 __MyCompanyName__. All rights reserved.
 *
 */
typedef struct {
	double lat;
	double lon;
} coordinate;

/*
 * Computes the target coordinate that you will reach when you go for a distance from
 * the start point, following a given initial trueCourse.
 *
 * All parameters, including the distance, must be given in radians.
 */
coordinate target_coordinate(coordinate startPoint, double distance, double trueCourse);

/*
 * Convert a given distance in meters to radians.
 * See http://williams.best.vwh.net/avform.htm
 */
double distance_to_radians(double meters);

// Convert a given distance in radians to meters
double distance_to_meters(double radians);