//
//  AppDelegate.m
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import "AppDelegate.h"
#import "WIPAppCommon.h"
#import "UIView+Autolayout.h"
#import "WIPServiceLayer.h"

@interface AppDelegate ()

@property (nonatomic, strong) WIPServiceLayer   *serviceLayer;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self exucuteNetworkRequest];

    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    _window = [[UIWindow alloc] initWithFrame:windowFrame];
    _rootTableViewController = [[WIPRootTableViewController alloc]init];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:_rootTableViewController];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    
    [UIView setTopWindow:self.window];

    [self setupAppCommon];
    

    return YES;
}

- (void)setupAppCommon {
    
    if (_appCommon == nil) {
        _appCommon = [[WIPAppCommon alloc] init];
    }
    
}

- (void)exucuteNetworkRequest {
    
    if (_serviceLayer == nil) {
        _serviceLayer = [[WIPServiceLayer alloc] initWithUrl:canadaStateUrl];
    }
    
}
- (void)handleError:(NSError *)error
{
    NSString *errorMessage = [error localizedDescription];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Error !!", @"")
                                                                   message:errorMessage
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"")
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action) {
                                                         // dissmissal of alert completed
                                                     }];
    
    [alert addAction:OKAction];
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
}

- (void)DataProvider:(NSDictionary *)fetchedData {
    
    _rootTableViewController.tableViewContentList = fetchedData;
    [_rootTableViewController.tableView reloadData];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
