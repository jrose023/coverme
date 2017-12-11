//
//  SchedulePageViewController.m
//  CoverMe
//
//  Created by nyuguest on 12/10/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "SchedulePageViewController.h"
#import "dayViewController.h"

@interface SchedulePageViewController ()
{
    NSArray *days;
}

@end

@implementation SchedulePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    days = @[@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday"];
    
    self.dataSource = self; //navigation by swiping
    dayViewController *initialVC = (dayViewController*)[self viewControllerAtIndex:0];
    initialVC.model = self.model;
    
    NSArray *dayViewControllers = [NSArray arrayWithObject:initialVC];
    
    [self setViewControllers:dayViewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}



//helper method
-(UIViewController *) viewControllerAtIndex:(NSUInteger) index{
    dayViewController *dayVC = [self.storyboard instantiateViewControllerWithIdentifier:@"dayViewController"];
    dayVC.model = self.model;
    dayVC.dayStr = days[index];
    dayVC.pageIndex = index;
    
    return dayVC;
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)dayVC{
    NSUInteger index = ((dayViewController*) dayVC).pageIndex;
    if (index == NSNotFound){
        return nil;
    }
    index++;
    if(index == days.count){
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)dayVC{
    
    NSUInteger index = ((dayViewController *) dayVC).pageIndex;
    if (index ==0 || index == NSNotFound){
        return nil;
    }
    index --;
    return [self viewControllerAtIndex:index];
    

}


- (IBAction)dayText:(id)sender {
}
@end
