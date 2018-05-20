//
//  WIPCustomTableViewCell.m
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import "WIPCustomTableViewCell.h"

@implementation WIPCustomTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    [self setupCellView];
    
}

- (void)setupCellView {
    
    [self setupTileImageView];
    [self setupTitleLabel];
    [self setupDescriptionLabel];
    
}

- (void)setupTileImageView {
    
    // create imageView
    [self setupTileImageViewConstraints];
    
}

- (void)setupTitleLabel {
    
    // create label
    [self setupTitleLabelConstraints];
    
}

- (void)setupDescriptionLabel {
    
    // create label
    [self setupDescriptionLabelConstraints];
    
}

- (void)setupTileImageViewConstraints {
    // set Constraints
}

- (void)setupTitleLabelConstraints {
    // set Constraints
}

- (void)setupDescriptionLabelConstraints {
    // set Constraints
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
