//
//  WIPCustomTableViewCell.m
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import "WIPCustomTableViewCell.h"
#import "AppDelegate.h"
#import "UIView+Autolayout.h"
#import "WIPAppCommon.h"

@implementation WIPCustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellView];
    }
    
    return self;
}
- (void)setupCellView {
    
    [self setupTitleLabel];
    [self setupDescriptionLabel];
    [self setupTileImageView];

}

#pragma mark setupView
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

#pragma mark Constraints

- (void)setupTileImageViewConstraints {
    // set Constraints
}

- (void)setupTitleLabelConstraints {
    
    [_titleLabel constraintAlignTopInParentWithDistance:APP_COMMON.standardTopMargin];
    [_titleLabel constraintAlignLeadingInParentWithDistance:APP_COMMON.standardHorizontalMargin];
    [_titleLabel constraintAlignTrailingInParentWithDistance:APP_COMMON.standardHorizontalMargin];
    [_titleLabel constraintAlignBottomInParentWithDistance:APP_COMMON.standardVerticalMargin];

}

- (void)setupDescriptionLabelConstraints {
    // set Constraints
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
