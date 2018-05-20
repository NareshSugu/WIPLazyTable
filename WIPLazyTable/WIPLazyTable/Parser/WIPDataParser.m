//
//  WIPDataParser.m
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import "WIPDataParser.h"

#define kNavigationTitle            @"title"
#define kRows                        @"rows"
#define kRowTitle                   @"title"
#define kRowDescription             @"description"
#define kRowImageHref               @"imageHref"


@interface WIPDataParser ()

@property (nonatomic, strong) NSData *dataToParse;

@end

@implementation WIPDataParser

- (instancetype)initWithData:(NSData *)data
{
    self = [super init];
    if (self != nil)
    {
        _countryBioGraphyRecord = [[WIPCountryBioGraphy alloc] init];
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

    id responseJson = [NSJSONSerialization JSONObjectWithData:dataUTF8 options:NSJSONReadingMutableContainers error:&error];
    
    NSLog(@">>>>>>>>>> Response Json %@", [responseJson description]);
    
    if ([responseJson isKindOfClass:[NSDictionary class]]) {
        [self parseJsonResponse:responseJson];
    } else{
        NSLog(@">>>>>>>>>>Invalid Json");
    }
    responseJson = nil;
}

- (void)parseJsonResponse:(NSDictionary*) responseDict {
    
    if ([responseDict[kNavigationTitle] isKindOfClass:[NSString class]]) {
        _countryBioGraphyRecord.navigationTitle = responseDict[kNavigationTitle];
    }
    
    if ([responseDict[kRows] isKindOfClass:[NSArray class]]) {
        NSMutableArray* tempArray = [NSMutableArray new];
        __block WIPCountryBioGraphyRowsContent *rowsContent = nil;
            [responseDict[kRows] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if([obj isKindOfClass:[NSDictionary class]]){
                    if(obj){
                        
                        rowsContent = [[WIPCountryBioGraphyRowsContent alloc] init];
                        rowsContent.title = obj[kRowTitle];
                        rowsContent.descriptionSubTitle = obj[kRowDescription];
                        rowsContent.tileImageURLString = obj[kRowImageHref];

                    }
                    
                    if (rowsContent) {
                        [tempArray addObject:rowsContent];
                    }
                    
                }
            }];
        
        if ([tempArray count] > 0) {
            _countryBioGraphyRecord.rowsContent = (WIPCountryBioGraphyRowsContent*) tempArray;
        }

    }
    
}
@end
