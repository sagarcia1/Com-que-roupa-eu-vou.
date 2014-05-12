//
//  ALIJSON.m
//  Com que roupa eu vou.
//
//  Created by Marcelo Garcia on 08/05/14.
//  Copyright (c) 2014 com.bit4All.comqueroupa. All rights reserved.
//

#import "ALIJSON.h"
#import <CoreLocation/CoreLocation.h>
#include "math.h"

@implementation ALIJSON


-(void)jsonFoursquare
{
    NSError *error;
    //NSString *str = @"https://api.forecast.io/forecast/2f1c35dd930d9bc505e6399e60f3e4a7/-30.043481,%20-51.213194";
    NSString *str = [NSString stringWithFormat:@"https://api.forecast.io/forecast/2f1c35dd930d9bc505e6399e60f3e4a7/%@,%@",self.latitude,self.longitude];
    NSURL *url =[NSURL URLWithString:str];
    NSData *dataJson = [NSData dataWithContentsOfURL:url];
    self.getJson = [NSJSONSerialization JSONObjectWithData:dataJson options:kNilOptions error:&error];
    self.getTemp = [self.getJson valueForKey:@"currently"];
    self.strTemp = [[[self.getJson valueForKey:@"currently"]valueForKey:@"temperature"]floatValue ];
    self.windVelocity = [[[self.getJson valueForKey:@"currently"]valueForKey:@"windSpeed"] floatValue];
    self.celsiusTemp = ((self.strTemp -32)/1.8);
    NSLog(@"TEMPERATURA %.2f",self.celsiusTemp);
    self.sensTerm =( 33 +(10 *sqrt(self.windVelocity)+ 10.45 - self.windVelocity)*((self.celsiusTemp - 33)/22));
    NSLog(@"%2.f",self.windVelocity);
    
}

-(void)getLocations
{
    
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLHeadingFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    CLLocation *location = [self.locationManager location];
    CLLocationCoordinate2D coordinate = [location coordinate];
    self.latitude = [NSString stringWithFormat:@"%f",coordinate.latitude];
    self.longitude = [NSString stringWithFormat:@"%f",coordinate.longitude];
    NSLog(@"%@ Latitude",self.latitude);
    NSLog(@"%@longitude",self.longitude);
    
    
}


@end
