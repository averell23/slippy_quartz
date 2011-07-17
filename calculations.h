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

// Circumference of the earth along the equator (approx)
#define EQUATOR_CIRCUMFERENCE 40000.0

// Each tile is expected to be TILE_SIZExTILE_SIZE pixel
#define TILE_SIZE 256

/*
 * Computes the target coordinate that you will reach when you go for a distance from
 * the start point, following a given initial trueCourse.
 *
 * All parameters, including the distance, must be given in radians.
 */
coordinate target_coordinate(coordinate start_point, double distance, double true_course);

/*
 * Convert a given distance in meters to radians.
 * See http://williams.best.vwh.net/avform.htm
 */
double distance_to_radians(double meters);

// Convert a given distance in radians to meters
double distance_to_meters(double radians);

// Convert from radians to degrees
double deg(double radians);

// Convert from degrees to radians
double rad(double degrees);

// Convert longitude (in rad) to an x tile number for OSM.
// See http://wiki.openstreetmap.org/wiki/Slippy_map_tilenames
int long2tilex(double lon, int zoom_level);

// Convert latitude to an y tile number for OSM
int lat2tiley(double lat, int zoom_level);

// Convert an x tile number from OSM to longitude
double tilex2long(int x, int zoom_level);

// Convert an y tile number from OSM to latitude
double tiley2lat(int y, int zoom_level);

// Return the resolution in pixel/km
double resolution(int pixel, double kilometers);

// Returns the best zoom level for a given resolution
int zoomLevel_res(double resolution);

// Returns the best zoom level for a given area side length,
// to be rendered into the given amount of pixesl
int zoomLevel(int pixel, double kilometers);