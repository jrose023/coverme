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

