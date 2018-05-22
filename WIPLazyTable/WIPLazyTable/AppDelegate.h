//
//  AppDelegate.h
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WIPRootTableViewController.h"

@class WIPAppCommon;

#define SharedAppDelegate (AppDelegate *)[UIApplication sharedApplication].delegate
#define APP_COMMON [SharedAppDelegate appCommon]

static NSString * const canadaStateUrl =
@"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json";

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow                      *window;
@property (strong, nonatomic) WIPRootTableViewController    *rootTableViewController;
@property (strong, nonatomic) WIPAppCommon                  *appCommon;

- (void)handleError:(NSError *)error;
- (void)DataProvider:(NSDictionary *)fetchedData;

- (void)exucuteNetworkRequest;
- (void)closeNetWorkRequest;

@end

