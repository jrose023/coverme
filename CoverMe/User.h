//
//  Human.h
//  CoverMe
//
//  Created by Julie Rosenbaum on 11/29/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
- (NSString*) getFirstName;
- (NSString*) getLastName;
- (NSString*) getPassword;
- (NSString*) getemail;
- (NSString*) getImage;
- (float) getHoursWorked;

- (void) setFirstName: (NSString*)first;
- (void) setLastName: (NSString*)last;
- (void) setPassword:(NSString*)pass;
- (void) setEmail:(NSString*)email;
- (void) setImage:(NSString *)img;

@end
