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
#import "KVZCollectionViewDataSource.h"
#import "KVZTableViewDataSource.h"

@interface KVZContainerViewController () <KVZNewObjectViewControllerDelegate, KVZTableViewDataSourceDelegate, KVZCollectionViewDataSourceDelegate>

@property (strong, nonatomic) UITableViewController *tableViewController;
@property (strong, nonatomic) UICollectionViewController *collectionViewController;

@end

@implementation KVZContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableViewController *tableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"KVZTableViewController"];
    self.tableViewController = tableViewController;

    UICollectionViewController *collectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"KVZCollectionViewController"];
    self.collectionViewController = collectionViewController;

    [self addChildViewController:tableViewController];
    self.tableViewController.tableView.frame = self.view.frame;
    [self.view addSubview:tableViewController.tableView];
    [tableViewController didMoveToParentViewController:self];

    UIEdgeInsets collectionViewFixedContentInset = self.collectionViewController.collectionView.contentInset;
    collectionViewFixedContentInset.top = self.navigationController.navigationBar.bounds.size.height;
    [collectionViewController.collectionView setContentInset:collectionViewFixedContentInset];
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
        
        KVZCollectionViewDataSource *collectionDataSource = self.collectionViewController.collectionView.dataSource;
        collectionDataSource.delegate = self;
        
        KVZTableViewDataSource *tableDataSource = self.tableViewController.tableView.dataSource;
        tableDataSource.delegate = self;
    }
}

#pragma mark - KVZNewObjectViewControllerDelegate

- (void)addObjectViewController:(KVZNewObjectViewController *)viewController didCreateModelWithTitle:(NSString *)title {
    [[[KVZArrayDataSource alloc]init] saveNewModelWithName:title];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - KVZTableViewDataSourceDelegate

- (void)tableDataSourceDidChange:(KVZTableViewDataSource *)tableDataSource {
    [self.tableViewController.tableView reloadData];
}

#pragma mark - KVZCollectionViewDataSourceDelegate

- (void)collectionDataSourceDidChange:(KVZArrayDataSource *)collectionDataSource {
    [self.collectionViewController.collectionView reloadData];
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

@end
