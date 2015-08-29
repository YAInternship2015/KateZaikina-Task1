//
//  KVZArrayDataSource.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 15.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZArrayDataSource.h"
#import "KVZTableViewCell.h"
#import "KVZCoffee.h"
#import "KVZDataSourceFactory.h"
#import "KVZCollectionViewCell.h"

@implementation KVZArrayDataSource

- (id)init {
    self = [super init];
    if (self) {
        self.array = [KVZDataSourceFactory coffeeModelArray];
    }
    return self;
}

- (void)addModelWithName:(NSString *)name {
    KVZCoffee *newCoffeeModel = [KVZDataSourceFactory newCoffeeModelWithName:name];
    self.array = [self.array arrayByAddingObject:newCoffeeModel];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"coffeeCell";
    KVZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    KVZCoffee *coffee = [self.array objectAtIndex:indexPath.row];
    [cell setUpWithCoffee:coffee];
    
    return cell;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.array count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"collectionCoffeeCell";
    KVZCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    KVZCoffee *coffee = [self.array objectAtIndex:indexPath.item];
    [cell setUpWithCoffeeImage:coffee];
        
    return cell;
}


@end
