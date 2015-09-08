//
//  KVZArrayDataSourceFactory.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 15.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZDataSourceFactory.h"
#import "KVZCoffee.h"

#define DOCUMENTS [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

@implementation KVZDataSourceFactory

+ (NSArray *)coffeeModelArray {
    NSString *coffeePath = [[NSBundle mainBundle] pathForResource:@"coffeeList" ofType:@"plist"];
    NSString *coffeeDocumentsPath = [DOCUMENTS stringByAppendingPathComponent:@"coffeeList.plist"];
   [[NSFileManager defaultManager] copyItemAtPath:coffeePath toPath:coffeeDocumentsPath error:nil];
    
    NSArray *coffeeDictionaryArray = [[NSArray alloc] initWithContentsOfFile:coffeeDocumentsPath];
    NSMutableArray *array = [NSMutableArray array];
    

    for (NSDictionary *coffeeDictionary in coffeeDictionaryArray){
        KVZCoffee *coffeeObject = [[KVZCoffee alloc] initWithTypeName:[coffeeDictionary objectForKey:@"typeName"]
                                                            imageName:[coffeeDictionary objectForKey:@"imageName"]];
        [array addObject:coffeeObject];
    }
    NSArray *coffeeArray = [NSArray arrayWithArray:array];
    return coffeeArray;
}

@end
