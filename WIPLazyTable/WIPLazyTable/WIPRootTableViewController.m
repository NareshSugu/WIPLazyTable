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

static NSString *CellIdentifier = @"CellIdentifier";

@interface WIPRootTableViewController ()

@end

@implementation WIPRootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        
        [cell descriptionLabel].text =  (rowsContent.descriptionSubTitle != nil) ? rowsContent.descriptionSubTitle : APP_COMMON.descriptionPalceholder; //APP_COMMON.descriptionPalceholder;
        [cell descriptionLabel].textColor =   [UIColor blackColor];
        
        if (!rowsContent.tileImage)
        {
                [self startImageDownload:rowsContent forIndexPath:indexPath];
        }
        else
        {
            [cell tileImageView].image = rowsContent.tileImage; //DEFAULT_TILE_IMAGE
        }

    }

    return cell;
}

- (void)startImageDownload:(WIPCountryBioGraphyRowsContent *)rowsContent forIndexPath:(NSIndexPath *)indexPath
{
    // execute image download
}
@end
