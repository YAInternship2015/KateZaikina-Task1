//
//  KVZTableViewController.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 08.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZTableViewController.h"
#import "KVZTableViewCell.h"
#import "KVZCoffee.h"

@interface KVZTableViewController ()

@end

@implementation KVZTableViewController

- (void) viewDidLoad {

    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.coffeeArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"coffeeCell";
    
    KVZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
   
    KVZCoffee *coffee = [self.coffeeArray objectAtIndex:indexPath.row];
    
    
    cell.coffeeImageView.image = [UIImage imageNamed:coffee.imageName];
    
    cell.coffeeTypeLabel.text = coffee.typeName;
    
    
    return cell;
}




@end
