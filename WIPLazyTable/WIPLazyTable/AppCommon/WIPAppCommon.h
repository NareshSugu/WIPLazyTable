//
//  WIPAppCommon.h
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "AppDelegate.h"

#define IDIOM    [[UIDevice currentDevice] userInterfaceIdiom]
#define IPAD     UIUserInterfaceIdiomPad
#define APP_COMMON_NUMBER_PARAMETER(smartphoneParam,tabletParam)  [WIPAppCommon numberParameterForSmartphone:(smartphoneParam) tablet:(tabletParam)]

@interface WIPAppCommon : NSObject

@property (nonatomic, assign) CGFloat standardVerticalMargin;

+ (CGFloat)numberParameterForSmartphone:(CGFloat)smartphoneParam tablet:(CGFloat)tabletParam;

@end
