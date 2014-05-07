//
//  UIView+Index.m
//
//  Created by Echoldman on 14-5-8.
//  Copyright (c) 2014 Echoldman. All rights reserved.
//

#import "UIView+Index.h"
#import <objc/runtime.h>

#define UIView_Index_index  "UIView_Index_index"

@implementation UIView (Index)

- (NSUInteger)index
{
    NSUInteger index = NSNotFound;
    
    NSNumber *num = objc_getAssociatedObject(self, UIView_Index_index);
    if (num) {
        index = num.integerValue;
    }
    
    return index;
}

- (void)setIndex:(NSUInteger)index
{
    objc_setAssociatedObject(self, UIView_Index_index, [NSNumber numberWithInteger:index], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
