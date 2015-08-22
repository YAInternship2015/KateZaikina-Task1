//
//  KVZArrayDataSource.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 15.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KVZArrayDataSource : NSObject <UITableViewDataSource, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *array;

@end
