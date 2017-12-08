//
//  AvailabilityViewController.m
//  CoverMe
//
//  Created by Julie Rosenbaum on 12/7/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "AvailabilityViewController.h"
#import "EmployeeViewController.h"
#import "EmployerVC.h"
@import Firebase;

@interface AvailabilityViewController ()
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

@implementation AvailabilityViewController
- (IBAction)submitPushed:(id)sender {
    
    //collect switch information a week array, where each day holds its 3 shifts
    [self.model.weekAvailability insertObject: [NSArray arrayWithObjects:@(_Open0.isOn), @(_Noon0.isOn), @(_Close0.isOn),nil] atIndex:0];
    [self.model.weekAvailability insertObject: [NSArray arrayWithObjects:@(_Open1.isOn), @(_Noon1.isOn), @(_Close1.isOn),nil] atIndex:1];
    [self.model.weekAvailability insertObject: [NSArray arrayWithObjects:@(_Open2.isOn), @(_Noon0.isOn), @(_Close2.isOn),nil] atIndex:2];
    [self.model.weekAvailability insertObject: [NSArray arrayWithObjects:@(_Open3.isOn), @(_Noon3.isOn), @(_Close3.isOn),nil] atIndex:3];
    [self.model.weekAvailability insertObject: [NSArray arrayWithObjects:@(_Open4.isOn), @(_Noon4.isOn), @(_Close4.isOn),nil] atIndex:4];
    [self.model.weekAvailability insertObject: [NSArray arrayWithObjects:@(_Open5.isOn), @(_Noon5.isOn), @(_Close5.isOn),nil] atIndex:5];
    [self.model.weekAvailability insertObject: [NSArray arrayWithObjects:@(_Open6.isOn), @(_Noon6.isOn), @(_Close6.isOn),nil] atIndex:6];
//    NSLog(@"monday bool in avail page = %d", _Open0.isOn);
//    NSLog(@"monday book w parentheses = %@", @(_Open0.isOn));
    
    //add to weekday under self.model.username's availability database
    _ref = [[FIRDatabase database] reference];
    FIRDatabaseReference *refAvailCalendar = [[[[[FIRDatabase database] reference]
                                                child:@"users"]
                                               child:self.model.username]
                                              child:@"avail"];
    
    
    //update this user's availabilty selections in firebase
    for (int i = 0; i < 7; i++)
    {
        NSString *day = [NSString stringWithFormat:@"%d",i];
        bool openswitch = [[self.model.weekAvailability objectAtIndex:i] objectAtIndex:0];
        bool noonswitch = [[self.model.weekAvailability objectAtIndex:i] objectAtIndex:1];
        bool closeswitch = [[self.model.weekAvailability objectAtIndex:i] objectAtIndex:2];
        
        FIRDatabaseReference *refOpen = [[refAvailCalendar child:day] child:@"0"];
        FIRDatabaseReference *refNoon = [[refAvailCalendar child:day] child:@"1"];
        FIRDatabaseReference *refClose = [[refAvailCalendar child:day] child:@"2"];
        
        [refOpen observeSingleEventOfType:FIRDataEventTypeValue
                                withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
         {
             //in firebase, set user > avail > day > open to whatever the value of the switch is
             
//             NSLog(@"Avail switch after updating array = %d",openswitch);
         }
         ];
        [refNoon observeSingleEventOfType:FIRDataEventTypeValue
                                withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
         {
             //in firebase, set user > avail > day > noon to whatever the value of the switch is
         }
         ];
        [refClose observeSingleEventOfType:FIRDataEventTypeValue
                                 withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
         {
             //in firebase, set user > avail > day > close to whatever the value of the switch is
         }
         ];
    }
    
    //send back to welcome page
    [self performSegueWithIdentifier:@"toEmployeeViewController" sender:sender];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
        employeeVC.model.weekAvailability = self.model.weekAvailability;
    }
}
@end
