//
//  TimeSlot.h
//  CoverMe
//
//  Created by nyuguest on 12/5/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeSlot : NSObject

//@property (nonatomic) NSUInteger* day; //0-mon 1-tue 2-wed 3-thu 4-fri 5-sat 6-sun
@property (nonatomic) int startHour;
@property (nonatomic) int startMin;
@property (nonatomic) int endHour;
@property (nonatomic) int endMin;


@end
