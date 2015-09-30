//
//  KVZCollectionViewController.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 18.09.15.
//  Copyright © 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZCollectionViewController.h"
#import "KVZCollectionViewDataSource.h"

static NSString * const reuseIdentifier = @"Cell";

@interface KVZCollectionViewController () <NSFetchedResultsControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation KVZCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KVZCollectionViewDataSource *collectionDataSource = (KVZCollectionViewDataSource *)self.collectionView.dataSource;
    collectionDataSource.fetchedResultsController.delegate = self;
}

#pragma mark - NSFetchedResultsController

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
        UICollectionView *collectionView = self.collectionView;
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

- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint location = [gestureRecognizer locationInView:self.collectionView];
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:location];
        
        if (indexPath != nil){
            KVZCollectionViewDataSource *collectionDataSource = (KVZCollectionViewDataSource *)self.collectionView.dataSource;
            NSManagedObject *object = [collectionDataSource.fetchedResultsController objectAtIndexPath:indexPath];
            NSManagedObjectContext *mc = collectionDataSource.fetchedResultsController.managedObjectContext;
            [mc deleteObject:object];
            
            NSError *error = nil;
            if (![mc save:&error]) {
                NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
                abort();
            }
        }
    }
}

@end
