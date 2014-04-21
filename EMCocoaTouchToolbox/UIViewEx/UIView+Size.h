//
//  UIView+Size.h
//
//  Created by Echoldman on 12-5-16.
//  Copyright (c) 2012 Echoldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Size)

@property (nonatomic, assign, getter = width, setter = setWidth:) CGFloat width;
@property (nonatomic, assign, getter = height, setter = setHeight:) CGFloat height;
@property (nonatomic, assign, getter = size, setter = setSize:) CGSize size;

@end
