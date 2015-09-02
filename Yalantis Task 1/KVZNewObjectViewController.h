//
//  KVZNewObjectViewController.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 23.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KVZCoffee.h"

@class KVZNewObjectViewController;

@protocol KVZNewObjectViewControllerDelegate <NSObject>

- (void)addObjectViewController:(KVZNewObjectViewController *)viewController didCreateModelWithTitle:(NSString *)
title;

@end

@interface KVZNewObjectViewController : UIViewController <UITextFieldDelegate>

#warning а нужно ли все это в *.h файле?
@property (nonatomic, strong) KVZCoffee *coffeeModel;
@property (nonatomic, weak) id<KVZNewObjectViewControllerDelegate> delegate;

@end
