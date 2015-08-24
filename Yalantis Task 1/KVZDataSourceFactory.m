//
//  KVZArrayDataSourceFactory.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 15.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZDataSourceFactory.h"


@implementation KVZDataSourceFactory

+(NSArray *)coffeeModelArray {
    NSString *coffeePath = [[NSBundle mainBundle] pathForResource:@"coffeeList" ofType:@"plist"];
    NSArray *coffeeDictionaryArray = [[NSArray alloc] initWithContentsOfFile:coffeePath];
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSDictionary *coffeDictionary in coffeeDictionaryArray)
    {
        KVZCoffee *coffeeObject = [[KVZCoffee alloc] initWithTypeName:[coffeDictionary objectForKey:@"typeName"]
                                                            imageName:[coffeDictionary objectForKey:@"imageName"]];
        [array addObject:coffeeObject];
    }
    
    NSArray *coffeeArray = [NSArray arrayWithArray:array];
    return coffeeArray;
}

+ (KVZCoffee *)newCoffeeModel:(NSString *)string{
    KVZCoffee *newCoffeeModel = [[KVZCoffee alloc]initWithTypeName:string imageName:@"defaultCoffee.gif"];
    return newCoffeeModel;
}

+ (void)saveNewCoffeeModel:(KVZCoffee *)coffee{
    NSString *coffeePath = [[NSBundle mainBundle] pathForResource:@"coffeeList" ofType:@"plist"];
    NSMutableArray *coffeeDictionaryArray = [[NSMutableArray alloc] initWithContentsOfFile:coffeePath];
    NSDictionary *newCoffeeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:coffee.typeName, @"typeName", coffee.imageName, @"imageName", nil];
    [coffeeDictionaryArray addObject:newCoffeeDictionary];
    [coffeeDictionaryArray writeToFile:coffeePath atomically:YES];
}

@end
