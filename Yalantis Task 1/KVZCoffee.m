//
//  KVZCoffee.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 08.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZCoffee.h"

@implementation KVZCoffee

- (id)initWithTypeName:(NSString *)typeName imageName:(NSString *)imageName {
    self = [super init];
    if (self) {
        _typeName = typeName;
        _imageName = imageName;
    }
    return self;
}

@end
