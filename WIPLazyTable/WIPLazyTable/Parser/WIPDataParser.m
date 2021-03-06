//
//  WIPDataParser.m
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import "WIPDataParser.h"
#import "WIPAppCommon.h"


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
        
        _dataToParse = data;
        
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
                        
                        if (obj != nil || ! [obj isEqual:[NSNull null]]) {
                            
                            rowsContent = [[WIPCountryBioGraphyRowsContent alloc] init];
                            if (![obj[kRowTitle] isEqual:[NSNull null]]) {
                                rowsContent.title = obj[kRowTitle];
                            }
                            if (![obj[kRowDescription] isEqual:[NSNull null]]) {
                                rowsContent.descriptionSubTitle = obj[kRowDescription];
                            }
                            if (![obj[kRowImageHref] isEqual:[NSNull null]]) {
                                rowsContent.tileImageURLString = obj[kRowImageHref];
                            }

                        }

                    }
                    
                    if (rowsContent) {
                        [tempArray addObject:rowsContent];
                    }
                    
                }
            }];
        
        if ([tempArray count] > 0) {
            _countryBioGraphyRecord.rowsContent = (WIPCountryBioGraphyRowsContent*) tempArray;
            tempArray = nil;
            _countryBioGraphyRecordDictionary = @{ kNavigationTitle: _countryBioGraphyRecord.navigationTitle,
                                                   kRows: _countryBioGraphyRecord.rowsContent };

        }

    }
    
}
@end
