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

#warning имя нотификейшна стоит вынести в отдельный файл типа KVZConstants.h и объявить его там константой, так как это имя используется в нескольких местах. Синтаксис вроде такого
//    static NSString *const KVZDataFileContentDidChangeNotificationName = @"KVZDataFileContentDidChangeNotification";

extern NSString* const KVZDataFileContentDidChangeNotification;
extern NSString* const KVZDataFileContentDidChangeUserInfoKey;

@interface KVZDataSourceFactory : NSObject

+ (NSArray *)coffeeModelArray;
#warning из всех методов в этой фабрике должен быть только следующий. Остальные методы к паттерну "фабрика" отношения не имеют. Остальные два метода должны быть в самом датасорсе
+ (KVZCoffee *)newCoffeeModelWithName:(NSString *)string;
+ (void)saveNewCoffeeModelWithName:(NSString *)coffee;

@end
