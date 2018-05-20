//
//  UIView+Autolayout.m
//  WIPLazyTable
//
//  Created by Norace Kumar on 5/20/18.
//  Copyright © 2018 WiproDigital. All rights reserved.
//

#import "UIView+Autolayout.h"

@implementation UIView (Autolayout)

+ (void) setTopWindow:(UIWindow*)window
{
    topWindow = window;
}

//-----------------------------------------------------
// Relative to Parent
//-----------------------------------------------------

- (NSLayoutConstraint* ) constraintAlignAttributeToParent:(NSLayoutAttribute)attribute
                                                 constant:(CGFloat)constant
{
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:attribute relatedBy:NSLayoutRelationEqual toItem:self.superview
                                                                  attribute:attribute
                                                                 multiplier:1.0f constant:constant];
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

-(NSLayoutConstraint*) constraintAlignVerticallyInParent{
    
    return [self constraintAlignAttributeToParent:NSLayoutAttributeCenterY constant:0];
    
}
-(NSLayoutConstraint*) constraintAlignHorizontallyInParent{
    
    return [self constraintAlignAttributeToParent:NSLayoutAttributeCenterX constant:0];
    
}
-(NSLayoutConstraint*) constraintAlignTopInParent{
    
    return [self constraintAlignAttributeToParent:NSLayoutAttributeTop constant:0];
    
}
-(NSLayoutConstraint*) constraintAlignBottomInParent{
    
    return [self constraintAlignAttributeToParent:NSLayoutAttributeBottom constant:0];
    
}
-(NSLayoutConstraint*) constraintAlignWidthInParent{
    
    return [self constraintAlignAttributeToParent:NSLayoutAttributeWidth constant:0];
    
}
-(NSLayoutConstraint*) constraintAlignHeightInParent{
    
    return [self constraintAlignAttributeToParent:NSLayoutAttributeHeight constant:0];
    
}
-(NSLayoutConstraint*) constraintAlignLeadingInParent{
    
    return [self constraintAlignAttributeToParent:NSLayoutAttributeLeading constant:0];
    
}
-(NSLayoutConstraint*) constraintAlignTrailingInParent{
    
    return [self constraintAlignAttributeToParent:NSLayoutAttributeTrailing constant:0];
    
}
-(NSLayoutConstraint*) constraintAlignTopInParentWithDistance:(CGFloat)distance{
    
    return [self constraintAlignAttributeToParent:NSLayoutAttributeTop constant:distance];
    
}
-(NSLayoutConstraint*) constraintAlignBottomInParentWithDistance:(CGFloat)distance{
    
    return [self constraintAlignAttributeToParent:NSLayoutAttributeBottom constant:-distance];
    
}
-(NSLayoutConstraint*) constraintAlignLeadingInParentWithDistance:(CGFloat)distance{
    
    return [self constraintAlignAttributeToParent:NSLayoutAttributeLeading constant:distance];
    
}
-(NSLayoutConstraint*) constraintAlignTrailingInParentWithDistance:(CGFloat)distance{
    
    return [self constraintAlignAttributeToParent:NSLayoutAttributeTrailing constant:-distance];
    
}

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

//-----------------------------------------------------
// Absolute Positioning
//-----------------------------------------------------

- (NSLayoutConstraint*) constraintSetHeight:(CGFloat)height
{
    NSLayoutConstraint *constraint = [self.superview constraintForAttribute:NSLayoutAttributeHeight
                                                                    forView:self];
    if(constraint) {
        [self constraintUpdateConstantHeight:height];
        return constraint;
    }
    
    constraint =  [NSLayoutConstraint constraintWithItem:self
                                               attribute:NSLayoutAttributeHeight
                                               relatedBy:NSLayoutRelationEqual
                                                  toItem:nil
                                               attribute:NSLayoutAttributeNotAnAttribute
                                              multiplier:0.0f
                                                constant:height];
    
    constraint.active = YES;
    return constraint;
}

