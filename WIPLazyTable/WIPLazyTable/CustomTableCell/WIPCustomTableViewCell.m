//
//  WIPCustomTableViewCell.m
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import "WIPCustomTableViewCell.h"
#import "AppDelegate.h"

@implementation WIPCustomTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    [self setupCellView];
    
}

- (void)setupCellView {
    
    [self setupTitleLabel];
    [self setupDescriptionLabel];
    [self setupTileImageView];

}

- (void)setupTileImageView {
    
    _tileImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [_tileImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:_tileImageView];
    [self setupTileImageViewConstraints];
    
}

- (void)setupTitleLabel {
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [_titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:_titleLabel];
    [self setupTitleLabelConstraints];
    
}

- (void)setupDescriptionLabel {
    
    _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:_descriptionLabel];
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
