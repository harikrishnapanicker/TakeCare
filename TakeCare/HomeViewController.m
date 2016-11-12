//
//  HomeViewController.m
//  TakeCare
//
//  Created by HariKrishna Panicker on 12/11/16.
//  Copyright © 2016 HariKrishna Panicker. All rights reserved.
//

// AIzaSyBAchO0zlymHjPnOj0OxKszPad-4WvhUyo  -google api key


#import "HomeViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@interface HomeViewController ()
{
    float lat;
    float lon;
}
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (strong, nonatomic) GMSMapView *mapView;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self loadLatAnLlong];
    [self loadView];

}

-(void)loadLatAnLlong {
    CLLocationCoordinate2D coordinate = [self getLocation];
    NSString *latitude = [NSString stringWithFormat:@"%f", coordinate.latitude];
    NSString *longitude = [NSString stringWithFormat:@"%f", coordinate.longitude];
    
    lat = coordinate.latitude;
    lon = coordinate.longitude;
}

- (void)loadView {
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:lat
                                                            longitude:lon                                                                 zoom:6];
     self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.mapView.myLocationEnabled = YES;
    self.view = self.mapView;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(lat, lon);
    marker.title = @"ME";
    marker.snippet = @" ";
    marker.map = self.mapView;
}
-(CLLocationCoordinate2D) getLocation{
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    CLLocation *location = [locationManager location];
    CLLocationCoordinate2D coordinate = [location coordinate];
    
    return coordinate;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}


#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        NSString * longitudeLabel = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
//        NSString * latitudeLabel = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
}

@end
