//
//  Object_Info.m
//  assign2
//
//  Created by Julie Rosenbaum on 10/12/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "Object_Info.h"

@interface Object_Info()
@property (nonatomic) int unitsLeft;
@property (nonatomic) int unitsSold;
@property (nonatomic) float retail;
@property (nonatomic) float wholesale;
@property (nonatomic) NSString *descrip;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *image;


@end

@implementation Object_Info

//@synthesize unitsSold;
//@synthesize unitsLeft;

- (NSString*) getName{
    return _name;
}
- (NSString*) getDescription{
    return _descrip;
}
- (float) getRetail{
    return _retail;
}
- (float) getWholesale{
    return _wholesale;
}
- (int) getUnitsLeft{
    return _unitsLeft;
}
- (int) getUnitsSold{
    return _unitsSold;
}
- (NSString*) getImage{
    return _image;
}

- (void) setName:(NSString *)name{
    _name = name;
}
- (void) setDescription: (NSString*)desc{
    _descrip = desc;
}
- (void) setRetail:(float)rCost{
    _retail = rCost;
}
- (void) setWholesale:(float)wCost{
    _wholesale = wCost;
}
- (void) setUnitsLeft:(int)unitsL{
    _unitsLeft = unitsL;
}
- (void) setUnitsSold:(int)unitsS{
    _unitsSold = unitsS;
}
- (void) setImage:(NSString *)img{
    _image = img;
}

- (void) print_object{
    NSLog(@"Name: %@", self.getName);
    NSLog(@"Description: %@", self.getDescription );
    NSLog(@"Retail Cost: %.2f", self.getRetail );
    NSLog(@"Wholesale Cost: %.2f", self.getWholesale );
    NSLog(@"Units Left: %d", self.getUnitsLeft );
    NSLog(@"Units Sold: %d", self.getUnitsSold );
}

@end

