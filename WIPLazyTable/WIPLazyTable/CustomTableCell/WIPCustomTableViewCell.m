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
    _titleLabel.numberOfLines = 0;
    [self addSubview:_titleLabel];
    [self setupTitleLabelConstraints];
    
}

- (void)setupDescriptionLabel {
    
    _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    _descriptionLabel.numberOfLines = 0;
    [self addSubview:_descriptionLabel];
    [self setupDescriptionLabelConstraints];
    
}

#pragma mark Constraints

- (void)setupTileImageViewConstraints {
    
    [_tileImageView constraintSetSize:APP_COMMON.standardCellImageSize];
    [_tileImageView constraintAlignLeadingInParentWithDistance:APP_COMMON.standardLeadingMargin];
    [_tileImageView constraintAlignBelowView:_titleLabel withDistance:APP_COMMON.standardVerticalMargin];
    // TODO temp enable this constraint as dynamic height has some problem
    [_tileImageView constraintAlignBottomInParentWithDistance:APP_COMMON.standardBottomMargin];

}

- (void)setupTitleLabelConstraints {
    
    [_titleLabel constraintAlignTopInParentWithDistance:APP_COMMON.standardTopMargin];
    [_titleLabel constraintAlignLeadingInParentWithDistance:APP_COMMON.standardLeadingMargin];
    [_titleLabel constraintAlignTrailingInParentWithDistance:APP_COMMON.standardTrailingMargin];

}

- (void)setupDescriptionLabelConstraints {
    [_descriptionLabel constraintAlignBelowView:_titleLabel withDistance:APP_COMMON.standardTopMargin];
    [_descriptionLabel constraintAlignTrailingInParentWithDistance:APP_COMMON.standardTrailingMargin];
    [_descriptionLabel constraintAlignLeadingInParentWithDistance: APP_COMMON.standardLeadingMargin + APP_COMMON.standardCellImageViewWidth + APP_COMMON.standardHorizontalMargin];
    [_descriptionLabel constraintAlignBottomInParentWithDistance:APP_COMMON.standardBottomMargin];

}

@end
