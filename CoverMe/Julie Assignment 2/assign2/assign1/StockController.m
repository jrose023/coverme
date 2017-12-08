//
//  StockController.m
//  assign2
//
//  Created by Julie Rosenbaum on 10/12/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "StockController.h"
#import "Object_Info.h"


//
//@interface StockController()
//
//@property NSMutableDictionary *store;
//
//@end
//
//@implementation StockController
//
//-(NSMutableDictionary*)getDict{
//    return _store;
//}
//
//- (BOOL)add_item: (NSString*)key withDescription:(NSString*)desc withRetail:(float)rCost withWholesale:(float)wCost;
//{
//    if (_store ==  nil){
//        _store = [NSMutableDictionary new];
//    }
//    if ([_store objectForKey:key] != nil){ //if its not in the dictionary, skip
//        return false;
//    }
//    else{
//        Object_Info *object = [Object_Info new];
//        [object setRetail:rCost];
//        [object setWholesale:wCost];
//        [object setDescription:desc];
//        [object setUnitsLeft:0.0];
//        [object setUnitsSold:0.0];
//        [_store setObject:object forKey:key];
//        return true;
//
//    }
//}
//-(Object_Info*)delete_item: (NSString*) key{
//    Object_Info *object = [_store objectForKey:key];
//    [_store removeObjectForKey:key];
//    return object;
//}
//- (void)add_stock: (int)numAdd withKey: (NSString*)key{
//    Object_Info *object = [_store objectForKey:key];
//    [object setUnitsLeft:numAdd];
//    [_store setObject:object forKey:key];
//}
//- (void)sell_item: (int)numSold withKey: (NSString*)key{
//    if ([[_store objectForKey:key] getUnitsLeft] == 0 || [[_store objectForKey:key] getUnitsLeft] < numSold) {
//        NSLog(@"Error: no units available to sell");
//    }
//    else{
//        Object_Info *object = [_store objectForKey:key];
//        int left = [object getUnitsLeft]-numSold;
//        int sold = [object getUnitsSold]+numSold;
//        [object setUnitsLeft:left];
//        [object setUnitsSold:sold];
//
//        [_store setObject:object forKey:key];
//
//        [object print_object];
//    }
//}
//- (float)profit_of_store{
//    float profit = 0.0;
//    for (id key in _store){
//        Object_Info *object = [_store objectForKey:key];
//        profit += ([object getRetail] - [object getWholesale]) * ([object getUnitsSold]);
//    }
//    return profit;
//}
//
//-(void)print_dictionary{
//    for (id key in _store){
//        NSLog(@"Key: %@", key);
//        Object_Info *object = [_store objectForKey:key];
//        [object print_object];
//        NSLog(@"");
//    }
//}
//
//@end
//
//
//


@interface StockController()

@property NSMutableArray *stockArray;

@end

@implementation StockController

-(NSMutableArray*)getStockArray{
    return _stockArray;
}


- (BOOL)add_item: (int)idx withName: (NSString*)name withDescription:(NSString*)desc withRetail:(float)rCost withStock: (int)unitsAvail withImage: (NSString*)img
{
    if (_stockArray ==  nil){
        _stockArray = [NSMutableArray new];
    }
    
//    //if its not in the dictionary, skip
//    if ([_stockArray objectAtIndex:idx] != nil){
//        return false;
//    }
//    else{
    Object_Info *object = [Object_Info new];
    [object setName:name];
    [object setRetail:rCost];
    [object setDescription:desc];
    [object setUnitsLeft:unitsAvail];
    [object setImage:img];
    [_stockArray insertObject:object atIndex:idx];
    return true;

//    }
}
//-(Object_Info*)delete_item: (NSString*) key{
//    Object_Info *object = [_stockArray objectForKey:key];
//    [_stockArray removeObjectForKey:key];
//    return object;
//}
- (void)add_stock: (int)numAdd withKey: (int)idx{
    Object_Info *object = [_stockArray objectAtIndex:idx];
    [object setUnitsLeft:[object getUnitsLeft]+numAdd];
    [_stockArray replaceObjectAtIndex:idx withObject:object];
}
- (void)sell_item: (int)numSold withKey: (int)idx{
    if ([[_stockArray objectAtIndex:idx] getUnitsLeft] == 0 || [[_stockArray objectAtIndex:idx] getUnitsLeft] < numSold) {
        NSLog(@"Error: no units available to sell");
    }
    else{
        Object_Info *object = [_stockArray objectAtIndex:idx];
        int left = [object getUnitsLeft]-numSold;
        int sold = [object getUnitsSold]+numSold;
        [object setUnitsLeft:left];
        [object setUnitsSold:sold];

        [_stockArray replaceObjectAtIndex:idx withObject:object];

        [object print_object];
    }
}
//- (float)profit_of_store{
//    float profit = 0.0;
//    for (id key in _stockArray){
//        Object_Info *object = [_stockArray objectForKey:key];
//        profit += ([object getRetail] - [object getWholesale]) * ([object getUnitsSold]);
//    }
//    return profit;
//}
//
//-(void)print_stock{
//    for (id key in _stockArray){
//        NSLog(@"Key: %@", key);
//        Object_Info *object = [_stockArray objectForKey:key];
//        [object print_object];
//        NSLog(@"");
//    }
//}

@end




