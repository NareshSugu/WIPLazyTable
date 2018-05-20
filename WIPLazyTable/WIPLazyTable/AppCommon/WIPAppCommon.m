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
        self.standardVerticalMargin =   APP_COMMON_NUMBER_PARAMETER(10.0f, 10.0f);
        self.standardCellRowHeight =    APP_COMMON_NUMBER_PARAMETER(44.0f, 44.0f);
        self.titlePalceholder = @"Title";
        self.descriptionPalceholder = @"This is atest description placeholder. the contents should load from a rest url and replace current place holder";
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

@end
