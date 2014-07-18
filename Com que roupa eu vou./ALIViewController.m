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
#import "FBShimmering.h"
#import "FBShimmeringView.h"

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
    [self parallax];


    
}
-(void)shadow
{
    NSMutableAttributedString *attstring = [[NSMutableAttributedString alloc]initWithString:self.lblTemp.text];
    NSMutableAttributedString *attstring1 = [[NSMutableAttributedString alloc]initWithString:self.lblSensTerm.text];
    NSMutableAttributedString *attstring2 = [[NSMutableAttributedString alloc]initWithString:self.lblRoupa.text];
    NSMutableAttributedString *attstring3 = [[NSMutableAttributedString alloc]initWithString:self.lblLuva.text];
    NSMutableAttributedString *attstring4 = [[NSMutableAttributedString alloc]initWithString:self.lblGorro.text];
    NSMutableAttributedString *attstring5 = [[NSMutableAttributedString alloc]initWithString:self.lblCidade.text];
    NSMutableAttributedString *attstring6 = [[NSMutableAttributedString alloc]initWithString:self.lblCasaco.text];
    NSMutableAttributedString *attstring7 = [[NSMutableAttributedString alloc]initWithString:self.lblCalca.text];
    NSMutableAttributedString *attstring8 = [[NSMutableAttributedString alloc]initWithString:self.lblBlusao.text];
    NSMutableAttributedString *attstring9 = [[NSMutableAttributedString alloc]initWithString:self.lblSensacao.text];
    NSMutableAttributedString *attstring10 = [[NSMutableAttributedString alloc]initWithString:self.grau1.text];
    NSMutableAttributedString *attstring11 = [[NSMutableAttributedString alloc]initWithString:self.grau2.text];
    NSRange range = NSMakeRange(0, [attstring length]);
    NSRange range1 = NSMakeRange(0, [attstring1 length]);
    NSRange range2 = NSMakeRange(0, [attstring2 length]);
    NSRange range3 = NSMakeRange(0, [attstring3 length]);
    NSRange range4 = NSMakeRange(0, [attstring4 length]);
    NSRange range5 = NSMakeRange(0, [attstring5 length]);
    NSRange range6 = NSMakeRange(0, [attstring6 length]);
    NSRange range7 = NSMakeRange(0, [attstring7 length]);
    NSRange range8 = NSMakeRange(0, [attstring8 length]);
    NSRange range9 = NSMakeRange(0, [attstring9 length]);
    NSRange range10 = NSMakeRange(0, [attstring10 length]);
    NSRange range11 = NSMakeRange(0, [attstring11 length]);
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowOffset = CGSizeMake(0.0f, 1.0f);
    
    [attstring addAttribute:NSShadowAttributeName value:shadow range:range];
    [attstring1 addAttribute:NSShadowAttributeName value:shadow range:range];
    [attstring2 addAttribute:NSShadowAttributeName value:shadow range:range2];
  [attstring3 addAttribute:NSShadowAttributeName value:shadow range:range2];
//    [attstring4 addAttribute:NSShadowAttributeName value:shadow range:range];
//    [attstring5 addAttribute:NSShadowAttributeName value:shadow range:range];
//    [attstring6 addAttribute:NSShadowAttributeName value:shadow range:range];
//    [attstring7 addAttribute:NSShadowAttributeName value:shadow range:range];
//    [attstring8 addAttribute:NSShadowAttributeName value:shadow range:range];
//    [attstring9 addAttribute:NSShadowAttributeName value:shadow range:range];
//    [attstring10 addAttribute:NSShadowAttributeName value:shadow range:range];
//    [attstring11 addAttribute:NSShadowAttributeName value:shadow range:range];
    
    self.lblTemp.attributedText = attstring;
    self.lblSensTerm.attributedText = attstring1;
    self.lblRoupa.attributedText = attstring2;
    self.lblLuva.attributedText = attstring3;
    self.lblGorro.attributedText = attstring4;
    self.lblCidade.attributedText = attstring5;
    self.lblCasaco.attributedText = attstring6;
    self.lblCalca.attributedText = attstring7;
    self.lblBlusao.attributedText = attstring8;
    self.lblSensacao.attributedText = attstring9;
    self.grau1.attributedText = attstring10;
    self.grau2.attributedText = attstring11;
}




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
    UILocalNotification *locationNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (locationNotification) {

        application.applicationIconBadgeNumber = 0;
    }
    
    return YES;
}


-(void)parallax
{
    UIInterpolatingMotionEffect *verticalMorionEffect = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMorionEffect.maximumRelativeValue=@(-10);
    verticalMorionEffect.minimumRelativeValue=@(-10);
    UIInterpolatingMotionEffect *horizontalMorionEffect = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMorionEffect.maximumRelativeValue=@(-30);
    horizontalMorionEffect.minimumRelativeValue=@(-30);
    
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[verticalMorionEffect];
    [self.view addMotionEffect:group];
//    [self.imgcalca addMotionEffect:group];
//    [self.imgCamisa addMotionEffect:group];
//    [self.imgCasaco addMotionEffect:group];
//    [self.imgExtra addMotionEffect:group];
//    [self.imgGorro addMotionEffect:group];
//        [self.imgBolinha addMotionEffect:group];
//        [self.lblBlusao addMotionEffect:group];
//    [self.lblCalca addMotionEffect:group];
//    [self.lblCasaco addMotionEffect:group];
//    [self.lblGorro addMotionEffect:group];
//    [self.lblLuva addMotionEffect:group];
//    [self.lblRoupa addMotionEffect:group];

    
    
    
    
    
}

-(void)fillLabels
{
    FBShimmeringView *shameringView = [[FBShimmeringView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x /2 + 156 /2 ,self.lblCidade.frame.size.height, 217, 142)];
    
    
        self.lblTemp.text = [NSString stringWithFormat:@"%.1f",grauReal];
        [self.view addSubview:shameringView];
        shameringView.contentView = self.lblTemp;
        shameringView.shimmering = YES;

  
    
        self.lblSensTerm.text = [NSString stringWithFormat:@"%.1f",celsius];
        float temp = celsius;
        [self shadow];
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
            UIImage *fundo=[UIImage imageNamed:@"fundo"];
            self.imgFundo.image = fundo;
         
            
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
            self.lblCalca.text = @"Regata";
            self.imgcalca.image = [UIImage imageNamed:@"regata"];
            self.imgCasaco.image = [UIImage imageNamed:@"bermuda"];
            self.lblBlusao.text =@"Bermuda";
            UIImage *fundo=[UIImage imageNamed:@"fundoVerao"];
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
    [getlat jsonFoursquare:self.latitude andLong:self.longitude];
    NSLog(@"%f Latitude",self.latitude);
    NSLog(@"%flongitude",self.longitude);
    
    
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
        [self.locationManager stopUpdatingLocation];
    }
    [self fillLabels];
        
    
  
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
