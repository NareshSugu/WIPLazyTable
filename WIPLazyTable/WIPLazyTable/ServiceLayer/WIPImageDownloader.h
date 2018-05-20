//
//  WIPImageDownloader.h
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/21/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WIPCountryBioGraphyRowsContent;

@interface WIPImageDownloader : NSObject

@property (nonatomic, strong) WIPCountryBioGraphyRowsContent *rowContentRecord;
@property (nonatomic, copy) void (^completionHandler)(void);

- (void)startDownload;
- (void)cancelDownload;


@end
