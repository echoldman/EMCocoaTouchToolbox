//
//  UIImage+Drawn.h
//
//  Created by Echoldman on 13-6-10.
//

#import <UIKit/UIKit.h>

@interface UIImage (Drawn)

- (UIImage *)imageInRect:(CGRect)rect;

- (UIImage *)scaledImageByWidth:(CGFloat)width;

- (UIImage *)stretchedImageWithWidth:(CGFloat)width
                        leftCapWidth:(CGFloat)leftCapWidth
                     middleRectWidth:(CGFloat)middleRectWidth
                       rightCapWidth:(CGFloat)rightCapWidth
                                text:(NSString *)text
                                font:(UIFont *)font
                           textColor:(UIColor *)textColor
                          textOrigin:(CGPoint)textOrigin
                         shadowColor:(UIColor *)shadowColor
                        shadowOffset:(CGSize)shadowOffset;

- (UIImage *)stretchedImageWithWidth:(CGFloat)width
                        leftCapWidth:(CGFloat)leftCapWidth
                     middleRectWidth:(CGFloat)middleRectWidth
                       rightCapWidth:(CGFloat)rightCapWidth
                                text:(NSString *)text
                                font:(UIFont *)font
                           textColor:(UIColor *)textColor
                          textOrigin:(CGPoint)textOrigin;

- (UIImage *)stretchedImageWithWidth:(CGFloat)width
                        leftCapWidth:(CGFloat)leftCapWidth
                     middleRectWidth:(CGFloat)middleRectWidth
                       rightCapWidth:(CGFloat)rightCapWidth
                                text:(NSString *)text
                                font:(UIFont *)font
                           textColor:(UIColor *)textColor;

- (UIImage *)stretchedImageWithWidth:(CGFloat)width
                        leftCapWidth:(CGFloat)leftCapWidth
                     middleRectWidth:(CGFloat)middleRectWidth
                       rightCapWidth:(CGFloat)rightCapWidth;

- (UIImage *)stretchedImageWithWidth:(CGFloat)width
                        leftCapWidth:(CGFloat)leftCapWidth
                     middleRectWidth:(CGFloat)middleRectWidth
                       rightCapWidth:(CGFloat)rightCapWidth
                       appendedImage:(UIImage *)appendedImage;

- (UIImage *)stretchedImageWithWidth:(CGFloat)width
                        leftCapWidth:(CGFloat)leftCapWidth
                     middleRectWidth:(CGFloat)middleRectWidth
                       rightCapWidth:(CGFloat)rightCapWidth
                       appendedImage:(UIImage *)appendedImage
                 appendedImageOrigin:(CGPoint)appendedImageOrigin;

+ (UIImage *)imageWithSize:(CGSize)size
                     title:(NSString *)title
                titleColor:(UIColor *)titleColor
                 titleFont:(UIFont *)titleFont
           backgroundColor:(UIColor *)backgroundColor;

- (UIImage *)imageWithImage:(UIImage *)image
                     origin:(CGPoint)origin;

- (UIImage *)imageWithText:(NSString *)text
                      font:(UIFont *)font
                 textColor:(UIColor *)textColor;

- (UIImage *)imageWithText:(NSString *)text
                      font:(UIFont *)font
                 textColor:(UIColor *)textColor
                textOrigin:(CGPoint)textOrigin;

+ (UIImage *)clearImageWithSize:(CGSize)size;

+ (UIImage *)clearImageWithSize:(CGSize)size
                          scale:(CGFloat)scale;

+ (UIImage *)imageWithCGColor:(CGColorRef)cgColor
                       size:(CGSize)size;

+ (UIImage *)imageWithCGColor:(CGColorRef)cgColor
                       size:(CGSize)size
                      scale:(CGFloat)scale;

@end
