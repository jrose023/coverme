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
    //add to weekday under self.model.username's availability database
    [self.model.weekAvailability insertObject: [NSMutableArray arrayWithObjects:@([self.Open0 isOn]), @([self.Noon0 isOn]), @([self.Close0 isOn]),nil] atIndex:0];
    [self.model.weekAvailability insertObject: [NSMutableArray arrayWithObjects:@(_Open1.isOn), @(_Noon1.isOn), @(_Close1.isOn),nil] atIndex:1];
    [self.model.weekAvailability insertObject: [NSMutableArray arrayWithObjects:@(_Open2.isOn), @(_Noon0.isOn), @(_Close2.isOn),nil] atIndex:2];
    [self.model.weekAvailability insertObject: [NSMutableArray arrayWithObjects:@(_Open3.isOn), @(_Noon3.isOn), @(_Close3.isOn),nil] atIndex:3];
    [self.model.weekAvailability insertObject: [NSMutableArray arrayWithObjects:@(_Open4.isOn), @(_Noon4.isOn), @(_Close4.isOn),nil] atIndex:4];
    [self.model.weekAvailability insertObject: [NSMutableArray arrayWithObjects:@(_Open5.isOn), @(_Noon5.isOn), @(_Close5.isOn),nil] atIndex:5];
    [self.model.weekAvailability insertObject: [NSMutableArray arrayWithObjects:@(_Open6.isOn), @(_Noon6.isOn), @(_Close6.isOn),nil] atIndex:6];
    
    /*
    NSLog(@"11 %d", [self.Open0 isOn]);//? @"Yes" : @"No");//check
    NSLog(@"22 %d", [self.Noon0 isOn]);//? @"Yes" : @"No");//check
    NSLog(@"33 %d", [self.Close0 isOn]);//? @"Yes" : @"No");//check
    NSLog(@"%@", [[self.model.weekAvailability objectAtIndex:0] objectAtIndex:0]);
    NSLog(@"%@", [[self.model.weekAvailability objectAtIndex:0] objectAtIndex:1]);
    NSLog(@"%@", [[self.model.weekAvailability objectAtIndex:0] objectAtIndex:2]);
     */
    
//    NSLog(@"available for open according to input M = %d", _Open0.isOn);
//    NSLog(@"available for open according to input T = %d", _Open1.isOn);
//
    
    /* HAVING ISSUE HERE!
     * again everything above this point works fine and log statements accurately reflect
     * what is entered by user on with the switches
     *
     * putting it in the self.model.availbilty array is causing issues
     * you apparently cant have an array of booleans which means they need to be wrapped in @()
     * which makes them NSNumbers which is just confusing and thisngs arent outputting correctly
     */
    
    /*
    //update this user's availabilty selections in firebase
    _ref = [[FIRDatabase database] reference];
    FIRDatabaseReference *refAvailCalendar = [[[[[FIRDatabase database] reference]
                                                child:@"users"]
                                               child:self.model.username]
                                              child:@"avail"];
     */
    /* Theo testing values.
    FIRDatabaseReference *refFireBaseTest =[[refAvailCalendar child:@"0"] child:@"0"];
    [refFireBaseTest observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSLog(@"Attention: %@", snapshot.value);
    }];
    FIRDatabaseReference *refFireBaseTest1 =[[refAvailCalendar child:@"0"] child:@"1"];
    [refFireBaseTest1 observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSLog(@"Attention: %@", snapshot.value);
    }];
    [[[[[[_ref child:@"users"] child:self.model.username] child:@"avail"] child:@"0"] child:@"1"] setValue:@"1"];
    [refFireBaseTest1 observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSLog(@"Attention: %@", snapshot.value);
    }];
    */
    _ref = [[FIRDatabase database] reference];
    
    for (int i = 0; i < 7; i++)
    {
        NSString *day = [NSString stringWithFormat:@"%d",i];
        for (int j = 0; j < 3; j ++){
            NSString *time = [NSString stringWithFormat:@"%d",j];
            NSString *availBoolString = [[self.model.weekAvailability objectAtIndex:i] objectAtIndex:j];
            [[[[[[_ref child:@"users"] child:self.model.username] child:@"avail"] child:day] child:time] setValue:availBoolString];
            //NSLog(@"i: %d, j: %d", i, j);
            //NSLog(@"%@", availBoolString)
        }
        
        /*
        bool availableForOpen = [[self.model.weekAvailability objectAtIndex:i] objectAtIndex:0];
        bool availableForNoon = [[self.model.weekAvailability objectAtIndex:i] objectAtIndex:1];
        bool availableForClose = [[self.model.weekAvailability objectAtIndex:i] objectAtIndex:2];
        
//        NSLog(@"available for open according to Array =%d", availableForOpen);
        FIRDatabaseReference *refOpen = [[refAvailCalendar child:day] child:@"0"];
        FIRDatabaseReference *refNoon = [[refAvailCalendar child:day] child:@"1"];
        FIRDatabaseReference *refClose = [[refAvailCalendar child:day] child:@"2"];
        
        [refOpen observeSingleEventOfType:FIRDataEventTypeValue
                                withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
         {
             //in firebase, set user > avail > day > open to whatever the availability is
             
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
         */
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
    /*
    if ([[segue identifier] isEqualToString:@"toEmployeeViewController"])
    {
        EmployeeViewController *employeeVC = segue.destinationViewController;
        employeeVC.model = self.model;
        employeeVC.model.weekAvailability = self.model.weekAvailability;
    }
     */
}
@end
