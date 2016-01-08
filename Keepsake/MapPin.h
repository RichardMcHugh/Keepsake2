//
//  MapPin.h
//  Keepsake
//
//  Created by Richard McHugh on 08/01/2016.
//  Copyright © 2016 Richard McHugh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapPin : NSObject <MKAnnotation> {

    CLLocationCoordinate2D coordiante;
    NSString *title;
    NSString *subtitle;
    
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;


@end
