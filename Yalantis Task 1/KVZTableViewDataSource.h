//
//  KVZTableViewDataSource.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 03.09.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface KVZTableViewDataSource : NSObject <UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end
