//
//  SignInViewController.m
//  CoverMe
//
//  Created by Nathan Grimshaw on 11/12/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "SignInViewController.h"
#import "EmployeeViewController.h"
#import "EmployerVC.h"
@import Firebase;

@interface SignInViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (nonatomic) ModelClass *model;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

@implementation SignInViewController

bool isAdmin;
bool isExists;
int counter=0;
bool userNameCorrect;

- (IBAction)pushedSignIn:(id)sender {
    NSString *usernameEntered =[self.username text];
    NSString *passwordEntered=[self.password text];
    
    //Check if the there is a user that exist with the username entered
    //search firebse "users" database for the usernameEntered
    _ref = [[FIRDatabase database] reference];
    
    //check if anything was entered in username and password
    if ([usernameEntered length] == 0 || [passwordEntered length] == 0){
        return;
    }
    
    //check if username exists
    FIRDatabaseReference *refUniqUsername = [[[[FIRDatabase database] reference]
                                              child:@"users"] child:usernameEntered];
    [refUniqUsername observeSingleEventOfType:FIRDataEventTypeValue
                                    withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
     {
         counter++;
         userNameCorrect = snapshot.exists;
     }];
    if(!userNameCorrect){
        NSLog(@"No such user name in database");
        return;
    }
    
    //search firebase "users" database to validate password given the usernameEntered
    FIRDatabaseReference *refUniqPassword = [[[[[FIRDatabase database] reference]
                                               child:@"users"]
                                              child:usernameEntered]
                                             child:@"password"];
    [refUniqPassword observeSingleEventOfType:FIRDataEventTypeValue
                                    withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
     {
         counter++;
         NSString *password= snapshot.value;
         isExists = [password isEqualToString:passwordEntered];
     }];
    if(!isExists){
        NSLog(@"The password is incorrect");
        return;
    }
    
    //check if admin
    FIRDatabaseReference *refAdminBool = [[[[[FIRDatabase database] reference]
                                            child:@"users"]
                                           child:usernameEntered]
                                          child:@"admin"];
    
    
    [refAdminBool observeSingleEventOfType:FIRDataEventTypeValue
                                 withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
     {
         counter++;
         id adminVal = snapshot.value;
         isAdmin = [snapshot.value boolValue];
         //NSLog(@"%@",adminVal);
         //isAdmin = (adminVal == @"1");
         NSLog(isAdmin ? @"Yes" : @"No");
     }];
        
        
    if(counter > 3){
        counter=0;

            //keep track of the name on all pages.
            self.model = [ModelClass new];
            self.model.username = usernameEntered;
            
        
        /*
            //pull up their availability calendar,
            FIRDatabaseReference *refAvailCalendar = [[[[[FIRDatabase database] reference]
                                                child:@"users"]
                                               child:self.model.username]
                                              child:@"avail"];
        
        
            //put the availability information in the 2D array, stored in the model delegate
            self.model.weekAvailability = [NSMutableArray new];
            for (int i = 0; i < 7; i++)
            {
                NSString *day = [NSString stringWithFormat:@"%d",i];
//                NSLog(@"day = %@", day);
                FIRDatabaseReference *refOpen = [[refAvailCalendar child:day] child:@"0"];
                FIRDatabaseReference *refNoon = [[refAvailCalendar child:day] child:@"1"];
                FIRDatabaseReference *refClose = [[refAvailCalendar child:day] child:@"2"];
                
                __block bool availableForOpen = false;
                __block bool availableForNoon =false;
                __block bool availableForClose = false;
                
                [refOpen observeSingleEventOfType:FIRDataEventTypeValue
                                        withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
                 {
                     availableForOpen =[snapshot.value boolValue];
                     NSLog(@"available for open = %d, with parentheses = %@", availableForOpen, @(availableForOpen));
                 }
                 ];
                [refNoon observeSingleEventOfType:FIRDataEventTypeValue
                                        withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
                 {
                      availableForNoon = [snapshot.value boolValue];
                 }
                 ];
                [refClose observeSingleEventOfType:FIRDataEventTypeValue
                                         withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
                 {
                      availableForClose = [snapshot.value boolValue];
                 }
                 ];
     
                
                //update model week availability
                NSMutableArray *avails = [NSMutableArray new];
                [avails insertObject:@(availableForOpen) atIndex:0];
                [avails insertObject:@(availableForNoon) atIndex:1];
                [avails insertObject:@(availableForClose) atIndex:2];
//                NSLog(@"object in avals = %@", [avails objectAtIndex:0]);
                
                
                [self.model.weekAvailability insertObject: avails atIndex:i];
                
                

            }//end for loop
         */

//            NSLog(@"available from array = %@", [[self.model.weekAvailability objectAtIndex:0] objectAtIndex:0]);
//            NSLog(@"available from array = %@", [[self.model.weekAvailability objectAtIndex:1] objectAtIndex:0]);

            if(isAdmin) [self performSegueWithIdentifier:@"toEmployerViewController" sender:sender];
            
            else [self performSegueWithIdentifier:@"toEmployeeViewController" sender:sender];
    }
    

}//end pushedSignIn



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toEmployeeViewController"])
    {
        EmployeeViewController *employeeVC = segue.destinationViewController;
        employeeVC.model = self.model;

    }
    else if([[segue identifier] isEqualToString:@"toEmployerViewController"])
    {
        EmployerVC *employerVC = segue.destinationViewController;
        employerVC.model = self.model;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //populating email and password textfield for testing
    //self.email.text = @"tlc383@nyu.edu";
    //self.password.text = @"123444";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

