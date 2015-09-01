//
//  KVZStringValidator.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 23.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVZStringValidator : NSObject

- (BOOL)isValidModelTitle:(NSString *)title error:(NSError **)error;

@end
