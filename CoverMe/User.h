//
//  Human.h
//  CoverMe
//
//  Created by Julie Rosenbaum on 11/29/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
@import  Firebase;

@interface User : NSObject{
    NSMutableArray *Availabilities;
    NSMutableArray *Shifts;
}

//@property (nonatomic) NSString *firstName;
//@property (nonatomic) NSString *lastName;
@property (nonatomic) NSString *password;
@property (nonatomic) NSString *email;
@property bool *employer;
//@property (nonatomic) NSString *image;

//@property (nonatomic) float hoursWorked;
@property (strong, nonatomic) FIRDatabaseReference *ref;

-(void) addAvailability: (int) day
              startHour:(int) startHour
            startMinute:(int) startMin
                endHour:(int) endHour
              endMinute:(int) endMinute;

-(void) addShift: (int) day
       startHour:(int) startHour
     startMinute:(int) startMin
         endHour:(int) endHour
       endMinute:(int) endMinute;

-(int) getAvailabilityStartHour: (int) day;
-(int) getAvailabilityStartMin: (int)day;
-(int) getAvailabilityEndHour:(int)day;
-(int) getAvailabilityEndMin: (int) day;

-(int) getShiftStartHour: (int) day;
-(int) getShiftStartMinute: (int) day;
-(int) getShiftEndHour: (int) day;
-(int) getShiftEndMinute: (int) day;
//- (NSString*) getFirstName;
//- (NSString*) getLastName;
//- (NSString*) getPassword;
//- (NSString*) getemail;
//- (NSString*) getImage;
//- (float) getHoursWorked;

//- (void) setFirstName: (NSString*)first;
//- (void) setLastName: (NSString*)last;
//- (void) setPassword:(NSString*)pass;
//- (void) setEmail:(NSString*)email;
//- (void) setImage:(NSString *)img;

@end
