//
//  dayViewController.m
//  CoverMe
//
//  Created by nyuguest on 12/10/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "dayViewController.h"
@import Firebase;

@interface dayViewController ()
@property (weak, nonatomic) IBOutlet UITextField *dayText;
@property (strong, nonatomic) FIRDatabaseReference *ref;

@property (weak, nonatomic) IBOutlet UITextField *employee0;
@property (weak, nonatomic) IBOutlet UITextField *employee1;
@property (weak, nonatomic) IBOutlet UITextField *employee2;

@property (weak, nonatomic) IBOutlet UISwitch *open0;





@end

@implementation dayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dayText.text = self.dayStr;
    //set each button and text field accordingly.
    
    //_ref = [[FIRDatabase database] reference];
    
    FIRDatabaseReference *refEmployer = [[[[[FIRDatabase database] reference]
                                            child:@"users"]
                                           child:self.model.username]
                                          child:@"employees"];

    [refEmployer observeSingleEventOfType:FIRDataEventTypeValue
                                     withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
         {
             for ( FIRDataSnapshot *child in snapshot.children) {
                 NSLog(@"child.key = %@",child.value);
                 NSString *employeeUserName = child.value;
                 
                 FIRDatabaseReference *refEmployee = [[[_ref child:@"users"] child:employeeUserName] child:@"name"];
                 
                 [refEmployee observeSingleEventOfType:FIRDataEventTypeValue
                                             withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
                  {
                      NSLog(@"%@", snapshot.value);
                      self.employee0.text = snapshot.value;
                  }];
                 
             }
         }];
    
    
    //[self.open0 setEnabled:NO];
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
