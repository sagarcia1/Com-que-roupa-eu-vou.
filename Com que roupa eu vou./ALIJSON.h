//
//  ALIJSON.h
//  Com que roupa eu vou.
//
//  Created by Marcelo Garcia on 08/05/14.
//  Copyright (c) 2014 com.bit4All.comqueroupa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface ALIJSON : NSObject<CLLocationManagerDelegate>
@property (nonatomic,strong)NSArray *getTemp;
@property (nonatomic,strong)NSDictionary *getJson;
@property float strTemp;
@property float windVelocity;
@property float celsiusTemp;
@property float sensTerm;
@property float latitude;
@property float longitude;



-(void)jsonFoursquare;


@end
