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

@interface KVZContainerViewController () <KVZNewObjectViewControllerDelegate>

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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"addObjectViewControllerSegue"]) {
        KVZNewObjectViewController *addObjectViewController = segue.destinationViewController;
        addObjectViewController.delegate = self;
    } else if ([segue.identifier isEqualToString:@"collectionViewControllerSegue"]) {
        self.collectionViewController = segue.destinationViewController;
    } else if ([segue.identifier isEqualToString:@"tableViewControllerSegue"]) {
        self.tableViewController = segue.destinationViewController;
        
    }
}

#pragma mark - KVZNewObjectViewControllerDelegate

-(void)addObjectViewController:(KVZNewObjectViewController *)viewController didCreateModelWithTitle:(NSString *)
title{
    KVZArrayDataSource *tableViewDataSource = (KVZArrayDataSource *)self.tableViewController.tableView.dataSource;
    [tableViewDataSource addModelWithName:title];
    [self.tableViewController.tableView reloadData];
    KVZArrayDataSource *collectionViewDataSource = (KVZArrayDataSource *)self.collectionViewController.collectionView.dataSource;
    [collectionViewDataSource addModelWithName:title];
    [self.collectionViewController.collectionView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
