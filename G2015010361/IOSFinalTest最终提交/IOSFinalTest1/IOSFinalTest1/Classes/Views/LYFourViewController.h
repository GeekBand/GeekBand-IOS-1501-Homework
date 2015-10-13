//
//  LYFourViewController.h
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "LYBaseViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface LYFourViewController : LYBaseViewController<CLLocationManagerDelegate, MKMapViewDelegate>
{
    MKMapView           *_mapView;
    UILabel             *_locationLabel;
    NSMutableArray      *_annotations;
}

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, strong) CLGeocoder *geocoder;


@end
