//
//  LYAnnotation.h
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface LYAnnotation : NSObject<MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, assign) NSInteger index;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
                   title:(NSString *)title
                subtitle:(NSString *)subtitle
                   index:(NSInteger)index;

@end


