//
//  KVZContainerViewController.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 23.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZContainerViewController.h"
#import "KVZNewObjectViewController.h"
#import "KVZArrayDataSource.h"
#import "KVZDataSourceFactory.h"

@interface KVZContainerViewController () <KVZNewObjectViewControllerDelegate, KVZArrayDataSourceDelegate>

@property (weak, nonatomic) IBOutlet UIView *tableViewContainer;
@property (weak, nonatomic) IBOutlet UIView *collectionViewContainer;
@property (strong, nonatomic) UITableViewController *tableViewController;
@property (strong, nonatomic) UICollectionViewController *collectionViewController;

- (IBAction)didChangeCoffeeView:(id)sender;

@end

@implementation KVZContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view bringSubviewToFront:self.tableViewContainer];
}

- (IBAction)didChangeCoffeeView:(id)sender {
    if ([self.tableViewContainer isEqual:[self.view.subviews lastObject]]) {
        [UIView animateWithDuration:0.2 animations:^{
            self.collectionViewContainer.alpha = 1.f;
            self.tableViewContainer.alpha = 0.f;
        } completion:^(BOOL finished) {
            [self.view bringSubviewToFront:self.collectionViewContainer];
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.tableViewContainer.alpha = 1.f;
            self.collectionViewContainer.alpha = 0.f;
        } completion:^(BOOL finished) {
            [self.view bringSubviewToFront:self.tableViewContainer];
        }];
    }
}

#pragma mark - UIStoryboard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"addObjectViewControllerSegue"]) {
        KVZNewObjectViewController *addObjectViewController = segue.destinationViewController;
        addObjectViewController.delegate = self;
    } else if ([segue.identifier isEqualToString:@"collectionViewControllerSegue"]) {
        self.collectionViewController = segue.destinationViewController;
        KVZArrayDataSource *arrayDataSource = (id)self.collectionViewController.collectionView.dataSource;
        arrayDataSource.delegate = self;
    } else if ([segue.identifier isEqualToString:@"tableViewControllerSegue"]) {
        self.tableViewController = segue.destinationViewController;
        KVZArrayDataSource *arrayDataSource = (id)self.tableViewController.tableView.dataSource;
        arrayDataSource.delegate = self;

    }
}

#pragma mark - KVZNewObjectViewControllerDelegate

- (void)addObjectViewController:(KVZNewObjectViewController *)viewController didCreateModelWithTitle:(NSString *)
title {
    [KVZDataSourceFactory saveNewCoffeeModelWithName:title];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - KVZArrayDataSourceDelegate

- (void)arrayDataSourceDidChange:(KVZArrayDataSource *)arrayDataSource
{
    if ([arrayDataSource isEqual:self.collectionViewController.collectionView.dataSource])
    {
        [self.collectionViewController.collectionView reloadData];
    }
    else if ([arrayDataSource isEqual:self.tableViewController.tableView.dataSource])
    {
        [self.tableViewController.tableView reloadData];
    }
}

@end
