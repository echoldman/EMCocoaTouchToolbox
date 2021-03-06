//
//  UIView+Index.h
//
//  Created by Echoldman on 14-5-8.
//  Copyright (c) 2014 Echoldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ExtraProperty)

@property (nonatomic, assign, getter = index, setter = setIndex:) NSUInteger index;
@property (nonatomic, copy, getter = name, setter = setName:) NSString *name;

@end
