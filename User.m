//
//  Human.m
//  CoverMe
//
//  Created by Julie Rosenbaum on 11/29/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "User.h"
#import "TimeSlot.h"

@implementation User
-(id) init{
    self = [super init];
    Availabilities = [[NSMutableArray alloc] initWithCapacity:7];
    Shifts = [[NSMutableArray alloc] initWithCapacity:7];
    return self;
}

-(void) addAvailability: (int) day
              startHour:(int) startHour
            startMinute:(int) startMin
                endHour:(int) endHour
              endMinute:(int) endMinute{
    TimeSlot *timeslot = [TimeSlot new];
    [timeslot setStartHour:startHour];
    [timeslot setStartMin:startMin];
    [timeslot setEndHour:endHour];
    [timeslot setEndMin:endMinute];
    [Availabilities insertObject:timeslot atIndex:day];
}

-(void) addShift: (int) day
       startHour:(int) startHour
     startMinute:(int) startMin
         endHour:(int) endHour
       endMinute:(int) endMinute{
    TimeSlot *timeslot = [TimeSlot new];
    [timeslot setStartHour:startHour];
    [timeslot setStartMin:startMin];
    [timeslot setEndHour:endHour];
    [timeslot setEndMin:endMinute];
    [Shifts insertObject:timeslot atIndex:day];
}

-(int) getAvailabilityStartHour: (int) day{return [Availabilities[day] startHour];}
-(int) getAvailabilityStartMin: (int)day{return [Availabilities[day] startMin];}
-(int) getAvailabilityEndHour:(int)day{return [Availabilities[day] endHour];}
-(int) getAvailabilityEndMin: (int) day{return [Availabilities[day] endMin];}

-(int) getShiftStartHour: (int) day{return [Shifts[day] startHour];}
-(int) getShiftStartMinute: (int) day{return [Shifts[day] startMin];}
-(int) getShiftEndHour: (int) day{return [Shifts[day] endHour];}
-(int) getShiftEndMinute: (int) day{return [Shifts[day] endMin];}



/*
- (NSString*) getFirstName{
    return _firstName;
}
- (NSString*) getLastName{
    return _lastName;
}
 
- (NSString*) getPassword{
    return _password;
}
- (NSString*) getemail{
    return _email;
}

- (NSString*) getImage{
    return _image;
}
- (float) getHoursWorked{
    return _hoursWorked;
}

- (void) setFirstName: (NSString*)first{
    _firstName = first;
}
- (void) setLastName: (NSString*)last{
    _lastName = last;
}
 
- (void) setPassword:(NSString*)pass{
    _password = pass;
}
- (void) setEmail:(NSString*)email{
    _email = email;
}

- (void)setImage:(NSString *)img{
    _image = img;
}
- (void) setHoursWorked:(float)hours{
    _hoursWorked = hours;
}
- (void) incrementHoursWorked:(float)hours{
    _hoursWorked += hours;
}
 */
@end
