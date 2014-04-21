//
//  UIView+Size.m
//
//  Created by Echoldman on 12-5-16.
//  Copyright (c) 2012 Echoldman. All rights reserved.
//

#import "UIView+Size.h"

@implementation UIView (Size)

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width_
{
    CGRect originalFrame = self.frame;
    self.frame = CGRectMake(originalFrame.origin.x, originalFrame.origin.y, width_, originalFrame.size.height);
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height_
{
    CGRect originalFrame = self.frame;
    self.frame = CGRectMake(originalFrame.origin.x, originalFrame.origin.y, originalFrame.size.width, height_);
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGPoint originalOrigin = self.frame.origin;
    self.frame = CGRectMake(originalOrigin.x, originalOrigin.y, size.width, size.height);
}

@end
