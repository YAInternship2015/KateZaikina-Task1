//
//  KVZCollectionViewDataSource.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 03.09.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface KVZCollectionViewDataSource : NSObject <UICollectionViewDataSource, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
