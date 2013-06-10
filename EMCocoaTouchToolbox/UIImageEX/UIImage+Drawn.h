//
//  UIImage+Drawn.h
//  ColorScheme
//
//  Created by 董 斌 on 13-6-10.
//  Copyright (c) 2013年 Echoldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Drawn)

+ (UIImage *)imageWithSize:(CGSize)size
                     title:(NSString *)title
                titleColor:(UIColor *)titleColor
                 titleFont:(UIFont *)titleFont
           backgroundColor:(UIColor *)backgroundColor;

@end
