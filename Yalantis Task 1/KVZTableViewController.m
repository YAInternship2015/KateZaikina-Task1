//
//  KVZTableViewController.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 08.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZTableViewController.h"

@implementation KVZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
}

#warning если есть желание, попробуйте подсунуть датасорс прямо в сториборде. Тогда кода вообще не понадобится. В сцену контроллера в сториборде можно добавить просто Object, задать ему класс Вашего датасорса, и прилинковать аутлет таблицы datasource к этому Object
- (void)setTableViewDataSource:(id<UITableViewDataSource>)tableViewDataSource {
    _tableViewDataSource = tableViewDataSource;
    self.tableView.dataSource = tableViewDataSource;
}

@end
