//
//  KVZTableViewCell.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 08.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZTableViewCell.h"

@interface KVZTableViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *coffeeImageView;
@property (nonatomic, weak) IBOutlet UILabel *coffeeTypeLabel;

@end

@implementation KVZTableViewCell

- (void)setUpWithCoffee:(KVZCoffee *)coffee {
    self.coffeeImageView.image = [UIImage imageNamed:coffee.imageName];
    self.coffeeTypeLabel.text = coffee.typeName;
}

@end
