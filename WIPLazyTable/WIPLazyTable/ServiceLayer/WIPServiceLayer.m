//
//  WIPServiceLayer.m
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WIPServiceLayer.h"
#import "AppDelegate.h"
#import "WIPDataParser.h"

@interface WIPServiceLayer ()

@property (nonatomic, strong) NSURLRequest            *request;
@property (nonatomic, strong) NSOperationQueue        *queue;
@property (nonatomic, strong) WIPDataParser           *parser;


@end

@implementation WIPServiceLayer

-(instancetype)initWithUrl:(NSString*) requestURLString
{
    if (self) {
        
        _request    =  [NSURLRequest requestWithURL:[NSURL URLWithString:requestURLString]];
        _queue      =  [[NSOperationQueue alloc] init];

        [self executeURLRequest];
        
    }
    
    return self;

}

- (void)executeURLRequest {


    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURLResponse * response = nil;
        NSError * error = nil;
        NSData * data = [NSURLConnection sendSynchronousRequest:self.request
                                              returningResponse:&response
                                                          error:&error];
        if (error != nil)
        {
            //parse data
        }
        else
        {
            
        }
    });

}

- (void)handleError:(NSError *)error
{
    [SharedAppDelegate handleError:error];
}

- (void)hasDataDownloaded:(NSDictionary *) fetchedData
{
    [SharedAppDelegate DataProvider:fetchedData];
}


@end
