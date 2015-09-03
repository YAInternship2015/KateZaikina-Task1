//
//  KVZTableViewDataSource.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 03.09.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZTableViewDataSource.h"
#import "KVZTableViewCell.h"
#import "KVZArrayDataSource.h"
#import "KVZConstants.h"

@interface KVZTableViewDataSource ()
@property (nonatomic, strong) KVZArrayDataSource *arrayDataSource;
@end

@implementation KVZTableViewDataSource

- (id)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(reloadViewNotification:)
                                                     name:KVZDataFileContentDidChangeNotificationName
                                                   object:nil];
    }
    return self;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)reloadViewNotification:(NSNotification *)notification {
    if ([self.delegate respondsToSelector:@selector(tableDataSourceDidChange:)]){
        [self.delegate tableDataSourceDidChange:self];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayDataSource.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"coffeeCell";
    KVZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    KVZCoffee *coffee = [self.arrayDataSource.array objectAtIndex:indexPath.row];
    [cell setUpWithCoffee:coffee];
    
    return cell;
}


@end
