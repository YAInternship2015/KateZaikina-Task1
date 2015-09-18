//
//  KVZTableViewController.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 18.09.15.
//  Copyright © 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZTableViewController.h"
#import "KVZTableViewDataSource.h"

@interface KVZTableViewController () <NSFetchedResultsControllerDelegate>

@end

@implementation KVZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    KVZTableViewDataSource *tableDataSource = (KVZTableViewDataSource *)self.tableView.dataSource;
    tableDataSource.fetchedResultsController.delegate = self;
    
}

#pragma mark - NSFetchedResultsController

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
        UITableView *tableView = self.tableView;
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
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

@end
