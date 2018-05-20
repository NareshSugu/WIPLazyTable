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
    
    [self.tableView registerClass:[WIPCustomTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    [self tableView].dataSource = self;
    [self tableView].delegate = self;

    [self tableView].allowsSelection = NO;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = APP_COMMON.standardCellRowHeight;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kCustomRowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WIPCustomTableViewCell *cell = (WIPCustomTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell titleLabel].text = APP_COMMON.titlePalceholder;
    [cell titleLabel].textColor = [UIColor blackColor];
    
    return cell;
}

@end
