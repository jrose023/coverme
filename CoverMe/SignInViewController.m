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

@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

@implementation SignInViewController

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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toEmployeeVC"])
    {
        EmployeeViewController *employeeVC = segue.destinationViewController;
        employeeVC.model = self.model;
    }
    else if([[segue identifier] isEqualToString:@"toEmployerVC"])
    {
        EmployerVC *employerVC = segue.destinationViewController;
        employerVC.model = self.model;
    }
}
bool isAdmin;
bool isExists;
int counter=0;
bool userNameCorrect;
- (IBAction)pushedSignIn:(id)sender {
    
    NSString *usernameEntered =[self.username text];
    NSString *passwordEntered=[self.password text];
    //keep track of the name on all pages.
    self.model.username= usernameEntered;
    
    //NSLog(@"checking for username %@", usernameEntered);
    
    //Check if the there is a user that exist with the username entered
    //search firebse "users" database for the usernameEntered
    _ref = [[FIRDatabase database] reference];
    if ([usernameEntered length] >0 && [passwordEntered length] >0){
        
        
        FIRDatabaseReference *refUniqUsername = [[[[FIRDatabase database] reference]
                                                  child:@"users"]
                                                 child:usernameEntered];
        [refUniqUsername observeSingleEventOfType:FIRDataEventTypeValue
                                        withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
         {
             counter++;
             isExists = snapshot.exists;
             userNameCorrect=isExists;
             NSLog(@"hi3");
         }];
        
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
             isExists = isExists && [password isEqualToString:passwordEntered];
             NSLog(@"hi2");
             
             
         }];
        //search firebase to determine whether user is admin or not
        FIRDatabaseReference *refAdminBool = [[[[[FIRDatabase database] reference]
                                                child:@"users"]
                                               child:usernameEntered]
                                              child:@"admin"];
        
        
        [refAdminBool observeSingleEventOfType:FIRDataEventTypeValue
                                     withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
         {
             counter++;
             NSString *admin= snapshot.value;
             isAdmin = [admin isEqualToString:@"TRUE"];
             //NSLog(@"this is the admin log %d, %@",isAdmin, admin);
             NSLog(@"hi1");
             
         }];
    }
    
    if(counter==3){
        counter=0;
        if (!isExists) {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Incorrect Username or Password!"
                                                                           message:@"Please Try Again."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else{
            if(isAdmin) [self performSegueWithIdentifier:@"toEmployerVC" sender:sender];
            else [self performSegueWithIdentifier:@"toEmployeeVC" sender:sender];
            
            
        }
    }
    
}//end pushedSignIn




/*-(void) setEmail:(UITextField *)email
 {
 _ref = [[FIRDatabase database] reference];
 //email.text = [NSString stringWithFormat:@"hi"];
 [[[_ref child:@"users"] child:@"nrg294"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
 // Get user's username value
 NSString *user= snapshot.value[@"username"];
 email.text = [NSString stringWithFormat:@"%@", user];
 
 // ...
 } withCancelBlock:^(NSError * _Nonnull error) {
 NSLog(@"%@", error.localizedDescription);
 }];
 }*/

/*-(void) setPassword:(UITextField *)password
 {
 _ref = [[FIRDatabase database] reference];
 //email.text = [NSString stringWithFormat:@"hi"];
 [[[_ref child:@"users"] child:@"nrg294"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
 // Get user's password value
 NSString *user= snapshot.value[@"password"];
 password.text = [NSString stringWithFormat:@"%@", user];
 
 // ...
 } withCancelBlock:^(NSError * _Nonnull error) {
 NSLog(@"%@", error.localizedDescription);
 }];
 
 }*/


@end

