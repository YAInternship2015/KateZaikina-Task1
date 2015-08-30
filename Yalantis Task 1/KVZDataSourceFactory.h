//
//  KVZArrayDataSourceFactory.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 15.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KVZCoffee.h"

extern NSString* const KVZDataFileContentDidChangeNotification;
extern NSString* const KVZDataFileContentDidChangeUserInfoKey;

@interface KVZDataSourceFactory : NSObject

+ (NSArray *)coffeeModelArray;
+ (KVZCoffee *)newCoffeeModelWithName:(NSString *)string;
+ (void)saveNewCoffeeModelWithName:(NSString *)coffee;

@end
