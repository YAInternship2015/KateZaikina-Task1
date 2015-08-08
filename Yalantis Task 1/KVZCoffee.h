//
//  KVZCoffee.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 08.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVZCoffee : NSObject

@property (strong, nonatomic, readonly) NSString *typeName;
@property (strong, nonatomic, readonly) NSString *imageName;

- (id) initWithTypeName: (NSString *) typeName andImageName: (NSString *) imageName;

@end
