//
//  KVZArrayDataSourceFactory.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 15.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZDataSourceFactory.h"
#import "KVZCoffee.h"

@implementation KVZDataSourceFactory

+(NSArray *)coffeeModelArray {
    KVZCoffee *espresso = [[KVZCoffee alloc] initWithTypeName:@"espresso" imageName:@"espresso.jpg"];
    KVZCoffee *americano = [[KVZCoffee alloc] initWithTypeName:@"americano" imageName:@"americano.jpg"];
    KVZCoffee *cappuccino = [[KVZCoffee alloc] initWithTypeName:@"cappuccino" imageName:@"cappuccino.jpg"];
    KVZCoffee *latte = [[KVZCoffee alloc] initWithTypeName:@"latte" imageName:@"latte.jpg"];
    KVZCoffee *lattemacchiato = [[KVZCoffee alloc] initWithTypeName:@"latte-macchiato" imageName:@"latte-macchiato.jpg"];
    KVZCoffee *mocha = [[KVZCoffee alloc] initWithTypeName:@"mocha" imageName:@"mocha.jpg"];
    KVZCoffee *glace = [[KVZCoffee alloc] initWithTypeName:@"glace" imageName:@"glace.jpg"];
    KVZCoffee *irishcoffee = [[KVZCoffee alloc] initWithTypeName:@"irish-coffee" imageName:@"irish-coffee.jpg"];
    KVZCoffee *frappe = [[KVZCoffee alloc] initWithTypeName:@"frappe" imageName:@"frappe.jpg"];
    KVZCoffee *viennecoffee = [[KVZCoffee alloc] initWithTypeName:@"vienne-coffee" imageName:@"vienne-cappuccino.jpg"];
    NSArray *arrayOfCoffee = [NSArray arrayWithObjects:espresso, americano, cappuccino, latte, lattemacchiato, mocha, glace, irishcoffee, frappe, viennecoffee, nil];
    
    return arrayOfCoffee;
}

@end
