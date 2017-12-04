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
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

@implementation ViewController

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
        // Get user value
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
        // Get user value
        NSString *user= snapshot.value[@"password"];
        password.text = [NSString stringWithFormat:@"%@", user];
        
        // ...
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}



@end
