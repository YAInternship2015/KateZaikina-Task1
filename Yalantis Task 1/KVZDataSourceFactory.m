//
//  KVZArrayDataSourceFactory.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 15.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZDataSourceFactory.h"
#import "KVZCoffee.h"
#import "KVZArrayDataSource.h"

@implementation KVZDataSourceFactory

+(id <UITableViewDataSource>)coffeeTableDataSource {

    KVZCoffee *espresso = [[KVZCoffee alloc] initWithTypeName:@"espresso" andImageName:@"espresso.jpg"];
    KVZCoffee *americano = [[KVZCoffee alloc] initWithTypeName:@"americano" andImageName:@"americano.jpg"];
    KVZCoffee *cappuccino = [[KVZCoffee alloc] initWithTypeName:@"cappuccino" andImageName:@"cappuccino.jpg"];
    KVZCoffee *latte = [[KVZCoffee alloc] initWithTypeName:@"latte" andImageName:@"latte.jpg"];
    KVZCoffee *lattemacchiato = [[KVZCoffee alloc] initWithTypeName:@"latte-macchiato" andImageName:@"latte-macchiato.jpg"];
    KVZCoffee *mocha = [[KVZCoffee alloc] initWithTypeName:@"mocha" andImageName:@"mocha.jpg"];
    KVZCoffee *glace = [[KVZCoffee alloc] initWithTypeName:@"glace" andImageName:@"glace.jpg"];
    KVZCoffee *irishcoffee = [[KVZCoffee alloc] initWithTypeName:@"irish-coffee" andImageName:@"irish-coffee.jpg"];
    KVZCoffee *frappe = [[KVZCoffee alloc] initWithTypeName:@"frappe" andImageName:@"frappe.jpg"];
    KVZCoffee *viennecoffee = [[KVZCoffee alloc] initWithTypeName:@"vienne-coffee" andImageName:@"vienne-cappuccino.jpg"];
    NSArray *arrayOfCoffee = [NSArray arrayWithObjects:espresso, americano, cappuccino, latte, lattemacchiato, mocha, glace, irishcoffee, frappe, viennecoffee, nil];
    
    return [[KVZArrayDataSource alloc] initWithArray:arrayOfCoffee];;
}

@end
