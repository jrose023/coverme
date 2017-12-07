//
//  AvailabilityViewController.m
//  CoverMe
//
//  Created by Julie Rosenbaum on 12/7/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "AvailabilityViewController.h"

@interface AvailabilityViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *MoOpen;
@property (weak, nonatomic) IBOutlet UISwitch *MoNoon;
@property (weak, nonatomic) IBOutlet UISwitch *MoClose;
@property (weak, nonatomic) IBOutlet UISwitch *TuOpen;
@property (weak, nonatomic) IBOutlet UISwitch *TuNoon;
@property (weak, nonatomic) IBOutlet UISwitch *TuClose;
@property (weak, nonatomic) IBOutlet UISwitch *WeOpen;
@property (weak, nonatomic) IBOutlet UISwitch *WeNoon;
@property (weak, nonatomic) IBOutlet UISwitch *WeClose;
@property (weak, nonatomic) IBOutlet UISwitch *ThOpen;
@property (weak, nonatomic) IBOutlet UISwitch *ThNoon;
@property (weak, nonatomic) IBOutlet UISwitch *ThClose;
@property (weak, nonatomic) IBOutlet UISwitch *FrOpen;
@property (weak, nonatomic) IBOutlet UISwitch *FrNoon;
@property (weak, nonatomic) IBOutlet UISwitch *FrClose;
@property (weak, nonatomic) IBOutlet UISwitch *SaOpen;
@property (weak, nonatomic) IBOutlet UISwitch *SaNoon;
@property (weak, nonatomic) IBOutlet UISwitch *SaClose;
@property (weak, nonatomic) IBOutlet UISwitch *SuOpen;
@property (weak, nonatomic) IBOutlet UISwitch *SuNoon;
@property (weak, nonatomic) IBOutlet UISwitch *SuClose;

@end

@implementation AvailabilityViewController
- (IBAction)submitPushed:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
