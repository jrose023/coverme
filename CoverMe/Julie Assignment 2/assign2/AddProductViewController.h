//
//  AddProductViewController.h
//  assign2
//
//  Created by Julie Rosenbaum on 10/16/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Object_Info.h"

@protocol ProductDelegate;

@interface AddProductViewController : UIViewController

@property (weak, nonatomic) id<ProductDelegate>delegate;
@end

@protocol ProductDelegate <NSObject>

-(void)productAdded:(AddProductViewController * )APVC
       didEnterName:(NSString *) name
            andDesc:(NSString*)desc
            andCost:(float)cost
           andStock:(int)stock;
@end
