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
        self.standardVerticalMargin = APP_COMMON_NUMBER_PARAMETER(5.0f, 10.0f);
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
