//
//  dayViewController.h
//  CoverMe
//
//  Created by nyuguest on 12/10/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelClass.h"

@interface dayViewController : UIViewController

@property (strong, nonatomic) ModelClass *model;

//add all button, all text fields
@property NSUInteger pageIndex;
@property NSString* dayStr;

@end
