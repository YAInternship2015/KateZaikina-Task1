//
//  KVZCollectionViewDataSource.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 03.09.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZCollectionViewDataSource.h"
#import "KVZCollectionViewCell.h"
#import "KVZArrayDataSource.h"
#import "KVZConstants.h"

@interface KVZCollectionViewDataSource ()

@property (nonatomic, strong) KVZArrayDataSource *arrayDataSource;

@end

@implementation KVZCollectionViewDataSource

- (id)init {
    self = [super init];
    if (self) {
        KVZArrayDataSource *array = [[KVZArrayDataSource alloc] init];
        self.arrayDataSource = array;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(reloadViewNotification:)
                                                     name:KVZDataFileContentDidChangeNotificationName
                                                   object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)reloadViewNotification:(NSNotification *)notification {
    KVZArrayDataSource *array = [[KVZArrayDataSource alloc] init];
    self.arrayDataSource = array;
    if ([self.delegate respondsToSelector:@selector(collectionDataSourceDidChange:)]){
        [self.delegate collectionDataSourceDidChange:self];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.arrayDataSource.array count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"collectionCoffeeCell";
    KVZCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    KVZCoffee *coffee = [self.arrayDataSource.array objectAtIndex:indexPath.item];
    [cell setUpWithCoffeeImage:coffee];
    
    return cell;
}

@end
