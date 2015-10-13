//
//  LYFourViewController.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//


#import "LYFourViewController.h"
#import "LYAnnotation.h"
@interface LYFourViewController ()

@end

@implementation LYFourViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Map View";
    self.bgImageView.image = [UIImage imageNamed:@"bgFive"];
    
    _annotations = [[NSMutableArray alloc] initWithCapacity:3];
    
    CLLocationCoordinate2D coordinate1 = {31.19316, 121.43154};
    LYAnnotation *annotation1 = [[LYAnnotation alloc] initWithCoordinate:coordinate1 title:@"黄埔区" subtitle:@"瑞金南路1号" index:0];
    [_annotations addObject:annotation1];
    

    
    
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    
    _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 64, width, height - 64 - 49 - 50)];
    //    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    
    CLLocationCoordinate2D coordinate = {31.19316, 121.43154};
    MKCoordinateSpan span = {0.005, 0.005};
    MKCoordinateRegion region = {coordinate, span};
    [_mapView setRegion:region];
    
    _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _mapView.frame.origin.y + _mapView.frame.size.height, width, 50)];
    _locationLabel.textAlignment = NSTextAlignmentCenter;
    _locationLabel.backgroundColor = [UIColor cyanColor];
    _locationLabel.text = @"user's location.";
    [self.view addSubview:_locationLabel];
    
    UIBarButtonItem *locationButton
    = [[UIBarButtonItem alloc] initWithTitle:@"定位"
                                       style:UIBarButtonItemStyleBordered
                                      target:self
                                      action:@selector(locationButtonClicked:)];
    self.navigationItem.leftBarButtonItem = locationButton;
    
    UIBarButtonItem *reverseButton
    = [[UIBarButtonItem alloc] initWithTitle:@"解析"
                                       style:UIBarButtonItemStyleBordered
                                      target:self
                                      action:@selector(reversButtonClicked:)];
    UIBarButtonItem *flagButton
    = [[UIBarButtonItem alloc] initWithTitle:@"标注"
                                       style:UIBarButtonItemStyleBordered
                                      target:self
                                      action:@selector(flagButtonClicked:)];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:reverseButton, flagButton, nil];
}

- (void)locationButtonClicked:(id)sender
{
    if (self.locationManager == nil) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
    }
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0) { // 如果系统设备>= 8.0
        [self.locationManager requestWhenInUseAuthorization] ;
    } else {
        // 2. 开始定位
        [self.locationManager startUpdatingLocation] ;
    }
}

typedef void (^UserInfoBlock)(NSString *);

- (void)test:(UserInfoBlock)uBlock
{
    uBlock(@"abc");
}

- (void)reversButtonClicked:(id)sender
{
    [self test:^(NSString *name) {
        NSLog(@"%@", name);
    }];
    
    self.geocoder = [[CLGeocoder alloc] init];
    
    [self.geocoder reverseGeocodeLocation:self.currentLocation
                        completionHandler:^(NSArray *placemarks, NSError *error){
                            if (error) {
                                NSLog(@"%@", error.description);
                            }else {
                                if ([placemarks count] > 0) {
                                    CLPlacemark *placemark = [placemarks objectAtIndex:0];
                                    _locationLabel.text = placemark.country;
                                }
                            }
                        }];
}

- (void)flagButtonClicked:(id)sender
{
    [_mapView removeAnnotations:_mapView.annotations];
    [_mapView addAnnotations:_annotations];
}


#pragma mark - MKMapViewDelegate methods

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if (![[annotation class] isSubclassOfClass:[LYAnnotation class]]) {
        return nil;
    }
    LYAnnotation *blAnnotation = (LYAnnotation *)annotation;
    static NSString *kReuseIdentifier = @"annotion";

    
    MKPinAnnotationView *pinAnnotationView
    = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:kReuseIdentifier];
    
    if (pinAnnotationView == nil) {
        pinAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:(id<MKAnnotation>)blAnnotation reuseIdentifier:kReuseIdentifier];
        pinAnnotationView.animatesDrop = YES;
        pinAnnotationView.canShowCallout = YES;
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(0, 0, 30, 30);
        leftButton.backgroundColor = [UIColor redColor];
        pinAnnotationView.leftCalloutAccessoryView = leftButton;
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinAnnotationView.rightCalloutAccessoryView = rightButton;
    }
    
    if (blAnnotation.index == 0) {
        pinAnnotationView.pinColor = MKPinAnnotationColorGreen;
        pinAnnotationView.leftCalloutAccessoryView.tag = 0;
    }else if (blAnnotation.index == 1) {
        pinAnnotationView.pinColor = MKPinAnnotationColorPurple;
    }else if (blAnnotation.index == 2) {
        pinAnnotationView.pinColor = MKPinAnnotationColorRed;
    }
    pinAnnotationView.tag = blAnnotation.index;
    
    return pinAnnotationView;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    if (view.tag) {
        
    }
}

#pragma mark - CLLocationManagerDelegate methods

- (void) locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusNotDetermined) {
        NSLog(@"等待用户授权");
    }else if (status == kCLAuthorizationStatusAuthorizedAlways ||
              status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager startUpdatingLocation];
        
    } else {
        NSLog(@"授权失败");
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [self.locationManager stopUpdatingLocation];
    NSLog(@"%@", error.description);
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    [self.locationManager stopUpdatingLocation];
    self.currentLocation = newLocation;
    //    CLLocationDistance distance = [newLocation distanceFromLocation:oldLocation];
    _locationLabel.text = [NSString stringWithFormat:@"(%f,%f)", newLocation.coordinate.latitude,
                           newLocation.coordinate.longitude];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end