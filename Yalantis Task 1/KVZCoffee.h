//
//  KVZCoffee.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 08.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVZCoffee : NSObject

@property (nonatomic, strong, readonly) NSString *typeName;
@property (nonatomic, strong, readonly) NSString *imageName;

- (id)initWithTypeName:(NSString *)typeName imageName:(NSString *)imageName;

@end
