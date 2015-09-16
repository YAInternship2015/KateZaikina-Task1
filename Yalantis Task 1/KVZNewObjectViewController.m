//
//  KVZNewObjectViewController.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 23.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZNewObjectViewController.h"
#import "KVZStringValidator.h"
#import "KVZDataManager.h"

@interface KVZNewObjectViewController ()

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *addCoffeeField;
@property (nonatomic, strong) KVZCoffee *coffeeModel;

@end

@implementation KVZNewObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)saveNewCoffeeButton:(UIButton *)sender {
    [self.addCoffeeField resignFirstResponder];
    
    KVZStringValidator *validator = [[KVZStringValidator alloc] init];
    NSError *error = nil;
    if ([validator isValidModelTitle:self.addCoffeeField.text error:&error]) {
       [self.delegate addObjectViewController:self didCreateModelWithTitle:self.addCoffeeField.text];
        NSString *localizedSucceessTitleString = NSLocalizedString(@"New Coffee Drink is saved!", nil);
        NSString *localizedOkeyString = NSLocalizedString(@"Okey", nil);

        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:localizedSucceessTitleString
                                                           message:nil
                                                          delegate:self
                                                 cancelButtonTitle:localizedOkeyString
                                                 otherButtonTitles:nil, nil];
        [alertView show];
    }else {
        NSString *localizedOkeyString = NSLocalizedString(@"Okey", nil);
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:error.localizedDescription
                                                           message:error.localizedRecoverySuggestion
                                                          delegate:self
                                                 cancelButtonTitle:localizedOkeyString
                                                 otherButtonTitles:nil, nil];
        [alertView show];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}



@end