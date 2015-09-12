//
//  LAnnotation.h
//  Xcode_learn
//
//  Created by house on 15/8/6.
//  Copyright © 2015年 putact. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LAnnotation : NSObject<MKAnnotation>
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic,assign)NSInteger index;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
                  title:(NSString *)title
               subtitle:(NSString *)subtitle
                  index:(NSInteger) index;
@end
