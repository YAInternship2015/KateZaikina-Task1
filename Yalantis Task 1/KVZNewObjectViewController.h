//
//  KVZNewObjectViewController.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 23.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KVZNewObjectViewController;

@protocol KVZNewObjectViewControllerDelegate <NSObject>

- (void)addObjectViewController:(KVZNewObjectViewController *)viewController didCreateModelWithTitle:(NSString *)
title;

@end

@interface KVZNewObjectViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) id<KVZNewObjectViewControllerDelegate> delegate;

@end
