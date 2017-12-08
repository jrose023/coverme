//
//  StockController.h
//  assign2
//
//  Created by Julie Rosenbaum on 10/12/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Object_Info.h"

//
//@interface StockController : NSObject
//- (NSMutableDictionary*) getDict;
//- (BOOL)add_item: (NSString*)key withDescription:(NSString*)desc withRetail:(float)rCost withWholesale:(float)wCost;
//- (Object_Info*)delete_item: (NSString*) key;
//- (void)add_stock: (int)numAdd withKey: (NSString*)key;
//- (void)sell_item: (int)numSold withKey: (NSString*)key;
//- (float)profit_of_store;
//- (void)print_dictionary;
//
//
//@end
//
//
//


@interface StockController : NSObject
- (NSMutableArray*) getStockArray;
- (BOOL)add_item: (int)idx withName: (NSString*)name withDescription:(NSString*)desc withRetail:(float)rCost withStock: (int)unitsAvail withImage: (NSString*)img;
//- (Object_Info*)delete_item: (int) idx;
- (void)add_stock: (int)numAdd withKey: (int)idx;
- (void)sell_item: (int)numSold withKey: (int)idx;
//- (float)profit_of_store;
//- (void)print_stock;


@end


