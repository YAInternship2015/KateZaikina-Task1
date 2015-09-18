//
//  KVZArrayDataSourceFactory.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 15.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZDataSourceFactory.h"
#import "KVZCoreDataManager.h"

@implementation KVZDataSourceFactory

+ (KVZCoffee *)createNewCoffeeModel:(NSString *)typeName {
    NSManagedObjectContext *moc = [[KVZCoreDataManager sharedManager] managedObjectContext];
    KVZCoffee *coffee = [NSEntityDescription insertNewObjectForEntityForName:@"KVZCoffee" inManagedObjectContext:moc];
    coffee.typeName = typeName;
    coffee.imageName = @"defaultCoffee.gif";
                         return coffee;
}

@end
