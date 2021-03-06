//
//  WIPAppCommon.m
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import "WIPAppCommon.h"

@implementation WIPAppCommon

- (id) init {
    self = [super init];
    if(self){
        self.standardVerticalMargin =   APP_COMMON_NUMBER_PARAMETER(5.0f, 10.0f);
        self.standardHorizontalMargin =  APP_COMMON_NUMBER_PARAMETER(5.0f, 10.0f);
        
        self.standardTopMargin =       APP_COMMON_NUMBER_PARAMETER(5.0f, 10.0f);
        self.standardBottomMargin =     APP_COMMON_NUMBER_PARAMETER(5.0f, 10.0f);
        self.standardLeadingMargin =    APP_COMMON_NUMBER_PARAMETER(10.0f, 20.0f);
        self.standardTrailingMargin =   APP_COMMON_NUMBER_PARAMETER(10.0f, 20.0f);

        self.standardCellRowHeight =    APP_COMMON_NUMBER_PARAMETER(200.0f, 200.0f);
        
        self.standardCellImageViewWidth =    APP_COMMON_NUMBER_PARAMETER(100.0f, 300.0f);
        self.standardCellImageViewHeight =    APP_COMMON_NUMBER_PARAMETER(100.0f, 300.0f);
        self.standardCellImageSize = CGSizeMake(_standardCellImageViewWidth, _standardCellImageViewHeight);

        self.cellTitleLabelFontSize =       APP_COMMON_NUMBER_PARAMETER(16.0f, 24.0f);
        self.cellSubtitleLabelFontSize =    APP_COMMON_NUMBER_PARAMETER(12.0f, 20.0f);

        self.titlePalceholder =         @"No Title";
        self.descriptionPalceholder =     @"No Descriptiption Available";
    }
    return self;
}

+ (CGFloat)numberParameterForSmartphone:(CGFloat)smartphoneParam tablet:(CGFloat)tabletParam
{
    if(IDIOM == IPAD){
        return tabletParam;
    }
    return smartphoneParam;
    
}

+ (CGSize)sizeParameterForSmartphone:(CGSize)smartphoneParam tablet:(CGSize)tabletParam{
    
    if(IDIOM == IPAD){
        return tabletParam;
    }
    return smartphoneParam;

}

@end
