//
//  EmployerVC.m
//  CoverMe
//
//  Created by nyuguest on 12/4/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "EmployerVC.h"
#import "SchedulePageViewController.h"

@interface EmployerVC ()

@end

@implementation EmployerVC

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
    if ([[segue identifier] isEqualToString:@"toSetScheduleViewController"])
    {
        SchedulePageViewController *scheduleVC = segue.destinationViewController;
        scheduleVC.model = self.model;
    }
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
