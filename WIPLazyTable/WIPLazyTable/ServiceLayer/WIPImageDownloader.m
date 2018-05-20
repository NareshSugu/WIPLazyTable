//
//  WIPImageDownloader.m
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/21/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import "WIPImageDownloader.h"
#import "WIPCountryBioGraphyRowsContent.h"
#import "WIPAppCommon.h"

@interface WIPImageDownloader ()

@property (nonatomic, strong) NSURLSessionDataTask *sessionTask;

@end

@implementation WIPImageDownloader

- (void)startDownload
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self rowContentRecord].tileImageURLString]];
    
    _sessionTask = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                                   completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                       
                                                       if (error != nil)
                                                       {
                                                           if (@available(iOS 9.0, *)) {
                                                               if ([error code] == NSURLErrorAppTransportSecurityRequiresSecureConnection)
                                                               {
                                                                   // if you get error NSURLErrorAppTransportSecurityRequiresSecureConnection (-1022),
                                                                   // then your Info.plist has not been properly configured to match the target server.
                                                                   //
                                                                   abort();
                                                               }
                                                           } else {
                                                               // Fallback on earlier versions
                                                           }
                                                       }
                                                       
                                                       [[NSOperationQueue mainQueue] addOperationWithBlock: ^{
                                                           
                                                           // Set appIcon and clear temporary data/image
                                                           UIImage *image = [[UIImage alloc] initWithData:data];
                                                           
                                                           if (image.size.width != APP_COMMON.standardCellImageViewWidth || image.size.height != APP_COMMON.standardCellImageViewHeight)
                                                           {
                                                               CGSize itemSize = CGSizeMake(APP_COMMON.standardCellImageViewWidth, APP_COMMON.standardCellImageViewHeight);
                                                               UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0f);
                                                               CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
                                                               [image drawInRect:imageRect];
                                                               [self rowContentRecord].tileImage = UIGraphicsGetImageFromCurrentImageContext();
                                                               UIGraphicsEndImageContext();
                                                           }
                                                           else
                                                           {
                                                               [self rowContentRecord].tileImage = image;
                                                           }
                                                           
                                                           if (self.completionHandler != nil)
                                                           {
                                                               self.completionHandler();
                                                           }
                                                       }];
                                                   }];
    
    [self.sessionTask resume];
}

- (void)cancelDownload
{
    [self.sessionTask cancel];
    _sessionTask = nil;
}

@end
