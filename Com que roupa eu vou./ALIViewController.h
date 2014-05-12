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
@property (weak, nonatomic) IBOutlet UILabel *lblTemp;
@property (weak, nonatomic) IBOutlet UILabel *lblSensTerm;
@property (weak, nonatomic) IBOutlet UILabel *lblRoupa;
@property (weak, nonatomic) IBOutlet UILabel *lblBlusao;
@property (weak, nonatomic) IBOutlet UILabel *lblCasaco;
@property (weak, nonatomic) IBOutlet UILabel *lblCalca;
@property (weak, nonatomic) IBOutlet UILabel *lblGorro;
@property (weak, nonatomic) IBOutlet UILabel *lblLuva;

-(void)fillLabels;



@end
