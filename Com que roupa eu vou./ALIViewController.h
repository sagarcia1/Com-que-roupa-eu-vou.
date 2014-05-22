//
//  ALIViewController.h
//  Com que roupa eu vou.
//
//  Created by Marcelo Garcia on 08/05/14.
//  Copyright (c) 2014 com.bit4All.comqueroupa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ALIViewController : UIViewController<CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imgFundo;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *actSensTerm;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *actTempo;
@property (strong, nonatomic) IBOutlet UIImageView *imgExtra;
@property (strong, nonatomic) IBOutlet UIImageView *imgCachecol;
@property (strong, nonatomic) IBOutlet UIImageView *imgGorro;
@property (strong, nonatomic) IBOutlet UIImageView *imgCamisa;
@property (strong, nonatomic) IBOutlet UIImageView *imgCasaco;
@property (strong, nonatomic) IBOutlet UIImageView *imgcalca;
@property (weak, nonatomic) IBOutlet UILabel *lblTemp;
@property (weak, nonatomic) IBOutlet UILabel *lblSensTerm;
@property (weak, nonatomic) IBOutlet UILabel *lblRoupa;
@property (weak, nonatomic) IBOutlet UILabel *lblBlusao;
@property (weak, nonatomic) IBOutlet UILabel *lblCasaco;
@property (weak, nonatomic) IBOutlet UILabel *lblCalca;
@property (weak, nonatomic) IBOutlet UILabel *lblGorro;
@property (weak, nonatomic) IBOutlet UILabel *lblLuva;
@property (nonatomic) CLLocationManager *locationManager;
@property float latitude;
@property float longitude;
@property (nonatomic,strong) NSString *str;
@property (strong,nonatomic)CLLocation *location;

-(void)fillLabels;




@end
