//
//  KVZTableViewController.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 08.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KVZTableViewController : UITableViewController

#warning Как я писал в замечаниях к заданию, модели должны находиться в отдельном классе-датасорсе. Это не ответственности вью контроллера. В этом датасорсе внутри будет массив ячеек, а в *.h у него только необходимый вью контроллеру интерфейс для получения обзего количества моделей и модели по индексу.
@property (strong, nonatomic) NSArray *coffeeArray;

@end
