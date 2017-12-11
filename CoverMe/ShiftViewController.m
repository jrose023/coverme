//
//  ShiftViewController.m
//  CoverMe
//
//  Created by Julie Rosenbaum on 12/11/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "ShiftViewController.h"
#import "EmployeeViewController.h"
@import Firebase;

@interface ShiftViewController ()
@property (strong, nonatomic) FIRDatabaseReference *ref;


@property (weak, nonatomic) IBOutlet UISwitch *Open0;
@property (weak, nonatomic) IBOutlet UISwitch *Noon0;
@property (weak, nonatomic) IBOutlet UISwitch *Close0;

@property (weak, nonatomic) IBOutlet UISwitch *Open1;
@property (weak, nonatomic) IBOutlet UISwitch *Noon1;
@property (weak, nonatomic) IBOutlet UISwitch *Close1;

@property (weak, nonatomic) IBOutlet UISwitch *Open2;
@property (weak, nonatomic) IBOutlet UISwitch *Noon2;
@property (weak, nonatomic) IBOutlet UISwitch *Close2;

@property (weak, nonatomic) IBOutlet UISwitch *Open3;
@property (weak, nonatomic) IBOutlet UISwitch *Noon3;
@property (weak, nonatomic) IBOutlet UISwitch *Close3;

@property (weak, nonatomic) IBOutlet UISwitch *Open4;
@property (weak, nonatomic) IBOutlet UISwitch *Noon4;
@property (weak, nonatomic) IBOutlet UISwitch *Close4;

@property (weak, nonatomic) IBOutlet UISwitch *Open5;
@property (weak, nonatomic) IBOutlet UISwitch *Noon5;
@property (weak, nonatomic) IBOutlet UISwitch *Close5;

@property (weak, nonatomic) IBOutlet UISwitch *Open6;
@property (weak, nonatomic) IBOutlet UISwitch *Noon6;
@property (weak, nonatomic) IBOutlet UISwitch *Close6;
@end

@implementation ShiftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _ref = [[FIRDatabase database] reference];
    
    
    // a cute idea, but were gonna have to hardcode all 21 so nvm
//    for (int i = 0; i < 7; i++)
//    {
//        NSString *dayIndex = [NSString stringWithFormat:@"%d", i];
//
//        FIRDatabaseReference *refEmployeeOpen = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:dayIndex] child: @"0"];
//
//        FIRDatabaseReference *refEmployeeNoon = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:dayIndex] child: @"1"];
//
//        FIRDatabaseReference *refEmployeeClose = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:dayIndex] child: @"2"];
//
//        [refEmployeeOpen observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
//            if(snapshot.exists){
//                bool avail = [snapshot.value boolValue];
//                [self setUISwitch:employeeNum time:i availability:avail];
//            }
//        }];
//
//    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"toEmployeeViewController"])
    {
        EmployeeViewController *employeeVC = segue.destinationViewController;
        employeeVC.model = self.model;
    }
    
}

@end
