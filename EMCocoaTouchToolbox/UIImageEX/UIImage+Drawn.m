//
//  UIImage+Drawn.m
//  ColorScheme
//
//  Created by Echoldman on 13-6-10.
//  Copyright (c) 2013年 Echoldman. All rights reserved.
//

#import "UIImage+Drawn.h"

@implementation UIImage (Drawn)

+ (UIImage *)imageWithSize:(CGSize)size_
                     title:(NSString *)title_
                titleColor:(UIColor *)titleColor_
                 titleFont:(UIFont *)titleFont_
           backgroundColor:(UIColor *)backgroundColor_
{
    CGFloat ver = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (ver >= 4.0) {
        UIGraphicsBeginImageContextWithOptions(size_, NO, [UIScreen mainScreen].scale);
    }
    else {
        UIGraphicsBeginImageContext(size_);
    }
    
    //// Declarations
    CGRect imageRect = CGRectMake(0, 0, size_.width, size_.height);
    CGRect textRect = CGRectZero;
    CGSize textSize = [title_ sizeWithFont:titleFont_];
    textRect.origin.x = (size_.width-textSize.width)/2;
    textRect.origin.y = (size_.height-textSize.height)/2;
    textRect.size = textSize;
    
    //// Abstracted Attributes
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect:imageRect];
    [backgroundColor_ setFill];
    [rectanglePath fill];
    
    //// Text Drawing
    [titleColor_ setFill];
    [title_ drawInRect:textRect withFont:titleFont_ lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentLeft];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
