//
//  KVZArrayDataSourceFactory.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 15.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "KVZCoffee.h"

@interface KVZDataSourceFactory : NSObject

+ (KVZCoffee *)newCoffeeModel:(NSString *)typeName;

@end
