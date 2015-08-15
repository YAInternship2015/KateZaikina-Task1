//
//  AppDelegate.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 08.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "AppDelegate.h"
#import "KVZTableViewController.h"
#import "KVZDataSourceFactory.h"
#import "KVZArrayDataSource.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    id<UITableViewDataSource> coffeeArray = [KVZDataSourceFactory coffeeTableDataSource];
    KVZTableViewController *rootViewController = (KVZTableViewController *) self.window.rootViewController;
    rootViewController.tableViewDataSource = coffeeArray;
    return YES;
}

@end
