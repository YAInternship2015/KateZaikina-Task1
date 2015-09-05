//
//  KVZStringValidator.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 23.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZStringValidator.h"

@implementation KVZStringValidator

- (BOOL)isValidModelTitle:(NSString *)title error:(NSError **)error {
    BOOL success = title.length > 3;
   
    if (!success) {
        if (error) {
            *error = [NSError errorWithDomain:@"KVZStringValidator"
                                         code:-3
                                     userInfo:nil];
        }
    }
    return success;
}

@end
