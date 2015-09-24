//
//  KVZNewObjectViewController.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 23.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZNewObjectViewController.h"
#import "KVZStringValidator.h"
#import "KVZDataSourceFactory.h"
#import "KVZCoreDataManager.h"

@interface KVZNewObjectViewController ()

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *addCoffeeField;

@end

@implementation KVZNewObjectViewController

- (NSManagedObjectContext *)managedObjectContext {
    return [[KVZCoreDataManager sharedManager] managedObjectContext];
}

- (IBAction)saveNewCoffeeButton:(UIButton *)sender {
    [self.addCoffeeField resignFirstResponder];
    
    KVZStringValidator *validator = [[KVZStringValidator alloc] init];
    NSError *error = nil;
    NSString *coffeeName = self.addCoffeeField.text;
    if ([validator isValidModelTitle:coffeeName error:&error]) {
        [KVZDataSourceFactory newCoffeeModel:coffeeName];
        [[self managedObjectContext] save:&error];
        
        NSString *localizedSucceessTitleString = NSLocalizedString(@"New Coffee Drink is saved!", nil);
        NSString *localizedOkeyString = NSLocalizedString(@"Okey", nil);

        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:localizedSucceessTitleString
                                                           message:nil
                                                          delegate:self
                                                 cancelButtonTitle:localizedOkeyString
                                                 otherButtonTitles:nil, nil];
        [alertView show];
    } else {
        NSString *localizedOkeyString = NSLocalizedString(@"Okey", nil);
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:error.localizedDescription
                                                           message:error.localizedRecoverySuggestion
                                                          delegate:self
                                                 cancelButtonTitle:localizedOkeyString
                                                 otherButtonTitles:nil, nil];
        [alertView show];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end