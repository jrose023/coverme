//
//  SchedulePageViewController.h
//  CoverMe
//
//  Created by nyuguest on 12/10/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelClass.h"

@interface SchedulePageViewController : UIPageViewController <UIPageViewControllerDataSource>
@property (nonatomic) ModelClass *model;

@end
