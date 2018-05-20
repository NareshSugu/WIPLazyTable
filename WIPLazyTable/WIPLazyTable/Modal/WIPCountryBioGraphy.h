//
//  WIPCountryBioGraphy.h
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WIPCountryBioGraphyRowsContent.h"

@interface WIPCountryBioGraphy : NSObject

@property (nonatomic, strong) NSString  *navigationTitle;

@property (nonatomic, strong) WIPCountryBioGraphyRowsContent  *rowsContent;

@end

