//
//  WIPCustomTableViewCell.h
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WIPCustomTableViewCell : UITableViewCell

@property (nonatomic, readonly) UIImageView *tileImageView;
@property (nonatomic, readonly) UILabel     *titleLabel;
@property (nonatomic, readonly) UILabel     *descriptionLabel;

@end
