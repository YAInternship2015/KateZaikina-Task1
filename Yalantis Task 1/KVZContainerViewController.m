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
#import "KVZDataManager.h"
#import "KVZCoffee.h"

@interface KVZContainerViewController () <KVZNewObjectViewControllerDelegate, NSFetchedResultsControllerDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) UITableViewController *tableViewController;
@property (strong, nonatomic) UICollectionViewController *collectionViewController;

@end

@implementation KVZContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableViewController *tableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"KVZTableViewController"];
    self.tableViewController = tableViewController;
    KVZTableViewDataSource *tableDataSource = (KVZTableViewDataSource *)self.tableViewController.tableView.dataSource;
    tableDataSource.fetchedResultsController.delegate = self;

    UICollectionViewController *collectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"KVZCollectionViewController"];
    self.collectionViewController = collectionViewController;
    KVZCollectionViewDataSource *collectionDataSource = (KVZCollectionViewDataSource *)self.collectionViewController.collectionView.dataSource;
    collectionDataSource.fetchedResultsController.delegate = self;
    
    [self addChildViewController:tableViewController];
    self.tableViewController.tableView.frame = self.view.frame;
    [self.view addSubview:tableViewController.tableView];
    [tableViewController didMoveToParentViewController:self];

    UILongPressGestureRecognizer *longPress
    = [[UILongPressGestureRecognizer alloc]
       initWithTarget:self action:@selector(handleLongPress:)];
    float minimumPressDuration = 0.5;
    longPress.minimumPressDuration = minimumPressDuration;
    [self.collectionViewController.collectionView addGestureRecognizer:longPress];
}

- (NSManagedObjectContext *)managedObjectContext {
    return [[KVZDataManager sharedManager] managedObjectContext];
}

- (IBAction)didChangeCoffeeView:(id)sender {
    if ([self.childViewControllers.lastObject isEqual:self.tableViewController]) {
        [self cycleFromViewController:self.tableViewController toViewController:self.collectionViewController];
    }
    else if ([self.childViewControllers.lastObject isEqual:self.collectionViewController]) {
        [self cycleFromViewController:self.collectionViewController toViewController:self.tableViewController];
    }
}

#pragma mark - UIStoryboard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addObjectViewControllerSegue"]) {
        KVZNewObjectViewController *addObjectViewController = segue.destinationViewController;
        addObjectViewController.delegate = self;
    }
}

#pragma mark - KVZNewObjectViewControllerDelegate

- (void)addObjectViewController:(KVZNewObjectViewController *)viewController didCreateModelWithTitle:(NSString *)title{
    KVZCoffee *newCoffeeObject = [NSEntityDescription insertNewObjectForEntityForName:@"KVZCoffee" inManagedObjectContext:[self managedObjectContext]];
    newCoffeeObject.typeName = title;
    newCoffeeObject.imageName = @"defaultCoffee.gif";
    
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Nested Controller methods

- (void)cycleFromViewController:(UIViewController *)oldController toViewController:(UIViewController *)newController {
    [oldController willMoveToParentViewController:nil];
    [self addChildViewController:newController];
    float animationTimeInSeconds = 0.2;
    
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

#pragma mark - NSFetchedResultsController

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    KVZTableViewDataSource *tableDataSource = (KVZTableViewDataSource *)self.tableViewController.tableView.dataSource;
    KVZCollectionViewDataSource *collectionDataSource = (KVZCollectionViewDataSource *)self.collectionViewController.collectionView.dataSource;
    
    if ([tableDataSource.fetchedResultsController isEqual:controller]) {
        UITableView *tableView = self.tableViewController.tableView;
        [tableView beginUpdates];
    } else if ([collectionDataSource.fetchedResultsController isEqual:controller]) {
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    KVZTableViewDataSource *tableDataSource = (KVZTableViewDataSource *)self.tableViewController.tableView.dataSource;
    KVZCollectionViewDataSource *collectionDataSource = (KVZCollectionViewDataSource *)self.collectionViewController.collectionView.dataSource;
    
    if ([tableDataSource.fetchedResultsController isEqual:controller]) {
        UITableView *tableView = self.tableViewController.tableView;
        switch (type) {
            case NSFetchedResultsChangeInsert: {
                [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationRight];
            }
                break;
            case NSFetchedResultsChangeDelete: {
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            }
                break;
            case NSFetchedResultsChangeUpdate: {
                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            }
                break;
            default: {
                
            }
        }
    } else if ([collectionDataSource.fetchedResultsController isEqual:controller]) {
        UICollectionView *collectionView = self.collectionViewController.collectionView;
        switch(type) {
            case NSFetchedResultsChangeInsert: {
                [collectionView insertItemsAtIndexPaths:@[newIndexPath]];
            }
                break;
            case NSFetchedResultsChangeDelete: {
                [collectionView deleteItemsAtIndexPaths:@[indexPath]];
            }
                break;
            case NSFetchedResultsChangeUpdate: {
                [collectionView reloadItemsAtIndexPaths:@[indexPath]];
            }
                break;
            default: {
                  
            }
        }
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    KVZTableViewDataSource *tableDataSource = (KVZTableViewDataSource *)self.tableViewController.tableView.dataSource;
    KVZCollectionViewDataSource *collectionDataSource = (KVZCollectionViewDataSource *)self.collectionViewController.collectionView.dataSource;
    
    if ([tableDataSource.fetchedResultsController isEqual:controller]) {
        UITableView *tableView = self.tableViewController.tableView;
        [tableView endUpdates];
    } else if ([collectionDataSource.fetchedResultsController isEqual:controller]) {
  }
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint location = [gestureRecognizer locationInView:self.collectionViewController.collectionView];
        NSIndexPath *indexPath = [self.collectionViewController.collectionView indexPathForItemAtPoint:location];
        
        if (indexPath != nil){
            KVZCollectionViewDataSource *collectionDataSource = (KVZCollectionViewDataSource *)self.collectionViewController.collectionView.dataSource;
            NSManagedObject *object = [collectionDataSource.fetchedResultsController objectAtIndexPath:indexPath];
            [[self managedObjectContext] deleteObject:object];
            
            NSError *error = nil;
            if (![self.managedObjectContext save:&error]) {
                NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
                abort();
            }
        }
    }
}

@end
