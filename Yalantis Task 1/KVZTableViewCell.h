//
//  KVZTableViewCell.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 08.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVZTableViewCell : UITableViewCell

#warning эти свойства нет необходимости показывать в *.h файле. Если вы реализуете метод setupWith<Имя вашей модели>:, то эти свойства переедут в *.m файл. Не нужно показывать в *.h файле ничего лишнего, только то, что необходимо для работы других объектов с данным классом

@property (weak, nonatomic) IBOutlet UIImageView *coffeeImageView;
@property (weak, nonatomic) IBOutlet UILabel *coffeeTypeLabel;
@end
