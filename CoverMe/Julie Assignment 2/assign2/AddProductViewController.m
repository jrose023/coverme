//
//  AddProductViewController.m
//  assign2
//
//  Created by Julie Rosenbaum on 10/16/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "AddProductViewController.h"
#import "Object_Info.h"


@interface AddProductViewController ()
@property (weak, nonatomic) IBOutlet UITextField *prodName;
@property (weak, nonatomic) IBOutlet UITextField *prodDesc;
@property (weak, nonatomic) IBOutlet UITextField *prodCost;
@property (weak, nonatomic) IBOutlet UITextField *prodStock;
@end

@implementation AddProductViewController

- (IBAction)addProduct:(id)sender {
    [self.delegate productAdded:self didEnterName:self.prodName.text andDesc:self.prodDesc.text andCost:[self.prodCost.text floatValue] andStock:[self.prodStock.text integerValue]];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.prodName becomeFirstResponder];
}



@end
