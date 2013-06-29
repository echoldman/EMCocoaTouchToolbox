//
//  UIView+Origin.m
//
//  Created by Echoldman on 12-5-16.
//  Copyright (c) 2012年 Echoldman. All rights reserved.
//

#import "UIView+Origin.h"
#import "UIView+Size.h"

@implementation UIView (UIOrigin)

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x_
{
    CGRect originalFrame = self.frame;
    self.frame = CGRectMake(x_, originalFrame.origin.y, originalFrame.size.width, originalFrame.size.height);
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y_
{
    CGRect originalFrame = self.frame;
    self.frame = CGRectMake(originalFrame.origin.x, y_, originalFrame.size.width, originalFrame.size.height);
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGSize originalSize = self.frame.size;
    self.frame = CGRectMake(origin.x, origin.y, originalSize.width, originalSize.height);
}

- (CGFloat)rightX
{
    return (self.origin.x + self.size.width);
}

- (CGFloat)bottomY
{
    return (self.origin.y + self.size.height);
}

@end
