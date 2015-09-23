//
//  KVZCollectionViewController.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 18.09.15.
//  Copyright © 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZCollectionViewController.h"
#import "KVZCollectionViewDataSource.h"

@interface KVZCollectionViewController () <NSFetchedResultsControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation KVZCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KVZCollectionViewDataSource *collectionDataSource = (KVZCollectionViewDataSource *)self.collectionView.dataSource;
    collectionDataSource.fetchedResultsController.delegate = self;
    
#warning рекогнайзер надо добавить в сториборде
    UILongPressGestureRecognizer *longPress
    = [[UILongPressGestureRecognizer alloc]
       initWithTarget:self action:@selector(handleLongPress:)];
    float minimumPressDuration = 0.5;
    longPress.minimumPressDuration = minimumPressDuration;
    [self.collectionView addGestureRecognizer:longPress];
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


- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
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
