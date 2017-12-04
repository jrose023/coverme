//
//  ViewController.m
//  CoverMe
//
//  Created by Nathan Grimshaw on 11/12/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "ViewController.h"
@import Firebase;

@interface ViewController ()

@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

@implementation ViewController
@synthesize email;
@synthesize password;


- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setEmail:(UITextField *)email
{
    _ref = [[FIRDatabase database] reference];
    //email.text = [NSString stringWithFormat:@"hi"];
    [[[_ref child:@"users"] child:@"nrg294"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSLog(@"hi");
        // Get user's username value
        NSString *user= snapshot.value[@"username"];
        email.text = [NSString stringWithFormat:@"%@", user];
        
        // ...
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

-(void) setPassword:(UITextField *)password
{
    _ref = [[FIRDatabase database] reference];
    //email.text = [NSString stringWithFormat:@"hi"];
    [[[_ref child:@"users"] child:@"nrg294"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSLog(@"hi");
        // Get user's password value
        NSString *user= snapshot.value[@"password"];
        password.text = [NSString stringWithFormat:@"%@", user];
        
        // ...
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
   
}

- (IBAction)pushedIt:(id)sender {
    //this checks if the there is a user that exsist with the username nrg294
    _ref = [[FIRDatabase database] reference];
    NSString *username =[email text];
    NSLog(@"the username we are checking is %@", username);
    FIRDatabaseReference *refUniqUsername = [[[[FIRDatabase database] reference]
                                              child:@"users"]
                                             child:username];
    
    [refUniqUsername observeSingleEventOfType:FIRDataEventTypeValue
                                    withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
                                        
                                        bool isExists = snapshot.exists;
                                        NSLog(@"the username does exsist %d", isExists);
                                    }];
    
    FIRDatabaseReference *refUniqPassword = [[[[[FIRDatabase database] reference]
                                               child:@"users"]
                                              child:username]
                                             child:@"password"];
    NSString *givenPassword=[password text];
    [refUniqPassword observeSingleEventOfType:FIRDataEventTypeValue
                                    withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
                                        NSString *password= snapshot.value;
                                        bool isExists = [password isEqualToString:givenPassword];
                                        NSLog(@"checking if the password exsits");
                                        NSLog(@"the password does exsist %d", isExists);
                                    }];
    
   
    
}



@end
