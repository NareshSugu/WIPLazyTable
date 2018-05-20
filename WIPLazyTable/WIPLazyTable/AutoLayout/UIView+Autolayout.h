//
//  UIView+Autolayout.h
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

static UIWindow* topWindow = nil;

@interface UIView (Autolayout)

+ (void) setTopWindow:(UIWindow*)window;//Should be set once in app, will be used to check if to force layout/constraints or not

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

// Relative to other views
- (NSLayoutConstraint*) constraintAlignAboveView:(UIView*)view withDistance:(CGFloat)distance;
- (NSLayoutConstraint*) constraintAlignBelowView:(UIView*)view withDistance:(CGFloat)distance;
- (NSLayoutConstraint*) constraintAlignLeadingOfView:(UIView*)view withDistance:(CGFloat)distance;
- (NSLayoutConstraint*) constraintAlignTrailingOfView:(UIView*)view withDistance:(CGFloat)distance;

// Absolute positioning
- (NSLayoutConstraint*) constraintSetHeight:(CGFloat)height;
- (NSLayoutConstraint*) constraintSetWidth:(CGFloat)width;
- (NSArray*) constraintSetSize:(CGSize)size;

// General Utils
- (NSLayoutConstraint*) constraintForAttribute:(NSLayoutAttribute)attribute
                                       forView:(UIView*)view;
// Update Constants
- (void) constraintUpdateConstantHeight:(CGFloat)val;
- (void) constraintUpdateConstantHeight:(CGFloat)val
                           updateLayout:(BOOL)updateLayout;

- (void) constraintUpdateConstantWidth:(CGFloat)val;
- (void) constraintUpdateConstantWidth:(CGFloat)val
                          updateLayout:(BOOL)updateLayout;

@end
