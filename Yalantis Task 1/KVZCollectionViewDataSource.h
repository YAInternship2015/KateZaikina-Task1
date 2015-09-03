//
//  KVZCollectionViewDataSource.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 03.09.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class KVZCollectionViewDataSource;

@protocol KVZCollectionViewDataSourceDelegate <NSObject>

- (void)collectionDataSourceDidChange:(KVZCollectionViewDataSource *)collectionDataSource;

@end

@interface KVZCollectionViewDataSource : NSObject <UICollectionViewDataSource>

@property (nonatomic, weak) id <KVZCollectionViewDataSourceDelegate> delegate;

@end
