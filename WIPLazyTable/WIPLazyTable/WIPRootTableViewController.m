//
//  WIPRootTableViewController.m
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import "WIPRootTableViewController.h"
#import "WIPCustomTableViewCell.h"
#import "WIPAppCommon.h"
#import "WIPCountryBioGraphyRowsContent.h"
#import "WIPImageDownloader.h"

static NSString *CellIdentifier = @"CellIdentifier";

@interface WIPRootTableViewController () <UIScrollViewDelegate>

@end

@implementation WIPRootTableViewController

- (void)dealloc
{
    [self terminateAllDownloads];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageDownloadsInProgress = [NSMutableDictionary dictionary];

    [self setupTableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self terminateAllDownloads];
}

- (void)setupTableView {
    
    [self.tableView registerClass:[WIPCustomTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    self.tableView.allowsSelection = NO;
    
    self.tableView.estimatedRowHeight = APP_COMMON.standardCellRowHeight;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_tableViewContentList[kRows] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WIPCustomTableViewCell *cell = (WIPCustomTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    WIPCountryBioGraphyRowsContent *rowsContent = nil;
    rowsContent = [_tableViewContentList[kRows] objectAtIndex:indexPath.row];
    
    if (rowsContent) {
        
        [cell titleLabel].text =       (rowsContent.title != nil) ? rowsContent.title : APP_COMMON.titlePalceholder; //APP_COMMON.titlePalceholder;
        [cell titleLabel].textColor =   [UIColor blackColor];
        if (@available(iOS 8.2, *)) {
            [cell titleLabel].font = [UIFont systemFontOfSize:APP_COMMON.cellTitleLabelFontSize weight:UIFontWeightBold];
        } else {
            [cell titleLabel].font = [UIFont systemFontOfSize:APP_COMMON.cellTitleLabelFontSize];
        }
        
        [cell descriptionLabel].text =  (rowsContent.descriptionSubTitle != nil) ? rowsContent.descriptionSubTitle : APP_COMMON.descriptionPalceholder; //APP_COMMON.descriptionPalceholder;
        [cell descriptionLabel].textColor =   [UIColor blackColor];
        if (@available(iOS 8.2, *)) {
            [cell descriptionLabel].font = [UIFont systemFontOfSize:APP_COMMON.cellSubtitleLabelFontSize weight:UIFontWeightRegular];
        } else {
            [cell descriptionLabel].font = [UIFont systemFontOfSize:APP_COMMON.cellSubtitleLabelFontSize];
        }

        
        if (!rowsContent.tileImage)
        {
            if (self.tableView.dragging == NO && self.tableView.decelerating == NO)
            {
                [self startImageDownload:rowsContent forIndexPath:indexPath];
            }
            [cell tileImageView].image = DEFAULT_TILE_IMAGE;

        }
        else
        {
            [cell tileImageView].image = rowsContent.tileImage;
        }

    }

    return cell;
}

- (void)startImageDownload:(WIPCountryBioGraphyRowsContent *)rowsContent forIndexPath:(NSIndexPath *)indexPath
{
    WIPImageDownloader *imageDownloader = (self.imageDownloadsInProgress)[indexPath];
    if (imageDownloader == nil)
    {
        imageDownloader = [[WIPImageDownloader alloc] init];
        imageDownloader.rowContentRecord = rowsContent;
        [imageDownloader setCompletionHandler:^{
            
             WIPCustomTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            
            [cell tileImageView].image = rowsContent.tileImage;
            
            [self.imageDownloadsInProgress removeObjectForKey:indexPath];
            
        }];
        (self.imageDownloadsInProgress)[indexPath] = imageDownloader;
        [imageDownloader startDownload];
    }
}

- (void)terminateAllDownloads
{
    // terminate all pending download connections
    NSArray *allDownloads = [self.imageDownloadsInProgress allValues];
    [allDownloads makeObjectsPerformSelector:@selector(cancelDownload)];
    
    [self.imageDownloadsInProgress removeAllObjects];
}

- (void)loadImagesForOnscreenRows
{
    if (_tableViewContentList[kRows] > 0)
    {
        NSArray *visiblePaths = [self.tableView indexPathsForVisibleRows];
        for (NSIndexPath *indexPath in visiblePaths)
        {
            WIPCountryBioGraphyRowsContent *rowContent = (_tableViewContentList[kRows])[indexPath.row];
            
            if (!rowContent.tileImage)
            {
                [self startImageDownload:rowContent forIndexPath:indexPath];
            }
        }
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
    {
        [self loadImagesForOnscreenRows];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self loadImagesForOnscreenRows];
}

@end
