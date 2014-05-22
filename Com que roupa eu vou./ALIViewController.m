//
//  ALIViewController.m
//  Com que roupa eu vou.
//
//  Created by Marcelo Garcia on 08/05/14.
//  Copyright (c) 2014 com.bit4All.comqueroupa. All rights reserved.
//

#import "ALIViewController.h"
#import "ALIJSON.h"
#import <CoreLocation/CoreLocation.h>

@interface ALIViewController ()<CLLocationManagerDelegate>
{
    float celsius;
    float grauReal;
}

@end

@implementation ALIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getLocations];
 
    
   
  
    
}

-(void)fillLabels
{

        self.lblTemp.text = [NSString stringWithFormat:@"%.1f",grauReal];
        self.lblSensTerm.text = [NSString stringWithFormat:@"%.1f",celsius];
        float temp = celsius;
        if (temp <0) {
            self.lblRoupa.text = @"Blusão";
            self.imgCamisa.image = [UIImage imageNamed:@"camisa"];
            self.lblBlusao.text =@"Casaco Pesado";
            self.imgCasaco.image = [UIImage imageNamed:@"casaco"];
            self.lblCasaco.text =@"";
            self.lblCalca.text = @"Calca ";
            self.imgcalca.image =[UIImage imageNamed:@"calça"];
            self.lblGorro.text = @"Gorro Pegado";
            self.imgGorro.image = [UIImage imageNamed:@"gorro"];
            self.lblLuva.text = @"";
            
        }
        else if(temp <15)
        {
            self.lblRoupa.text = @"Blusão";
            self.imgCamisa.image = [UIImage imageNamed:@"camisa"];
            self.lblBlusao.text =@"Casaco Pesado";
            self.imgCasaco.image = [UIImage imageNamed:@"casaco"];
            self.lblCasaco.text =@"";
            self.lblCalca.text = @"Calca ";
            self.imgcalca.image =[UIImage imageNamed:@"calça"];
            self.lblGorro.text = @"";
            self.lblLuva.text = @"";
           UIImage *fundo=[UIImage imageNamed:@"fundo"];
            self.imgFundo.image = fundo;
        }
    
        else if((temp >15)&&(temp < 25))
        {
            self.lblRoupa.text = @"Camisa Leve";
            self.imgCamisa.image = [UIImage imageNamed:@"camisa"];
            self.imgCasaco.image = [UIImage imageNamed:@"casaco"];
            self.lblBlusao.text = @"Casaco Leve";
            self.lblCalca.text = @"Calca ";
            self.imgcalca.image =[UIImage imageNamed:@"calça"];
            self.lblGorro.text = @"";
            self.lblLuva.text = @"";
            UIImage *fundo=[UIImage imageNamed:@"fundoOutono"];
            self.imgFundo.image = fundo;
            
        }
    
        else if(temp >25)
        {
            self.lblRoupa.text = @"Regata";
            self.imgCamisa.image = [UIImage imageNamed:@"regata"];
            self.imgCasaco.image = [UIImage imageNamed:@"bermuda"];
            self.lblCasaco.text =@"Bermuda";
            UIImage *fundo=[UIImage imageNamed:@"fundoverao"];
            self.imgFundo.image = fundo;
            
            
        }
    
  }

    


-(void)getLocations
{
    
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLHeadingFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    NSLog(@"%f Latitude",self.latitude);
    NSLog(@"%flongitude",self.longitude);
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error");
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [[CLLocation alloc]init];
    location = [locations lastObject];
    ALIJSON *getlat = [[ALIJSON alloc]init];
    self.latitude = location.coordinate.latitude;
    self.longitude = location.coordinate.longitude;
    getlat.latitude = self.latitude;
    getlat.longitude = self.longitude;
    NSLog(@"%f Latitude",self.latitude);
    NSLog(@"%flongitude",self.longitude);
    
    NSError *error;
    NSString *str = [NSString stringWithFormat:@"https://api.forecast.io/forecast/2f1c35dd930d9bc505e6399e60f3e4a7/%f,%f",self.latitude,self.longitude];
    NSURL *url =[NSURL URLWithString:str];
    NSData *dataJson = [NSData dataWithContentsOfURL:url];
    getlat.getJson = [NSJSONSerialization JSONObjectWithData:dataJson options:kNilOptions error:&error];
    getlat.getTemp = [getlat.getJson valueForKey:@"currently"];
    getlat.strTemp = [[[getlat.getJson valueForKey:@"currently"]valueForKey:@"temperature"]floatValue ];
    getlat.windVelocity = [[[getlat.getJson valueForKey:@"currently"]valueForKey:@"windSpeed"] floatValue];
    getlat.celsiusTemp = ((getlat.strTemp -32)/1.8);
    getlat.sensTerm =( 33 +(10 *sqrt(getlat.windVelocity)+ 10.45 - getlat.windVelocity)*((getlat.celsiusTemp - 33)/22));
    NSLog(@"%2.f",getlat.windVelocity);
    NSLog(@"TEMPERATURA %.2f",getlat.sensTerm);
    NSLog(@"%f LATITUDE",getlat.latitude);
    celsius = getlat.sensTerm;
    grauReal = getlat.celsiusTemp;
    if (celsius != 0)
    {
        [self.actSensTerm stopAnimating];
        [self.actTempo stopAnimating];
        [self.actTempo setHidden:YES];
        [self.actSensTerm setHidden:YES];
    }
    [self fillLabels];
  
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
