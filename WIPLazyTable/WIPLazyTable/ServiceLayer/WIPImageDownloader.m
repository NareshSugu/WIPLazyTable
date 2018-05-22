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

@property (nonatomic, strong) NSOperationQueue *imageDownloadQueue;

@end

@implementation WIPImageDownloader

- (void)startDownload
{
    __block NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self rowContentRecord].tileImageURLString]];
    
    _imageDownloadQueue = [[NSOperationQueue alloc] init];

    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [NSURLConnection sendAsynchronousRequest:request queue:self.imageDownloadQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
         {
             if ([data length] > 0 && error == nil) {
                 //            [delegate receivedData:data];
                 [[NSOperationQueue mainQueue] addOperationWithBlock: ^{
                     
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
                 
             }
             
             else if ([data length] == 0 && error == nil){
                 // empty data
             }
             else if (error != nil && error.code == NSURLErrorTimedOut){
                 // Timed out
             }
             else if (error != nil){
                 // Download error
             }
         }];
        
    });
    
}

- (void)cancelDownload
{
    
    NSOperation *lastOp = [self.imageDownloadQueue.operations lastObject];
    [lastOp cancel];
    
}

@end
