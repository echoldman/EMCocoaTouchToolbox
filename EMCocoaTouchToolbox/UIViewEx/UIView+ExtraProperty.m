//
//  UIView+Index.m
//
//  Created by Echoldman on 14-5-8.
//  Copyright (c) 2014 Echoldman. All rights reserved.
//

#import "UIView+ExtraProperty.h"
#import <objc/runtime.h>

#define UIView_ExtraProperty_index  "UIView_ExtraProperty_index"
#define UIView_ExtraProperty_name   "UIView_ExtraProperty_name"

@implementation UIView (ExtraProperty)

- (NSUInteger)index
{
    NSUInteger index = NSNotFound;
    
    NSNumber *num = objc_getAssociatedObject(self, UIView_ExtraProperty_index);
    if (num) {
        index = num.integerValue;
    }
    
    return index;
}

- (void)setIndex:(NSUInteger)index
{
    objc_setAssociatedObject(self, UIView_ExtraProperty_index, [NSNumber numberWithInteger:index], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name
{
    return objc_getAssociatedObject(self, UIView_ExtraProperty_name);
}

- (void)setName:(NSString *)name
{
    objc_setAssociatedObject(self, UIView_ExtraProperty_name, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
