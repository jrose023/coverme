//
//  EmployeeViewController.m
//  CoverMe
//
//  Created by Julie Rosenbaum on 11/21/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "EmployeeViewController.h"
#import "AvailabilityViewController.h"
#import "SignInViewController.h"
#import "ModelClass.h"

@interface EmployeeViewController ()

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
- (void)viewDidAppear:(BOOL)animated{
    bool openswitch = [[self.model.weekAvailability objectAtIndex:0] objectAtIndex:0];
    NSLog(@"M Employeeview avail switch = %d",openswitch);
    bool openswitch2 = [[self.model.weekAvailability objectAtIndex:1] objectAtIndex:0];
    NSLog(@"T Employeeview avail switch = %d",openswitch2);
    bool openswitch3 = [[self.model.weekAvailability objectAtIndex:2] objectAtIndex:0];
    NSLog(@"W Employeeview avail switch = %d",openswitch3);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toAvailabilityViewController"])
    {
        AvailabilityViewController *availVC = segue.destinationViewController;
        availVC.model = self.model;
    }
}

@end
