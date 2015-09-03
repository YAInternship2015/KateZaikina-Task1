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

@property (weak, nonatomic) IBOutlet UIView *tableViewContainer;
@property (weak, nonatomic) IBOutlet UIView *collectionViewContainer;
@property (strong, nonatomic) UITableViewController *tableViewController;
@property (strong, nonatomic) UICollectionViewController *collectionViewController;

@end

@implementation KVZContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view bringSubviewToFront:self.tableViewContainer];
}

- (IBAction)didChangeCoffeeView:(id)sender {
#warning это конечно не nested view contollers, как я писал в требованиях. Недостаток Вашего решения состоит в том, что контроллеры таблицы и коллекшн вью не получают коллбеки типа viewWillAppear, viewDidAppear и т.д, они всегда считают, что видимы на экране. Из-за этого могут быть проблемы с UI в более сложных проектах. Nested контроллеры получают эти коллбека от своего parent контроллера и отрабатывают так, будто никакие они и не вложенные. Если у Вас есть время, переделайте на Nested схему
    
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
         KVZCollectionViewDataSource *collectionDataSource = self.collectionViewController.collectionView.dataSource;
        collectionDataSource.delegate = self;
    } else if ([segue.identifier isEqualToString:@"tableViewControllerSegue"]) {
        self.tableViewController = segue.destinationViewController;
        KVZTableViewDataSource *tableDataSource = self.tableViewController.tableView.dataSource;
        tableDataSource.delegate = self;

    }
}

#pragma mark - KVZNewObjectViewControllerDelegate

- (void)addObjectViewController:(KVZNewObjectViewController *)viewController didCreateModelWithTitle:(NSString *)
title {
    [[[KVZArrayDataSource alloc]init] saveNewCoffeeModelWithName:title];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - KVZTableViewDataSourceDelegate

- (void)tableDataSourceDidChange:(KVZTableViewDataSource *)tableDataSource{
    [self.tableViewController.tableView reloadData];
}

#pragma mark - KVZCollectionViewDataSourceDelegate

- (void)collectionDataSourceDidChange:(KVZArrayDataSource *)collectionDataSource{
    [self.collectionViewController.collectionView reloadData];
}


@end
