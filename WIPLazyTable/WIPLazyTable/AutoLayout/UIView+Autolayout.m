//
//  UIView+Autolayout.m
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import "UIView+Autolayout.h"

@implementation UIView (Autolayout)

//-----------------------------------------------------
// Relative to Parent
//-----------------------------------------------------

- (NSLayoutConstraint* ) constraintAlignAttributeToParent:(NSLayoutAttribute)attribute constant:(CGFloat)constant
{
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:attribute multiplier:1.0f constant:constant];
    [NSLayoutConstraint activateConstraints:@[constraint]];
    return constraint;
}

- (NSArray*) constraintAlignToParent
{
    return @ [[self constraintAlignWidthInParent],
              [self constraintAlignHeightInParent],
              [self constraintAlignHorizontallyInParent],
              [self constraintAlignVerticallyInParent]];
}

-(NSLayoutConstraint*) constraintAlignVerticallyInParent{return [self constraintAlignAttributeToParent:NSLayoutAttributeCenterY constant:0];}
-(NSLayoutConstraint*) constraintAlignHorizontallyInParent{return [self constraintAlignAttributeToParent:NSLayoutAttributeCenterX constant:0];}
-(NSLayoutConstraint*) constraintAlignTopInParent{return [self constraintAlignAttributeToParent:NSLayoutAttributeTop constant:0];}
-(NSLayoutConstraint*) constraintAlignBottomInParent{return [self constraintAlignAttributeToParent:NSLayoutAttributeBottom constant:0];}
-(NSLayoutConstraint*) constraintAlignWidthInParent{return [self constraintAlignAttributeToParent:NSLayoutAttributeWidth constant:0];}
-(NSLayoutConstraint*) constraintAlignHeightInParent{return [self constraintAlignAttributeToParent:NSLayoutAttributeHeight constant:0];}
-(NSLayoutConstraint*) constraintAlignLeadingInParent{return [self constraintAlignAttributeToParent:NSLayoutAttributeLeading constant:0];}
-(NSLayoutConstraint*) constraintAlignTrailingInParent{return [self constraintAlignAttributeToParent:NSLayoutAttributeTrailing constant:0];}
-(NSLayoutConstraint*) constraintAlignTopInParentWithDistance:(CGFloat)distance{return [self constraintAlignAttributeToParent:NSLayoutAttributeTop constant:distance];}
-(NSLayoutConstraint*) constraintAlignBottomInParentWithDistance:(CGFloat)distance{return [self constraintAlignAttributeToParent:NSLayoutAttributeBottom constant:-distance];}
-(NSLayoutConstraint*) constraintAlignLeadingInParentWithDistance:(CGFloat)distance{return [self constraintAlignAttributeToParent:NSLayoutAttributeLeading constant:distance];}
-(NSLayoutConstraint*) constraintAlignTrailingInParentWithDistance:(CGFloat)distance{return [self constraintAlignAttributeToParent:NSLayoutAttributeTrailing constant:-distance];}

//-----------------------------------------------------
// Relative to other views
//-----------------------------------------------------

- (NSLayoutConstraint *) constraintAlignAboveView:(UIView*)view withDistance:(CGFloat)distance
{
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:view attribute:NSLayoutAttributeTop
                                                                 multiplier:1.0f constant:-distance];
    [NSLayoutConstraint activateConstraints:@[constraint]];
    
    return constraint;
}

- (NSLayoutConstraint*) constraintAlignBelowView:(UIView*)view withDistance:(CGFloat)distance
{
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:view attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0f constant:distance];
    [NSLayoutConstraint activateConstraints:@[constraint]];
    
    return constraint;
}

- (NSLayoutConstraint*) constraintAlignLeadingOfView:(UIView*)view withDistance:(CGFloat)distance
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:view attribute:NSLayoutAttributeLeading
                                                                 multiplier:1.0f constant:-distance];
    [NSLayoutConstraint activateConstraints:@[constraint]];
    
    return constraint;
}

- (NSLayoutConstraint*) constraintAlignTrailingOfView:(UIView*)view withDistance:(CGFloat)distance
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:view attribute:NSLayoutAttributeTrailing
                                                                 multiplier:1.0f constant:distance];
    [NSLayoutConstraint activateConstraints:@[constraint]];
    
    return constraint;
}

@end
