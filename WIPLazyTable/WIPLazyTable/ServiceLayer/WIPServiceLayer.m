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
        _request = [NSURLRequest requestWithURL:[NSURL URLWithString:requestURLString]];
        _queue = [[NSOperationQueue alloc] init];

        [self executeSessionDataTask];
        
    }
    
    return self;

}

- (void)executeSessionDataTask {
    
    NSURLSessionDataTask *sessionTask =
    [[NSURLSession sharedSession] dataTaskWithRequest:_request
                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                        
                                        if (error != nil)
                                        {
                                            [[NSOperationQueue mainQueue] addOperationWithBlock: ^{
                                                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                                                
                                                if (@available(iOS 9.0, *)) {
                                                    if ([error code] == NSURLErrorAppTransportSecurityRequiresSecureConnection)
                                                    {
                                                        abort();
                                                    }
                                                    else
                                                    {
                                                        [SharedAppDelegate handleError:error];
                                                    }
                                                } else {
                                                    // Fallback on earlier versions
                                                }
                                            }];
                                        }
                                        else
                                        {
                                            self.parser = [[WIPDataParser alloc] initWithData:data];
                                            
                                            __weak WIPServiceLayer *weakSelf = self;
                                            
                                            [self parser].errorHandler = ^(NSError *parseError) {
                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                                                    [weakSelf handleError:parseError];
                                                });
                                            };
                                            
                                            __weak WIPDataParser *weakParser = self.parser;

                                            self.parser.completionBlock = ^(void) {
                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                                                    if (weakParser.countryBioGraphyRecordDictionary != nil)
                                                    {
                                                        [weakSelf hasDataDownloaded:weakParser.countryBioGraphyRecordDictionary];
                                                    }
                                                });
                                                
                                                weakSelf.queue = nil;
                                            };
                                            
                                            [self.queue addOperation:self.parser];
                                        }
                                    }];
    [sessionTask resume];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

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
