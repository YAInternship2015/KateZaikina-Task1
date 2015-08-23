//
//  KVZContainerViewController.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 23.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZContainerViewController.h"

@interface KVZContainerViewController ()
@property (weak, nonatomic) IBOutlet UIView *tableViewContainer;
@property (weak, nonatomic) IBOutlet UIView *collectionViewContainer;
- (IBAction)didChangeCoffeeView:(id)sender;


@end

@implementation KVZContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view bringSubviewToFront:self.tableViewContainer];
}

- (IBAction)didChangeCoffeeView:(id)sender {
    if ([self.tableViewContainer isEqual:[self.view.subviews lastObject]]) {
        
        [UIView animateWithDuration:0.3 animations:^{
            self.collectionViewContainer.alpha = 1.f;
            self.tableViewContainer.alpha = 0.f;
        } completion:^(BOOL finished) {
            [self.view bringSubviewToFront:self.collectionViewContainer];
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            self.tableViewContainer.alpha = 1.f;
            self.collectionViewContainer.alpha = 0.f;
        } completion:^(BOOL finished) {
            [self.view bringSubviewToFront:self.tableViewContainer];
        }];
    }
}
@end
