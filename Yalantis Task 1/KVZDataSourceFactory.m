//
//  KVZArrayDataSourceFactory.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 15.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZDataSourceFactory.h"

NSString* const KVZDataFileContentDidChangeNotification = @"KVZDataFileContentDidChangeNotification";
NSString* const KVZDataFileContentDidChangeUserInfoKey = @"KVZDataFileContentDidChangeUserInfoKey";

#define DOCUMENTS [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

@implementation KVZDataSourceFactory

+ (NSArray *)coffeeModelArray {
    NSString *coffeePath = [[NSBundle mainBundle] pathForResource:@"coffeeList" ofType:@"plist"];
    NSString *coffeeDocumentsPath = [DOCUMENTS stringByAppendingPathComponent:@"coffeeList.plist"];
   [[NSFileManager defaultManager] copyItemAtPath:coffeePath toPath:coffeeDocumentsPath error:nil];
    
    NSArray *coffeeDictionaryArray = [[NSArray alloc] initWithContentsOfFile:coffeeDocumentsPath];
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

+ (KVZCoffee *)newCoffeeModelWithName:(NSString *)name {
    KVZCoffee *newCoffeeModel = [[KVZCoffee alloc]initWithTypeName:name imageName:@"defaultCoffee.gif"];
    return newCoffeeModel;
}

+ (void)saveNewCoffeeModelWithName:(NSString *)name {
    KVZCoffee *coffee = [self newCoffeeModelWithName:name];
    
    NSString *coffeeDocumentsPath = [DOCUMENTS stringByAppendingPathComponent:@"coffeeList.plist"];
    NSMutableArray *coffeeDictionaryArray = [[NSMutableArray alloc] initWithContentsOfFile:coffeeDocumentsPath];
    NSDictionary *newCoffeeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:coffee.typeName, @"typeName", coffee.imageName, @"imageName", nil];
    
    [coffeeDictionaryArray addObject:newCoffeeDictionary];
    [coffeeDictionaryArray writeToFile:coffeeDocumentsPath atomically:YES];
    
    NSDictionary *cofffeeNameDictionary = [NSDictionary dictionaryWithObject:coffee
                                                                      forKey:KVZDataFileContentDidChangeUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:KVZDataFileContentDidChangeNotification
                                                        object:nil
                                                      userInfo:cofffeeNameDictionary];
}

@end
