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
    
    [self addChildViewController:tableViewController];
    self.tableViewController.tableView.frame = self.view.frame;
    [self.view addSubview:tableViewController.tableView];
    [tableViewController didMoveToParentViewController:self];

    UIEdgeInsets collectionViewFixedContentInset = self.collectionViewController.collectionView.contentInset;
    collectionViewFixedContentInset.top = self.navigationController.navigationBar.bounds.size.height;
    [collectionViewController.collectionView setContentInset:collectionViewFixedContentInset];
    
    UILongPressGestureRecognizer *longPress
    = [[UILongPressGestureRecognizer alloc]
       initWithTarget:self action:@selector(handleLongPress:)];
    CGFloat minimumPressDuration = 0.5;
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

#pragma mark - TableView NSFetchedResultsController

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableViewController.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    UITableView *tableView = self.tableViewController.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationRight];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableViewController.tableView endUpdates];
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    CGPoint location = [gestureRecognizer locationInView:self.collectionViewController.collectionView];
    NSIndexPath *indexPath = [self.collectionViewController.collectionView indexPathForItemAtPoint:location];
    UIGestureRecognizerState state = gestureRecognizer.state;
    
    
    if (indexPath != nil){
        switch (state) {
            case UIGestureRecognizerStateBegan:
                break;
            case UIGestureRecognizerStateChanged:
                break;
            case UIGestureRecognizerStateEnded: {
                KVZCollectionViewDataSource *collectionDataSource = (KVZCollectionViewDataSource *)self.collectionViewController.collectionView.dataSource;
                NSManagedObject *object = [collectionDataSource.fetchedResultsController objectAtIndexPath:indexPath];
                
                [[self managedObjectContext] deleteObject:object];
                [[self managedObjectContext] save:nil];
                //[self.collectionViewController.collectionView deleteItemsAtIndexPaths:@[indexPath]];
               
                [self.collectionViewController.collectionView reloadData];
                
                break;
            }
            default:
                break;
        }
    }
}

@end
