//
//  UIView+Autolayout.h
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIView (Autolayout)

// Relative to Parent
- (NSArray*) constraintAlignToParent;
- (NSLayoutConstraint*) constraintAlignVerticallyInParent;
- (NSLayoutConstraint*) constraintAlignHorizontallyInParent;
- (NSLayoutConstraint*) constraintAlignTopInParent;
- (NSLayoutConstraint*) constraintAlignBottomInParent;
- (NSLayoutConstraint*) constraintAlignLeadingInParent;
- (NSLayoutConstraint*) constraintAlignTrailingInParent;
- (NSLayoutConstraint*) constraintAlignWidthInParent;
- (NSLayoutConstraint*) constraintAlignHeightInParent;

- (NSLayoutConstraint*) constraintAlignTopInParentWithDistance:(CGFloat)distance;
- (NSLayoutConstraint*) constraintAlignBottomInParentWithDistance:(CGFloat)distance;
- (NSLayoutConstraint*) constraintAlignLeadingInParentWithDistance:(CGFloat)distance;
- (NSLayoutConstraint*) constraintAlignTrailingInParentWithDistance:(CGFloat)distance;


@end
