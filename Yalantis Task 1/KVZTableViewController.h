//
//  KVZTableViewController.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 08.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KVZTableViewController : UITableViewController

@property (nonatomic, strong) id <UITableViewDataSource> tableViewDataSource;

@end
