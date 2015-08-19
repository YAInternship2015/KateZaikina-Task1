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

@implementation KVZArrayDataSource

-(id) init {
    self = [super init];
    if (self) {
        self.array = [KVZDataSourceFactory coffeeModelArray];
    }
    return self;
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

@end
