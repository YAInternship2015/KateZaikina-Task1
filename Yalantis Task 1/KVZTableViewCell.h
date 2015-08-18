//
//  KVZTableViewCell.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 08.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVZTableViewCell : UITableViewCell

#warning нет необходимости показывать здесь аутлеты. Это уже детали внутренней реализации. Достаточно реализовать метод setupWithCoffie:, в котором ячейка будет себя сама заполнять моделью

@property (nonatomic, weak) IBOutlet UIImageView *coffeeImageView;
@property (nonatomic, weak) IBOutlet UILabel *coffeeTypeLabel;

@end
