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
#warning <#message#>
    NSString *coffeePath = [[NSBundle mainBundle] pathForResource:@"coffeeList" ofType:@"plist"];
    NSString *coffeeDocumentsPath = [DOCUMENTS stringByAppendingPathComponent:@"coffeeList.plist"];
   [[NSFileManager defaultManager] copyItemAtPath:coffeePath toPath:coffeeDocumentsPath error:nil];
    
    NSArray *coffeeDictionaryArray = [[NSArray alloc] initWithContentsOfFile:coffeeDocumentsPath];
    NSMutableArray *array = [NSMutableArray array];
    
#warning опечатка в coffeDictionary
    for (NSDictionary *coffeDictionary in coffeeDictionaryArray)
#warning открывающуюся скобку надо оставлять на той же строке, что и for
    {
        KVZCoffee *coffeeObject = [[KVZCoffee alloc] initWithTypeName:[coffeDictionary objectForKey:@"typeName"]
                                                            imageName:[coffeDictionary objectForKey:@"imageName"]];
        [array addObject:coffeeObject];
    }
    
    NSArray *coffeeArray = [NSArray arrayWithArray:array];
    return coffeeArray;
}

#warning лучше просто coffeeModelWithName:
+ (KVZCoffee *)newCoffeeModelWithName:(NSString *)name {
    KVZCoffee *newCoffeeModel = [[KVZCoffee alloc]initWithTypeName:name imageName:@"defaultCoffee.gif"];
    return newCoffeeModel;
}

+ (void)saveNewCoffeeModelWithName:(NSString *)name {
    KVZCoffee *coffee = [self newCoffeeModelWithName:name];
    
    NSString *coffeeDocumentsPath = [DOCUMENTS stringByAppendingPathComponent:@"coffeeList.plist"];
    NSMutableArray *coffeeDictionaryArray = [[NSMutableArray alloc] initWithContentsOfFile:coffeeDocumentsPath];
#warning это лучше вынести в категорию KVZCoffee в метод dictionaryRepresentation
    NSDictionary *newCoffeeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:coffee.typeName, @"typeName", coffee.imageName, @"imageName", nil];
    
    [coffeeDictionaryArray addObject:newCoffeeDictionary];
    [coffeeDictionaryArray writeToFile:coffeeDocumentsPath atomically:YES];
    
#warning опечатка в cofffeeNameDictionary, хотя если эта логика переедет в датасорс, то передавать объект в нотификейшне не нужно будет
    NSDictionary *cofffeeNameDictionary = [NSDictionary dictionaryWithObject:coffee
                                                                      forKey:KVZDataFileContentDidChangeUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:KVZDataFileContentDidChangeNotification
                                                        object:nil
                                                      userInfo:cofffeeNameDictionary];
}

@end
