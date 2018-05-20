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
    
    [cell titleLabel].text =        APP_COMMON.titlePalceholder;
    [cell titleLabel].textColor =   [UIColor blackColor];
    [cell tileImageView].image =    DEFAULT_TILE_IMAGE;
    [cell descriptionLabel].text =  APP_COMMON.descriptionPalceholder;
    [cell descriptionLabel].textColor =   [UIColor blackColor];

    return cell;
}

@end
