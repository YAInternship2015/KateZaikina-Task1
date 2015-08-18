//
//  KVZArrayDataSourceFactory.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 15.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KVZDataSourceFactory : NSObject

#warning здесь надо поправить форматирование + (id<UITableViewDataSource>)coffeeTableDataSource;
#warning идея с фабрикой правильная, но лучше бы фабрика создавала не датасорс, а модели. И обращался бы к ней за моделями сам датасорс, который создается контроллером
+(id <UITableViewDataSource>)coffeeTableDataSource;

@end
