//
//  Human.m
//  CoverMe
//
//  Created by Julie Rosenbaum on 11/29/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "User.h"
@import Firebase;

@interface User()
@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSString *password;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *image;

@property (nonatomic) float hoursWorked;
@property (strong, nonatomic) FIRDatabaseReference *ref;



@end

@implementation User
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
- (void) setImage:(NSString *)img{
    _image = img;
}
- (void) setHoursWorked:(float)hours{
    _hoursWorked = hours;
}
- (void) incrementHoursWorked:(float)hours{
    _hoursWorked += hours;
}
@end
