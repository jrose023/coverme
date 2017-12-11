//
//  ShiftViewController.h
//  CoverMe
//
//  Created by Julie Rosenbaum on 12/11/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ModelClass.h"

@interface ShiftViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (nonatomic) ModelClass *model;

@end
