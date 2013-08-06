//
//  UIImage+Drawn.h
//  ColorScheme
//
//  Created by Echoldman on 13-6-10.
//  Copyright (c) 2013年 Echoldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Drawn)

- (UIImage *)scaledImageByWidth:(CGFloat)width;

+ (UIImage *)imageWithSize:(CGSize)size
                     title:(NSString *)title
                titleColor:(UIColor *)titleColor
                 titleFont:(UIFont *)titleFont
           backgroundColor:(UIColor *)backgroundColor;

@end
