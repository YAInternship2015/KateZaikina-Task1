//
//  KVZTableViewDataSource.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 03.09.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class KVZTableViewDataSource;

@protocol KVZTableViewDataSourceDelegate <NSObject>

- (void)tableDataSourceDidChange:(KVZTableViewDataSource *)tableDataSource;

@end

@interface KVZTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, weak) id<KVZTableViewDataSourceDelegate> delegate;

@end
