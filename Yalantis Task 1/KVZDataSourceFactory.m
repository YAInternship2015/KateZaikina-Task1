//
//  KVZArrayDataSourceFactory.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 15.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZDataSourceFactory.h"
#import "KVZCoffee.h"
#import "KVZDataManager.h"

@implementation KVZDataSourceFactory

+ (void)coffeeModelArray {
  NSManagedObjectContext *mc =[[KVZDataManager sharedManager] managedObjectContext];
    
    NSString *coffeePath = [[NSBundle mainBundle] pathForResource:@"coffeeList" ofType:@"plist"];
    
    NSArray *coffeeDictionaryArray = [[NSArray alloc] initWithContentsOfFile:coffeePath];
    NSMutableArray *array = [NSMutableArray array];
    NSLog(@"%@", coffeeDictionaryArray);

    for (NSDictionary *coffeeDictionary in coffeeDictionaryArray){
        KVZCoffee *coffeeObject = [NSEntityDescription insertNewObjectForEntityForName:@"KVZCoffee" inManagedObjectContext:mc];
        coffeeObject.typeName = [coffeeDictionary objectForKey:@"typeName"];
        coffeeObject.imageName = [coffeeDictionary objectForKey:@"imageName"];
        [array addObject:coffeeObject];
    }
    [mc save:nil];
}

@end
