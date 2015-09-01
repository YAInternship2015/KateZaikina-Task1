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

@interface KVZArrayDataSource ()

- (void)addModelNotification:(NSNotification *)notification;

@end


@implementation KVZArrayDataSource

- (id)init {
    self = [super init];
    if (self) {
        self.array = [KVZDataSourceFactory coffeeModelArray];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(addModelNotification:)
                                                     name:KVZDataFileContentDidChangeNotification
                                                   object:nil];

    }
    return self;
}

- (void)addModelNotification:(NSNotification *)notification {
    KVZCoffee *coffee = [notification.userInfo objectForKey:KVZDataFileContentDidChangeUserInfoKey];
    self.array = [self.array arrayByAddingObject:coffee];
    if ([self.delegate respondsToSelector:@selector(arrayDataSourceDidChange:)])
    {
        [self.delegate arrayDataSourceDidChange:self];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
