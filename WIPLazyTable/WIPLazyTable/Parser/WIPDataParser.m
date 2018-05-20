//
//  WIPDataParser.m
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import "WIPDataParser.h"

#define kNavigationTitle            @"title"
#define kRow                        @"rows"
#define kRowTitle                   @"title"
#define kRowDescription             @"description"
#define kRowImageHref               @"imageHref"


@interface WIPDataParser ()

@property (nonatomic, strong) NSData *dataToParse;
@property (nonatomic, strong) NSDictionary *CountryBioGraphyDict;

@end

@implementation WIPDataParser

- (instancetype)initWithData:(NSData *)data
{
    self = [super init];
    if (self != nil)
    {
        const void *buffer = NULL;
        size_t size = 0;
        dispatch_data_t new_data_file = dispatch_data_create_map(data, &buffer, &size);
        if(new_data_file){ /* to avoid warning really - since dispatch_data_create_map demands we care about the return arg */}
        
        _dataToParse = [[NSData alloc] initWithBytes:buffer length:size];

        [self parseJsonData];
    }
    return self;
}

- (void)parseJsonData {
    
    NSError* error = nil;
    NSString *strISOLatin = [[NSString alloc] initWithData:_dataToParse encoding:NSISOLatin1StringEncoding];
    _dataToParse = nil;
    NSData *dataUTF8 = [strISOLatin dataUsingEncoding:NSUTF8StringEncoding];

    _countryBioGraphyList = [NSJSONSerialization JSONObjectWithData:dataUTF8 options:NSJSONReadingMutableContainers error:&error];
    
    NSLog(@"Response Json %@", [_countryBioGraphyList description]);
    
}
@end
