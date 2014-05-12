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

@interface ALIViewController ()

@end

@implementation ALIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fillLabels];
    
}

-(void)fillLabels
{
   
    ALIJSON *getJSON = [[ALIJSON alloc]init];\
    [getJSON getLocations];
    [getJSON jsonFoursquare];
    self.lblTemp.text = [NSString stringWithFormat:@"%.1f",getJSON.celsiusTemp];
    self.lblSensTerm.text = [NSString stringWithFormat:@"%.1f",getJSON.sensTerm];
    float temp = getJSON.sensTerm;
    if (temp <0) {
        self.lblRoupa.text = @"UnderWear ou segunda pele";
        self.lblBlusao.text =@"Fleece";
        self.lblCasaco.text =@"Casaco Impermeável ou corta vento";
        self.lblCalca.text = @"Calca Impermeável";
        self.lblGorro.text = @"Gorro";
        self.lblLuva.text = @"Luva";
        
    }
    else if(temp >0)
    {
        self.lblRoupa.text = @"Camiseta";
        self.lblBlusao.text =@"Casaco Leve";
        self.lblCasaco.text =@"";
        self.lblCalca.text = @"Calca Jeans ou Bermuda";
        self.lblGorro.text = @"";
        self.lblLuva.text = @"";
    }
    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
