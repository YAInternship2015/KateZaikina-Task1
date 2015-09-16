//
//  KVZCoffee.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 10.09.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface KVZCoffee : NSManagedObject

@property (nonatomic, retain) NSString * typeName;
@property (nonatomic, retain) NSString * imageName;

@end
