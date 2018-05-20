//
//  WIPServiceLayer.m
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import "WIPServiceLayer.h"

@interface WIPServiceLayer ()

@property (nonatomic, strong) NSURLRequest            *request;
@property (nonatomic, strong) NSURLSessionDataTask    *sessionTask;
@property (nonatomic, strong) NSOperationQueue        *queue;

@end

@implementation WIPServiceLayer

-(instancetype)initWithUrl:(NSString*) requestURLString
{
    if (self) {
        _request = [NSURLRequest requestWithURL:[NSURL URLWithString:requestURLString]];
//        _sessionTask = nil;
        _queue = [[NSOperationQueue alloc] init];
    }
    
    return self;

}

@end
