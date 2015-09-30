//
//  KVZContainerViewController.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 23.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZContainerViewController.h"
#import "KVZNewObjectViewController.h"
#import "KVZCollectionViewDataSource.h"
#import "KVZTableViewDataSource.h"
#import "KVZCoreDataManager.h"
#import "KVZCoffee.h"
#import "KVZTableViewController.h"
#import "KVZCollectionViewController.h"

static const NSTimeInterval kAnimationDuration = 0.2;

@interface KVZContainerViewController () <NSFetchedResultsControllerDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) KVZTableViewController *tableViewController;
@property (strong, nonatomic) KVZCollectionViewController *collectionViewController;

@end

@implementation KVZContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KVZTableViewController *tableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"KVZTableViewController"];
    self.tableViewController = tableViewController;

    KVZCollectionViewController *collectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"KVZCollectionViewController"];
    self.collectionViewController = collectionViewController;
    
    [self addChildViewController:self.tableViewController];
    self.tableViewController.tableView.frame = self.view.frame;
    [self.view addSubview:self.tableViewController.tableView];
    [self.tableViewController didMoveToParentViewController:self];
}

- (NSManagedObjectContext *)managedObjectContext {
    return [[KVZCoreDataManager sharedManager] managedObjectContext];
}

- (IBAction)didChangeCoffeeView:(id)sender {
    if ([self.childViewControllers.lastObject isEqual:self.tableViewController]) {
        [self cycleFromViewController:self.tableViewController toViewController:self.collectionViewController];
    }
    else if ([self.childViewControllers.lastObject isEqual:self.collectionViewController]) {
        [self cycleFromViewController:self.collectionViewController toViewController:self.tableViewController];
    }
}

#pragma mark - Nested Controller methods

- (void)cycleFromViewController:(UIViewController *)oldController toViewController:(UIViewController *)newController {
    [oldController willMoveToParentViewController:nil];
    [self addChildViewController:newController];
    
    float animationTimeInSeconds = kAnimationDuration;
    [self transitionFromViewController:oldController toViewController:newController
                              duration:animationTimeInSeconds
                               options:0
                            animations:^{
                                newController.view.alpha = 1.f;
                                oldController.view.alpha = 0.f;
                            }
                            completion:^(BOOL finished) {
                                [oldController removeFromParentViewController];
                                [newController didMoveToParentViewController:self];
                            }];
    
}

@end
