//
//  ScheduleViewController.h
//  CoverMe
//
//  Created by Julie Rosenbaum on 12/11/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelClass.h"

@interface ScheduleViewController : UIViewController

@property (strong, nonatomic) ModelClass *model;

//add all button, all text fields
@property NSUInteger pageIndex;
@property NSString* dayStr;

@end

