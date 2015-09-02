//
//  KVZNewObjectViewController.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 23.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "KVZNewObjectViewController.h"
#import "KVZStringValidator.h"

@interface KVZNewObjectViewController ()

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *addCoffeeField;
#warning  методы можно не выносить в @interface секцию
- (IBAction)saveNewCoffeeButton:(UIButton *)sender;

@end

@implementation KVZNewObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#warning делегат лучше установить в сториборде
    self.addCoffeeField.delegate = self;
}

- (IBAction)saveNewCoffeeButton:(UIButton *)sender {
    [self.addCoffeeField resignFirstResponder];
    
    KVZStringValidator *validator = [[KVZStringValidator alloc] init];
    NSError *error = nil;
    if ([validator isValidModelTitle:self.addCoffeeField.text error:&error]){
        [self.delegate addObjectViewController:self didCreateModelWithTitle:self.addCoffeeField.text];
#warning Все тексты, которые появляются в коде и которые увидит юзер в UI, нужно вынести в файл Localizable.strings. Почитайте, что это такое, в гугл
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:@"New Coffee Drink is saved!" delegate:self cancelButtonTitle:@"Okey" otherButtonTitles:nil, nil];
        [alertView show];
    }else {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Oops, can't save new coffee drink!" message:@"Name should be more than 3 characters." delegate:self cancelButtonTitle:@"Okey" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


@end