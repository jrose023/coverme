//
//  ScheduleSwipeViewController.h
//  CoverMe
//
//  Created by Julie Rosenbaum on 12/11/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelClass.h"

@interface SwipeViewController : UIPageViewController <UIPageViewControllerDataSource>
@property (nonatomic) ModelClass *model;

@end
