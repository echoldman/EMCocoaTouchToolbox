//
//  UIView+Origin.h
//
//  Created by Echoldman on 12-5-16.
//  Copyright (c) 2012 Echoldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Origin)

@property (nonatomic, assign, getter = x, setter = setX:) CGFloat x;
@property (nonatomic, assign, getter = x, setter = setY:) CGFloat y;
@property (nonatomic, assign, getter = origin, setter = setOrigin:) CGPoint origin;
@property (nonatomic, assign, readonly, getter = rightX) CGFloat rightX;
@property (nonatomic, assign, readonly, getter = bottomY) CGFloat bottomY;

@end
