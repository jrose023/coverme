//
//  WelcomeViewController.m
//  CoverMe
//
//  Created by Julie Rosenbaum on 11/21/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *schedPic;
@property (weak, nonatomic) IBOutlet UIImageView *availabilityPic;
@property (weak, nonatomic) IBOutlet UIImageView *timeoffPic;
@property (weak, nonatomic) IBOutlet UIImageView *coveragePic;
@property (weak, nonatomic) IBOutlet UIButton *seeSched;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view
    self.schedPic.image = [UIImage imageNamed:@"calendar.png"];
    self.availabilityPic.image = [UIImage imageNamed:@"availability.png"];
    self.timeoffPic.image = [UIImage imageNamed:@"timeoff.png"];
    self.coveragePic.image = [UIImage imageNamed:@"swap.png"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
