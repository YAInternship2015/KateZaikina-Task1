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

#warning - (void)viewDidLoad {
- (void) viewDidLoad {
#warning здесь не нужна пустая строка
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
#warning здесь не нужна пустая строка
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning здесь не нужна пустая строка
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning здесь не нужна пустая строка
    return [self.coffeeArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
#warning здесь не нужна пустая строка
    static NSString *cellIdentifier = @"coffeeCell";
    
    KVZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
#warning здесь не нужна пустая строка
    KVZCoffee *coffee = [self.coffeeArray objectAtIndex:indexPath.row];
#warning здесь не нужна пустая строка
    
    cell.coffeeImageView.image = [UIImage imageNamed:coffee.imageName];
#warning здесь не нужна пустая строка
    cell.coffeeTypeLabel.text = coffee.typeName;
#warning здесь не нужна пустая строка
    
    return cell;
}

#warning здесь тоже не нужны пустые строки :D


@end
