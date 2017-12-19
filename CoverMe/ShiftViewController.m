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

@property (weak, nonatomic) IBOutlet UISwitch *open0;
@property (weak, nonatomic) IBOutlet UISwitch *noon0;
@property (weak, nonatomic) IBOutlet UISwitch *close0;

@property (weak, nonatomic) IBOutlet UISwitch *open1;
@property (weak, nonatomic) IBOutlet UISwitch *noon1;

@property (weak, nonatomic) IBOutlet UISwitch *close1;
@property (weak, nonatomic) IBOutlet UISwitch *open2;
@property (weak, nonatomic) IBOutlet UISwitch *noon2;
@property (weak, nonatomic) IBOutlet UISwitch *close2;
@property (weak, nonatomic) IBOutlet UISwitch *open3;
@property (weak, nonatomic) IBOutlet UISwitch *noon3;
@property (weak, nonatomic) IBOutlet UISwitch *close3;
@property (weak, nonatomic) IBOutlet UISwitch *open4;
@property (weak, nonatomic) IBOutlet UISwitch *noon4;
@property (weak, nonatomic) IBOutlet UISwitch *close4;
@property (weak, nonatomic) IBOutlet UISwitch *open5;
@property (weak, nonatomic) IBOutlet UISwitch *noon5;
@property (weak, nonatomic) IBOutlet UISwitch *close5;
@property (weak, nonatomic) IBOutlet UISwitch *open6;
@property (weak, nonatomic) IBOutlet UISwitch *noon6;
@property (weak, nonatomic) IBOutlet UISwitch *close6;

@end

@implementation ShiftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _ref = [[FIRDatabase database] reference];
    
    FIRDatabaseReference *refEmployeeOpen0 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"0"] child: @"0"];
    [refEmployeeOpen0 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
            [_open0 setOn:[snapshot.value boolValue]];
        }];
    [_open0 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeNoon0 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"0"] child: @"1"];
    [refEmployeeNoon0 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_noon0 setOn:[snapshot.value boolValue]];
    }];
    [_noon0 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeClose0 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"0"] child: @"2"];
    [refEmployeeClose0 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_close0 setOn:[snapshot.value boolValue]];
    }];
    //[_close0 setOn:refEmployeeClose0];
    [_close0 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeOpen1 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"1"] child: @"0"];
    [refEmployeeOpen1 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_open1 setOn:[snapshot.value boolValue]];
    }];
    //[_open1 setOn:refEmployeeOpen1];
    [_open1 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeNoon1 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"1"] child: @"1"];
    [refEmployeeNoon1 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_noon1 setOn:[snapshot.value boolValue]];
    }];
    //[_noon1 setOn:refEmployeeNoon1];
    [_noon1 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeClose1 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"1"] child: @"2"];
    [refEmployeeClose1 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_close1 setOn:[snapshot.value boolValue]];
    }];
    //[_close1 setOn:refEmployeeClose1];
    [_close1 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeOpen2 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"2"] child: @"0"];
    [refEmployeeOpen2 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_open2 setOn:[snapshot.value boolValue]];
    }];
    //[_open2 setOn:refEmployeeOpen2];
    [_open2 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeNoon2 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"2"] child: @"1"];
    [refEmployeeNoon2 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_noon2 setOn:[snapshot.value boolValue]];
    }];
    //[_noon2 setOn:refEmployeeNoon2];
    [_noon2 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeClose2 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"2"] child: @"2"];
    [refEmployeeClose2 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_close2 setOn:[snapshot.value boolValue]];
    }];
    //[_close2 setOn:refEmployeeClose2];
    [_close2 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeOpen3 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"3"] child: @"0"];
    [refEmployeeOpen3 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_open3 setOn:[snapshot.value boolValue]];
    }];
    //[_open3 setOn:refEmployeeOpen3];
    [_open3 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeNoon3 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"3"] child: @"1"];
    [refEmployeeNoon3 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_noon3 setOn:[snapshot.value boolValue]];
    }];
    //[_noon3 setOn:refEmployeeNoon3];
    [_noon3 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeClose3 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"3"] child: @"2"];
    [refEmployeeClose3 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_close3 setOn:[snapshot.value boolValue]];
    }];
    //[_close3 setOn:refEmployeeClose3];
    [_close3 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeOpen4 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"4"] child: @"0"];
    [refEmployeeOpen4 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_open4 setOn:[snapshot.value boolValue]];
    }];
    //[_open4 setOn:refEmployeeOpen4];
    [_open4 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeNoon4 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"4"] child: @"1"];
    [refEmployeeNoon4 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_noon4 setOn:[snapshot.value boolValue]];
    }];
    //[_noon4 setOn:refEmployeeNoon4];
    [_noon4 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeClose4 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"4"] child: @"2"];
    [refEmployeeClose4 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_close4 setOn:[snapshot.value boolValue]];
    }];
    //[_close4 setOn:refEmployeeClose4];
    [_close4 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeOpen5 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"5"] child: @"0"];
    [refEmployeeOpen5 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_open5 setOn:[snapshot.value boolValue]];
    }];
    //[_open5 setOn:refEmployeeOpen5];
    [_open5 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeNoon5 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"5"] child: @"1"];
    [refEmployeeNoon5 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_noon5 setOn:[snapshot.value boolValue]];
    }];
    //[_noon5 setOn:refEmployeeNoon5];
    [_noon5 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeClose5 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"5"] child: @"2"];
    [refEmployeeClose5 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_close5 setOn:[snapshot.value boolValue]];
    }];
    //[_close5 setOn:refEmployeeClose5];
    [_close5 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeOpen6 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"6"] child: @"0"];
    [refEmployeeOpen6 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_open6 setOn:[snapshot.value boolValue]];
    }];
    //[_open6 setOn:refEmployeeOpen6];
    [_open6 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeNoon6 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"6"] child: @"1"];
    [refEmployeeNoon6 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_noon6 setOn:[snapshot.value boolValue]];
    }];
    //[_noon6 setOn:refEmployeeNoon6];
    [_noon6 setUserInteractionEnabled:NO];
    
    FIRDatabaseReference *refEmployeeClose6 = [[[[[_ref child:@"users"] child:self.model.username] child:@"shift"] child:@"6"] child: @"2"];
    [refEmployeeClose6 observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [_close6 setOn:[snapshot.value boolValue]];
    }];
    //[_close6 setOn:refEmployeeClose6];
    [_close6 setUserInteractionEnabled:NO];
    
    
    
    
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
