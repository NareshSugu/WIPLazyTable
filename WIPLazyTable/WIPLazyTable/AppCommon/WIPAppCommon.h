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

#define kCustomRowCount 7
#define IDIOM    [[UIDevice currentDevice] userInterfaceIdiom]
#define IPAD     UIUserInterfaceIdiomPad

#define APP_COMMON_NUMBER_PARAMETER(smartphoneParam,tabletParam)  [WIPAppCommon numberParameterForSmartphone:(smartphoneParam) tablet:(tabletParam)]

#define DEFAULT_TILE_IMAGE [UIImage imageNamed:@"wipro_logo"]

@interface WIPAppCommon : NSObject

@property (nonatomic, assign) CGFloat standardVerticalMargin;
@property (nonatomic, assign) CGFloat standardHorizontalMargin;
@property (nonatomic, assign) CGFloat standardTopMargin;


@property (nonatomic, assign) CGFloat standardCellRowHeight;

//use placeholder for Temp purpose
@property (nonatomic,strong) NSString* titlePalceholder;
@property (nonatomic,strong) NSString* descriptionPalceholder;

+ (CGFloat)numberParameterForSmartphone:(CGFloat)smartphoneParam tablet:(CGFloat)tabletParam;

@end
