//
//  dayViewController.m
//  CoverMe
//
//  Created by nyuguest on 12/10/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "dayViewController.h"
#import "EmployerVC.h"
@import Firebase;

@interface dayViewController ()
@property (weak, nonatomic) IBOutlet UITextField *dayText;
@property (strong, nonatomic) FIRDatabaseReference *ref;

@property (weak, nonatomic) IBOutlet UITextField *employee0;
@property (weak, nonatomic) IBOutlet UITextField *employee1;
@property (weak, nonatomic) IBOutlet UITextField *employee2;

@property (weak, nonatomic) IBOutlet UISwitch *open0;
@property (weak, nonatomic) IBOutlet UISwitch *noon0;
@property (weak, nonatomic) IBOutlet UISwitch *close0;
@property (weak, nonatomic) IBOutlet UISwitch *open1;
@property (weak, nonatomic) IBOutlet UISwitch *noon1;
@property (weak, nonatomic) IBOutlet UISwitch *close1;
@property (weak, nonatomic) IBOutlet UISwitch *open2;
@property (weak, nonatomic) IBOutlet UISwitch *noon2;
@property (weak, nonatomic) IBOutlet UISwitch *close2;
@property (weak, nonatomic) IBOutlet UIPageControl *pageNavigator;


@end

@implementation dayViewController


//function to set employee's name as the text box
-(void)setEmployeeName:(NSString*) name
         employeeIndex:(int) index{
    if(index == 0){
        self.employee0.text = name;
    }
    else if(index == 1){
        self.employee1.text = name;
    }
    else {
        self.employee2.text = name;
    }
}

//fuction to set UISwitch ENABLE as employee's availability
-(void)setUISwitch:(int) employeeNum
              time:(int) timeNum
      availability:(bool) avail{
    if (employeeNum == 0){
        if (timeNum == 0)
            [self.open0 setEnabled:avail];
        else if (timeNum ==1)
            [self.noon0 setEnabled:avail];
        else
            [self.close0 setEnabled:avail];
    }
    else if (employeeNum == 1){
        if (timeNum == 0)
            [self.open1 setEnabled:avail];
        else if (timeNum ==1)
            [self.noon1 setEnabled:avail];
        else
            [self.close1 setEnabled:avail];
    }
    else{
        if (timeNum == 0)
            [self.open2 setEnabled:avail];
        else if (timeNum ==1)
            [self.noon2 setEnabled:avail];
        else
            [self.close2 setEnabled:avail];
    }
    
    
}

//function to sync employer's schedule chosing to each employee's shift array
-(void)viewWillDisappear:(BOOL)animated{
    NSString *dayString = [NSString stringWithFormat:@"%lu", (unsigned long)self.pageIndex];
    

    NSString *shiftBoolString1 = [@(self.open0.isOn && self.open0.isEnabled) stringValue];
    [[[[[[_ref child:@"users"] child:@"nrg294"] child:@"shift"] child:dayString] child:@"0"] setValue:shiftBoolString1];

    NSString *shiftBoolString2 = [@(self.noon0.isOn && self.noon0.isEnabled) stringValue];
    [[[[[[_ref child:@"users"] child:@"nrg294"] child:@"shift"] child:dayString] child:@"1"] setValue:shiftBoolString2];
    
    NSString *shiftBoolString3 = [@(self.close0.isOn && self.close0.isEnabled) stringValue];
    [[[[[[_ref child:@"users"] child:@"nrg294"] child:@"shift"] child:dayString] child:@"2"] setValue:shiftBoolString3];
    
    NSString *shiftBoolString4 = [@(self.open1.isOn && self.open1.isEnabled) stringValue];
    [[[[[[_ref child:@"users"] child:@"tlc383"] child:@"shift"] child:dayString] child:@"0"] setValue:shiftBoolString4];
    
    NSString *shiftBoolString5 = [@(self.noon1.isOn && self.noon1.isEnabled) stringValue];
    [[[[[[_ref child:@"users"] child:@"tlc383"] child:@"shift"] child:dayString] child:@"1"] setValue:shiftBoolString5];
    
    NSString *shiftBoolString6 = [@(self.close1.isOn && self.close1.isEnabled) stringValue];
    [[[[[[_ref child:@"users"] child:@"tlc383"] child:@"shift"] child:dayString] child:@"2"] setValue:shiftBoolString6];
    
    NSString *shiftBoolString7 = [@(self.open2.isOn && self.open2.isEnabled) stringValue];
    [[[[[[_ref child:@"users"] child:@"john1"] child:@"shift"] child:dayString] child:@"0"] setValue:shiftBoolString7];
    
    NSString *shiftBoolString8 = [@(self.noon2.isOn && self.noon2.isEnabled) stringValue];
    [[[[[[_ref child:@"users"] child:@"john1"] child:@"shift"] child:dayString] child:@"1"] setValue:shiftBoolString8];
    
    NSString *shiftBoolString9 = [@(self.close2.isOn && self.close2.isEnabled) stringValue];
    [[[[[[_ref child:@"users"] child:@"john1"] child:@"shift"] child:dayString] child:@"2"] setValue:shiftBoolString9];

    
}
-(void)viewDidAppear:(BOOL)animated{
    [self.pageNavigator setCurrentPage:self.pageIndex];
    //self.employeeUserNames = [[NSMutableArray alloc] init];
    self.dayText.text = self.dayStr;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _ref = [[FIRDatabase database] reference];

    FIRDatabaseReference *refEmployer = [[[_ref
                                            child:@"users"]
                                           child:self.model.username]
                                          child:@"employees"];

//    iterating through employer's list of employees
    [refEmployer observeSingleEventOfType:FIRDataEventTypeValue
                                     withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
         {
             int employeeNum = 0;

             for ( FIRDataSnapshot *child in snapshot.children) {
                 NSString *employeeUserName = child.value;

                 FIRDatabaseReference *refEmployee = [[[_ref child:@"users"] child:employeeUserName] child:@"name"];

                 //once the username of employee is known, set text box as their name
                 [refEmployee observeSingleEventOfType:FIRDataEventTypeValue
                                             withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
                  {
                      //set text box as employee's name
                      [self setEmployeeName:snapshot.value employeeIndex:employeeNum];
                  }];

                 //set UIswitch for each of 3 shifts button by referencing the employee's availabilities
                 for(int i =0; i < 3; i ++){
                     NSString *dayIndex = [NSString stringWithFormat:@"%lu", (unsigned long)self.pageIndex];
                     NSString *timeIndex = [NSString stringWithFormat:@"%d", i];

                     FIRDatabaseReference *refEmployeeAvail = [[[[[_ref child:@"users"] child:employeeUserName] child:@"avail"] child:dayIndex] child: timeIndex];

                     [refEmployeeAvail observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
                         if(snapshot.exists){
                         bool avail = [snapshot.value boolValue];   
                         [self setUISwitch:employeeNum time:i availability:avail];
                         }
                     }];
                 }

                 employeeNum ++;
             }
         }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toEmployerVC"])
    {
        EmployerVC *employerVC = segue.destinationViewController;
        employerVC.model = self.model;
    }
    
}

@end
