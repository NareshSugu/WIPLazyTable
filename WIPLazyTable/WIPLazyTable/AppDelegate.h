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

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow                      *window;
@property (strong, nonatomic) WIPRootTableViewController    *rootTableViewController;
@property (strong, nonatomic) WIPAppCommon                  *appCommon;

@end

