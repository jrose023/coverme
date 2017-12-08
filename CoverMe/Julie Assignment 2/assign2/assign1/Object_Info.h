//
//  Object_Info.h
//  assign2
//
//  Created by Julie Rosenbaum on 10/12/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Object_Info : NSObject
- (NSString*) getName;
- (NSString*) getDescription;
- (float) getRetail;
- (float) getWholesale;
- (int) getUnitsLeft;
- (int) getUnitsSold;
- (NSString*) getImage;

- (void) setName: (NSString*)name;
- (void) setDescription: (NSString*)desc;
- (void) setRetail:(float)rCost;
- (void) setWholesale:(float)wCost;
- (void) setUnitsLeft:(int)unitsL;
- (void) setUnitsSold:(int)unitS;
- (void) setImage:(NSString *)img;


- (void) print_object;
@end

