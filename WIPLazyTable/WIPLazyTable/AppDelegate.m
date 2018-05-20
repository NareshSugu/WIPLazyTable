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

    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    _window = [[UIWindow alloc] initWithFrame:windowFrame];
    _rootTableViewController = [[WIPRootTableViewController alloc]init];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:_rootTableViewController];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    
    [UIView setTopWindow:self.window];

    [self setupAppCommon];
    
    [self exucuteNetworkRequest];

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
    [[_rootTableViewController navigationItem] setTitle:fetchedData[kNavigationTitle]];
    [_rootTableViewController.tableView reloadData];
    
}


@end
