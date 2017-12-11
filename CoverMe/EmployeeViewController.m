//
//  EmployeeViewController.m
//  CoverMe
//
//  Created by Julie Rosenbaum on 11/21/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "EmployeeViewController.h"
#import "AvailabilityViewController.h"
#import "SwipeViewController.h"
#import "ModelClass.h"
@import Firebase;

@interface EmployeeViewController ()

@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

@implementation EmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
//    //populate current availability from firebase into weekly availability
//    self.model.weekAvailability = [NSMutableArray arrayWithCapacity:7];
//    for (int i = 0; i < 7; i++)
//    {
//        NSMutableArray *temp = [NSMutableArray new];
//        __block bool avail = true;
//        [self.model.weekAvailability insertObject:temp atIndex:i];
//
//        for(int j =0; j < 3; j ++){
//            NSString *dayIndex = [NSString stringWithFormat:@"%d", i];
//            NSString *timeIndex = [NSString stringWithFormat:@"%d", j];
//
//            FIRDatabaseReference *refEmployee = [[[[[_ref child:@"users"] child:self.model.username] child:@"avail"] child:dayIndex] child: timeIndex];
//            [refEmployee observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
//
//                avail = [snapshot.value boolValue];
//
//            }];
//            [temp insertObject:@(avail) atIndex:j];
//            //            NSLog(@"temp at %d = %@", j, [temp objectAtIndex:j]);
//
//        }
//        //        NSLog(@"%d, %d, %d", [temp objectAtIndex:0],[temp objectAtIndex:1], [temp objectAtIndex:2]);
//        [self.model.weekAvailability insertObject:temp atIndex:i];
//
//    }
//
//    for (int i = 0; i < 7; i++)
//    {
//        for(int j =0; j < 3; j ++){
//            NSLog(@"in emp %@", [[self.model.weekAvailability objectAtIndex:i] objectAtIndex:j]);
//        }
//    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toAvailabilityViewController"])
    {
        AvailabilityViewController *availVC = segue.destinationViewController;
        availVC.model = self.model;
    }
    if ([[segue identifier] isEqualToString:@"toSwipeViewController"])
    {
        SwipeViewController *swipeVC = segue.destinationViewController;
        swipeVC.model = self.model;
    }
}

@end
