//
//  KVZCollectionViewCell.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 20.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZCollectionViewCell.h"

@interface KVZCollectionViewCell()

@property (nonatomic, weak) IBOutlet UIImageView *coffeeImageView;

@end

@implementation KVZCollectionViewCell

- (void)setUpWithCoffeeImage:(KVZCoffee *)coffee {
    self.coffeeImageView.image = [UIImage imageNamed:coffee.imageName];
}

@end