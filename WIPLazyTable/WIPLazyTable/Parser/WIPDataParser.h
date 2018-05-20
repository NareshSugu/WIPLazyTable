//
//  WIPDataParser.h
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WIPCountryBioGraphy.h"
#import "WIPCountryBioGraphyRowsContent.h"

@interface WIPDataParser : NSOperation

@property (nonatomic, copy) void (^errorHandler)(NSError *error);

@property (nonatomic, strong, readonly) NSDictionary *countryBioGraphyList;
@property (nonatomic, strong, readonly) WIPCountryBioGraphy *countryBioGraphyRecord;

- (instancetype)initWithData:(NSData *)data;

@end
