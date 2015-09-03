//
//  KVZArrayDataSource.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 15.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZArrayDataSource.h"
#import "KVZTableViewCell.h"
#import "KVZDataSourceFactory.h"
#import "KVZCollectionViewCell.h"
#import "KVZConstants.h"

#define DOCUMENTS [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

@implementation KVZArrayDataSource

- (id)init {
    self = [super init];
    if (self) {
        self.array = [KVZDataSourceFactory coffeeModelArray];

    }
    return self;
}

- (void)addNewModel:(KVZCoffee *)coffee {
    self.array = [self.array arrayByAddingObject:coffee];
    
}


- (KVZCoffee *)coffeeModelWithName:(NSString *)name {
    KVZCoffee *newCoffeeModel = [[KVZCoffee alloc]initWithTypeName:name imageName:@"defaultCoffee.gif"];
    return newCoffeeModel;
}

- (void)saveNewCoffeeModelWithName:(NSString *)name {
    KVZCoffee *coffee = [self coffeeModelWithName:name];
    
    NSString *coffeeDocumentsPath = [DOCUMENTS stringByAppendingPathComponent:@"coffeeList.plist"];
    NSMutableArray *coffeeDictionaryArray = [[NSMutableArray alloc] initWithContentsOfFile:coffeeDocumentsPath];
    NSDictionary *newCoffeeDictionary = [coffee dictionaryRepresentation];
    [coffeeDictionaryArray addObject:newCoffeeDictionary];
    [coffeeDictionaryArray writeToFile:coffeeDocumentsPath atomically:YES];
    
#warning опечатка в cofffeeNameDictionary, хотя если эта логика переедет в датасорс, то передавать объект в нотификейшне не нужно будет
    [self addNewModel:coffee];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KVZDataFileContentDidChangeNotificationName
                                                        object:nil
                                                      userInfo:nil];
}

@end
