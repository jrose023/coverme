//
//  ViewController.m
//  assig2
//
//  Created by Julie Rosenbaum on 10/11/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "ViewController.h"
#import "Object_Info.h"
#import "StockController.h"
#import "AddProductViewController.h"

@interface ViewController ()<ProductDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *productPic;
@property (weak, nonatomic) IBOutlet UITextField *productName;
@property (weak, nonatomic) IBOutlet UITextField *productDesc;
@property (weak, nonatomic) IBOutlet UITextField *productCost;
@property (weak, nonatomic) IBOutlet UITextField *productAvail;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) NSMutableArray *productArray;
@property int idx;
@property int size;
@end

@implementation ViewController
-(void)productAdded:(AddProductViewController * )APVC
       didEnterName:(NSString *) name andDesc:(NSString*)desc andCost:(float)cost andStock:(int)stock
{
    [APVC dismissViewControllerAnimated:YES completion:nil];
    Object_Info* obj = [Object_Info new];
    [obj setName:name];
    [obj setDescription:desc];
    [obj setRetail:cost];
    [obj setUnitsLeft:stock];
    [obj setImage:@"none.png"];
    [self.productArray addObject:obj];
    [_nextButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    _size+=1;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AddProductViewController *APVC = segue.destinationViewController;
    APVC.delegate = self;
}

- (IBAction)increment:(id)sender {
    Object_Info *obj = [self.productArray objectAtIndex:_idx];
    [obj setUnitsLeft:[obj getUnitsLeft]+1];
    self.productAvail.text = [[NSString alloc] initWithFormat:@"%.0d", [obj getUnitsLeft]];
    [self.productArray replaceObjectAtIndex:_idx withObject:obj];
}
- (IBAction)decrement:(id)sender {
    Object_Info *obj = [self.productArray objectAtIndex:_idx];
    if ([obj getUnitsLeft] > 0){
        [obj setUnitsLeft:[obj getUnitsLeft]-1];
        self.productAvail.text = [[NSString alloc] initWithFormat:@"%.0d", [obj getUnitsLeft]];
        [self.productArray replaceObjectAtIndex:_idx withObject:obj];
    }
}
- (IBAction)nextProduct:(id)sender {
    if ([self.productArray objectAtIndex:_idx] != [self.productArray lastObject]){
        [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _idx++;
        Object_Info *obj = [self.productArray objectAtIndex:_idx];
        self.productCost.text = [[NSString alloc] initWithFormat:@"%.2f", [obj getRetail]];
        self.productAvail.text = [[NSString alloc] initWithFormat:@"%d", [obj getUnitsLeft]];
        self.productName.text = [obj getName];
        self.productDesc.text = [obj getDescription];
        self.productPic.image = [UIImage imageNamed:[obj getImage]];
        
    }
    if(_idx == _size-1){
        [_nextButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    }
}
- (IBAction)backProduct:(id)sender {
    if ([self.productArray objectAtIndex:_idx] != [self.productArray firstObject]){
        [_nextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _idx--;
        Object_Info *obj = [self.self.productArray objectAtIndex:_idx];
        self.productCost.text = [[NSString alloc] initWithFormat:@"%.2f", [obj getRetail]];
        self.productAvail.text = [[NSString alloc] initWithFormat:@"%d", [obj getUnitsLeft]];
        self.productName.text = [obj getName];
        self.productDesc.text = [obj getDescription];
        self.productPic.image = [UIImage imageNamed:[obj getImage]];
    }
    if(_idx == 0){
        [_backButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    StockController *stock = [StockController new];
    
    [stock add_item:0 withName:@"iPhone" withDescription:@"Apple" withRetail:700 withStock:43 withImage:@"iphone.jpg"];
    [stock add_item:1 withName:@"Pixel" withDescription:@"Google" withRetail:600 withStock:37 withImage:@"pixel.jpg"];
    [stock add_item:2 withName:@"Galaxy" withDescription:@"Samsung" withRetail:400 withStock:84 withImage:@"galaxy.jpeg"];
    [stock add_item:3 withName:@"S8" withDescription:@"Samsung" withRetail:500 withStock:60 withImage:@"s8.jpeg"];
    
    self.productArray = [stock getStockArray];
    Object_Info *obj = [self.self.productArray objectAtIndex:0];
    
    self.productCost.text = [[NSString alloc] initWithFormat:@"%.2f", [obj getRetail]];
    self.productAvail.text = [[NSString alloc] initWithFormat:@"%d", [obj getUnitsLeft]];
    self.productName.text = [obj getName];
    self.productDesc.text = [obj getDescription];
    self.productPic.image = [UIImage imageNamed:[obj getImage]];
    
    [_backButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    _idx = 0;
    _size = 4;
    
}
@end



