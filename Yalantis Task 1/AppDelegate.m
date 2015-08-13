//
//  AppDelegate.m
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 08.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "AppDelegate.h"
#import "KVZCoffee.h"
#import "KVZTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
#warning В аппделегате должно быть минимум кода. В идеале его здесь не должно быть вообще. Создание моделей должно переехать в объект-датасорс, который будет создавать и хранить вью контроллер
    KVZCoffee *espresso = [[KVZCoffee alloc] initWithTypeName:@"espresso" andImageName:@"espresso.jpg"];
    KVZCoffee *americano = [[KVZCoffee alloc] initWithTypeName:@"americano" andImageName:@"americano.jpg"];
    KVZCoffee *cappuccino = [[KVZCoffee alloc] initWithTypeName:@"cappuccino" andImageName:@"cappuccino.jpg"];
    KVZCoffee *latte = [[KVZCoffee alloc] initWithTypeName:@"latte" andImageName:@"latte.jpg"];
    KVZCoffee *lattemacchiato = [[KVZCoffee alloc] initWithTypeName:@"latte-macchiato" andImageName:@"latte-macchiato.jpg"];
    KVZCoffee *mocha = [[KVZCoffee alloc] initWithTypeName:@"mocha" andImageName:@"mocha.jpg"];
    KVZCoffee *glace = [[KVZCoffee alloc] initWithTypeName:@"glace" andImageName:@"glace.jpg"];
    KVZCoffee *irishcoffee = [[KVZCoffee alloc] initWithTypeName:@"irish-coffee" andImageName:@"irish-coffee.jpg"];
    KVZCoffee *frappe = [[KVZCoffee alloc] initWithTypeName:@"frappe" andImageName:@"frappe.jpg"];
    KVZCoffee *viennecoffee = [[KVZCoffee alloc] initWithTypeName:@"vienne-coffee" andImageName:@"vienne-cappuccino.jpg"];
    
    NSArray *arrayOfCoffee = [NSArray arrayWithObjects:espresso, americano, cappuccino, latte, lattemacchiato, mocha, glace, irishcoffee, frappe, viennecoffee, nil];
    
    KVZTableViewController *rootViewController = (KVZTableViewController *) self.window.rootViewController;
    
    rootViewController.coffeeArray = arrayOfCoffee;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