- (NSLayoutConstraint*) constraintSetWidth:(CGFloat)width
{
    NSLayoutConstraint *constraint = [self.superview constraintForAttribute:NSLayoutAttributeWidth
                                                                    forView:self];
    if(constraint) {
        [self constraintUpdateConstantWidth:width];
        return constraint;
    }
    
    
    constraint = [NSLayoutConstraint constraintWithItem:self
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                              attribute:NSLayoutAttributeNotAnAttribute
                                             multiplier:0.0f
                                               constant:width];
    constraint.active = YES;
    return constraint;
}

- (NSArray*) constraintSetSize:(CGSize)size
{
    return [NSArray arrayWithObjects:[self constraintSetHeight:size.height], [self constraintSetWidth:size.width] , nil];
}

//-----------------------------------------------------
// General Utils
//-----------------------------------------------------

+ (NSLayoutConstraint*) recursiveConstraintForAttribute:(NSLayoutAttribute)attribute
                                             parentView:(UIView*)parentView
                                                forView:(UIView*)view
{
    if(parentView == nil)
        return nil;
    
    for(NSLayoutConstraint *constraint in parentView.constraints)
    {
        if((constraint.firstItem == view)
           && (constraint.firstAttribute == attribute)
           && constraint.isActive) {
            return constraint;
        }
    }
    
    return [UIView recursiveConstraintForAttribute:attribute
                                        parentView:parentView.superview
                                           forView:view];
}

- (NSLayoutConstraint*) constraintForAttribute:(NSLayoutAttribute)attribute forView:(UIView*)view
{
    return [UIView recursiveConstraintForAttribute:attribute
                                        parentView:self
                                           forView:view];
}



//-----------------------------------------------------
// Update Constraints
//-----------------------------------------------------
- (void) constraintUpdateConstantAttribute:(NSLayoutAttribute)attribute
                              updatedValue:(CGFloat)updatedValue
                              updateLayout:(BOOL)updateLayout
{
    for(NSLayoutConstraint *viewConstraint in self.constraints)
    {
        if((viewConstraint.firstItem == self)
           && (viewConstraint.firstAttribute == attribute)
           && (viewConstraint.isActive)
           && (viewConstraint.secondItem == nil)
           && (viewConstraint.secondAttribute == NSLayoutAttributeNotAnAttribute)) {
            
            [viewConstraint setConstant:updatedValue];
            if(updateLayout){
                if([self isDescendantOfView:topWindow]){
                    [self updateConstraintsIfNeeded];
                    [self layoutIfNeeded];
                    [self.superview layoutIfNeeded];
                }
            }
            return;
        }
    }
    
    
    NSLayoutConstraint* constraint = [self.superview constraintForAttribute:attribute forView:self]; // Searches recursively
    
    if(constraint == nil){
        NSLog(@"|WARNING| No constraint exists.");
        return;
    }
    
    [constraint setConstant:updatedValue];
    
    if(updateLayout){
        if([self isDescendantOfView:topWindow]){
            [self updateConstraintsIfNeeded];
            [self layoutIfNeeded];
            [self.superview layoutIfNeeded];
        }
    }
}

- (void)constraintUpdateConstantHeight:(CGFloat)val
                          updateLayout:(BOOL)updateLayout{
    
    [self constraintUpdateConstantAttribute:NSLayoutAttributeHeight
                               updatedValue:val
                               updateLayout:updateLayout];
    
}

- (void)constraintUpdateConstantWidth:(CGFloat)val
                         updateLayout:(BOOL)updateLayout{
    
    [self constraintUpdateConstantAttribute:NSLayoutAttributeWidth
                               updatedValue:val
                               updateLayout:updateLayout];
    
}

- (void)constraintUpdateConstantHeight:(CGFloat)val{
    
    [self constraintUpdateConstantHeight:val updateLayout:YES];
    
}

- (void)constraintUpdateConstantWidth:(CGFloat)val{
    
    [self constraintUpdateConstantWidth:val updateLayout:YES];
    
}


@end
