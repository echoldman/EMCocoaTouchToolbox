//
//  UIImage+Drawn.m
//
//  Created by Echoldman on 13-6-10.
//

#import "UIImage+Drawn.h"

@implementation UIImage (Drawn)

- (UIImage *)imageInRect:(CGRect)rect
{
    CGPoint origin = rect.origin;
    CGSize size = rect.size;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0) {
        UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    }
    else {
        UIGraphicsBeginImageContext(size);
    }
    
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //// Image Declarations
    UIColor* imagePattern = [UIColor colorWithPatternImage: self];
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, size.width, size.height)];
    CGContextSaveGState(context);
    CGContextSetPatternPhase(context, CGSizeMake(origin.x, origin.y));
    [imagePattern setFill];
    [ovalPath fill];
    CGContextRestoreGState(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)scaledImageByWidth:(CGFloat)width_
{
    CGSize newSize;
    newSize.width = width_;
    newSize.height = self.size.height * newSize.width/self.size.height;
    newSize.height = floorf(newSize.height);
    
    if (UIDevice.currentDevice.systemVersion.floatValue >= 4.0) {
        UIGraphicsBeginImageContextWithOptions(newSize, NO, self.scale);
    }
    else {
        UIGraphicsBeginImageContext(newSize);
    }
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)stretchedImageWithWidth:(CGFloat)width_
                        leftCapWidth:(CGFloat)leftCapWidth_
                     middleRectWidth:(CGFloat)middleRectWidth_
                       rightCapWidth:(CGFloat)rightCapWidth_
{
    return [self stretchedImageWithWidth:width_
                            leftCapWidth:leftCapWidth_
                         middleRectWidth:middleRectWidth_
                           rightCapWidth:rightCapWidth_
                                    text:nil
                                    font:nil
                               textColor:nil];
}

- (UIImage *)stretchedImageWithWidth:(CGFloat)width_
                        leftCapWidth:(CGFloat)leftCapWidth_
                     middleRectWidth:(CGFloat)middleRectWidth_
                       rightCapWidth:(CGFloat)rightCapWidth_
                                text:(NSString *)text_
                                font:(UIFont *)font_
                           textColor:(UIColor *)textColor_
{
    if ( width_ < (leftCapWidth_ + middleRectWidth_ + rightCapWidth_) ) {
        return nil;
    }
    
    CGSize selfSize = self.size;
    CGSize textSize = [text_ sizeWithFont:font_];
    CGPoint textOrigin = CGPointMake((width_ - textSize.width) / 2, (selfSize.height - textSize.height) / 2);
    [text_ drawAtPoint:textOrigin withFont:font_];
    
    return [self stretchedImageWithWidth:width_
                            leftCapWidth:leftCapWidth_
                         middleRectWidth:middleRectWidth_
                           rightCapWidth:rightCapWidth_
                                    text:text_
                                    font:font_
                               textColor:textColor_
                              textOrigin:textOrigin];
}

- (UIImage *)stretchedImageWithWidth:(CGFloat)width_
                        leftCapWidth:(CGFloat)leftCapWidth_
                     middleRectWidth:(CGFloat)middleRectWidth_
                       rightCapWidth:(CGFloat)rightCapWidth_
                                text:(NSString *)text_
                                font:(UIFont *)font_
                           textColor:(UIColor *)textColor_
                          textOrigin:(CGPoint)textOrigin_
{
    return [self stretchedImageWithWidth:width_
                            leftCapWidth:leftCapWidth_
                         middleRectWidth:middleRectWidth_
                           rightCapWidth:rightCapWidth_
                                    text:text_
                                    font:font_
                               textColor:textColor_
                              textOrigin:textOrigin_
                             shadowColor:nil
                            shadowOffset:CGSizeZero];
}

- (UIImage *)stretchedImageWithWidth:(CGFloat)width_
                        leftCapWidth:(CGFloat)leftCapWidth_
                     middleRectWidth:(CGFloat)middleRectWidth_
                       rightCapWidth:(CGFloat)rightCapWidth_
                                text:(NSString *)text_
                                font:(UIFont *)font_
                           textColor:(UIColor *)textColor_
                          textOrigin:(CGPoint)textOrigin_
                         shadowColor:(UIColor *)shadowColor_
                        shadowOffset:(CGSize)shadowOffset_
{
    if ( width_ < (leftCapWidth_ + middleRectWidth_ + rightCapWidth_) ) {
        return nil;
    }
    
    CGSize selfSize = self.size;
    CGFloat selfScale = self.scale;
    UIImageOrientation selfImageOrientation = self.imageOrientation;
    struct CGImage *selfCGImage = self.CGImage;
    struct CGImage *cgImage;
    CGFloat systemVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    CGRect rect;
    
    rect.origin.x = 0;
    rect.origin.y = 0;
    rect.size.width = leftCapWidth_ * selfScale;
    rect.size.height = selfSize.height * selfScale;
    cgImage = CGImageCreateWithImageInRect(selfCGImage, rect);
    UIImage *leftCapImage;
    if ( systemVer >= 4.0 ) {
        leftCapImage = [UIImage imageWithCGImage:cgImage scale:selfScale orientation:selfImageOrientation];
    }
    else {
        leftCapImage = [UIImage imageWithCGImage:cgImage];
    }
    CGImageRelease(cgImage);
    
    rect.origin.x = leftCapWidth_ * selfScale;
    rect.origin.y = 0;
    rect.size.width = middleRectWidth_ * selfScale;
    rect.size.height = selfSize.height * selfScale;
    cgImage = CGImageCreateWithImageInRect(selfCGImage, rect);
    UIImage *middleRectImage;
    if ( systemVer >= 4.0 ) {
        middleRectImage = [UIImage imageWithCGImage:cgImage scale:selfScale orientation:selfImageOrientation];
    }
    else {
        middleRectImage = [UIImage imageWithCGImage:cgImage];
    }
    CGImageRelease(cgImage);
    
    rect.origin.x = (selfSize.width - rightCapWidth_) * selfScale;
    rect.origin.y = 0;
    rect.size.width = rightCapWidth_ * selfScale;
    rect.size.height = selfSize.height * selfScale;
    cgImage = CGImageCreateWithImageInRect(selfCGImage, rect);
    UIImage *rightCapImage;
    if ( systemVer >= 4.0 ) {
        rightCapImage = [UIImage imageWithCGImage:cgImage scale:selfScale orientation:selfImageOrientation];
    }
    else {
        rightCapImage = [UIImage imageWithCGImage:cgImage];
    }
    CGImageRelease(cgImage);
    
    if ( systemVer >= 4.0 ) {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(width_, selfSize.height), NO, selfScale);
    }
    else {
        UIGraphicsBeginImageContext(CGSizeMake(width_, selfSize.height));
    }
    
    [leftCapImage drawAtPoint:CGPointMake(0, 0)];
    for ( CGFloat i = leftCapWidth_; i < width_ - rightCapWidth_; i++ ) {
        [middleRectImage drawAtPoint:CGPointMake(i, 0)];
    }
    [rightCapImage drawAtPoint:CGPointMake(width_ - rightCapWidth_, 0)];
    
    if ( shadowColor_ ) {
        [shadowColor_ set];
        [text_ drawAtPoint:CGPointMake(textOrigin_.x + shadowOffset_.width, textOrigin_.y + shadowOffset_.height) withFont:font_];
    }
    
    [textColor_ set];
    [text_ drawAtPoint:textOrigin_ withFont:font_];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)stretchedImageWithWidth:(CGFloat)width_
                        leftCapWidth:(CGFloat)leftCapWidth_
                     middleRectWidth:(CGFloat)middleRectWidth_
                       rightCapWidth:(CGFloat)rightCapWidth_
                       appendedImage:(UIImage *)appendedImage_
{
    CGPoint appendedImageOrigin;
    appendedImageOrigin.x = (width_ - appendedImage_.size.width) / 2;
    appendedImageOrigin.y = (self.size.height - appendedImage_.size.height) / 2;
    return [self stretchedImageWithWidth:width_
                            leftCapWidth:leftCapWidth_
                         middleRectWidth:middleRectWidth_
                           rightCapWidth:rightCapWidth_
                           appendedImage:appendedImage_
                     appendedImageOrigin:appendedImageOrigin];
}

- (UIImage *)stretchedImageWithWidth:(CGFloat)width_
                        leftCapWidth:(CGFloat)leftCapWidth_
                     middleRectWidth:(CGFloat)middleRectWidth_
                       rightCapWidth:(CGFloat)rightCapWidth_
                       appendedImage:(UIImage *)appendedImage_
                 appendedImageOrigin:(CGPoint)appendedImageOrigin_
{
    if ( width_ < (leftCapWidth_ + middleRectWidth_ + rightCapWidth_) ) {
        return nil;
    }
    
    CGSize selfSize = self.size;
    CGFloat selfScale = self.scale;
    UIImageOrientation selfImageOrientation = self.imageOrientation;
    struct CGImage *selfCGImage = self.CGImage;
    struct CGImage *cgImage;
    CGFloat systemVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    CGRect rect;
    
    rect.origin.x = 0;
    rect.origin.y = 0;
    rect.size.width = leftCapWidth_ * selfScale;
    rect.size.height = selfSize.height * selfScale;
    cgImage = CGImageCreateWithImageInRect(selfCGImage, rect);
    UIImage *leftCapImage;
    if ( systemVer >= 4.0 ) {
        leftCapImage = [UIImage imageWithCGImage:cgImage scale:selfScale orientation:selfImageOrientation];
    }
    else {
        leftCapImage = [UIImage imageWithCGImage:cgImage];
    }
    CGImageRelease(cgImage);
    
    rect.origin.x = leftCapWidth_ * selfScale;
    rect.origin.y = 0;
    rect.size.width = middleRectWidth_ * selfScale;
    rect.size.height = selfSize.height * selfScale;
    cgImage = CGImageCreateWithImageInRect(selfCGImage, rect);
    UIImage *middleRectImage;
    if ( systemVer >= 4.0 ) {
        middleRectImage = [UIImage imageWithCGImage:cgImage scale:selfScale orientation:selfImageOrientation];
    }
    else {
        middleRectImage = [UIImage imageWithCGImage:cgImage];
    }
    CGImageRelease(cgImage);
    
    rect.origin.x = (selfSize.width - rightCapWidth_) * selfScale;
    rect.origin.y = 0;
    rect.size.width = rightCapWidth_ * selfScale;
    rect.size.height = selfSize.height * selfScale;
    cgImage = CGImageCreateWithImageInRect(selfCGImage, rect);
    UIImage *rightCapImage;
    if ( systemVer >= 4.0 ) {
        rightCapImage = [UIImage imageWithCGImage:cgImage scale:selfScale orientation:selfImageOrientation];
    }
    else {
        rightCapImage = [UIImage imageWithCGImage:cgImage];
    }
    CGImageRelease(cgImage);
    
    if ( systemVer >= 4.0 ) {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(width_, selfSize.height), NO, selfScale);
    }
    else {
        UIGraphicsBeginImageContext(CGSizeMake(width_, selfSize.height));
    }
    
    [leftCapImage drawAtPoint:CGPointMake(0, 0)];
    for ( CGFloat i = leftCapWidth_; i < width_ - rightCapWidth_; i++ ) {
        [middleRectImage drawAtPoint:CGPointMake(i, 0)];
    }
    [rightCapImage drawAtPoint:CGPointMake(width_ - rightCapWidth_, 0)];
    
    [appendedImage_ drawAtPoint:appendedImageOrigin_];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

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
    
    CGRect imageRect = CGRectMake(0, 0, size_.width, size_.height);
    CGRect textRect = CGRectZero;
    CGSize textSize = [title_ sizeWithFont:titleFont_];
    textRect.origin.x = (size_.width-textSize.width)/2;
    textRect.origin.y = (size_.height-textSize.height)/2;
    textRect.size = textSize;
    
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect:imageRect];
    [backgroundColor_ setFill];
    [rectanglePath fill];
    
    [titleColor_ setFill];
    [title_ drawInRect:textRect withFont:titleFont_ lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentLeft];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)imageWithImage:(UIImage *)image_
                     origin:(CGPoint)origin_
{
    if ( image_ == nil || image_.scale != self.scale ) return nil;
    
    CGSize selfSize = self.size;
    CGFloat selfScale = self.scale;
    CGFloat systemVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    CGRect rect;
    
    rect.origin.x = 0;
    rect.origin.y = 0;
    rect.size = selfSize;
    
    if ( systemVer >= 4.0 ) {
        UIGraphicsBeginImageContextWithOptions(selfSize, NO, selfScale);
    }
    else {
        UIGraphicsBeginImageContext(selfSize);
    }
    [self drawAtPoint:CGPointZero];
    [image_ drawAtPoint:origin_];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)imageWithText:(NSString *)text_
                      font:(UIFont *)font_
                 textColor:(UIColor *)textColor_
{
    CGSize selfSize = self.size;
    CGSize textSize = [text_ sizeWithFont:font_
                        constrainedToSize:selfSize
                            lineBreakMode:NSLineBreakByWordWrapping];
    return [self imageWithText:text_
                          font:font_
                     textColor:textColor_
                    textOrigin:CGPointMake((selfSize.width-textSize.width)/2, (selfSize.height-textSize.height)/2)];
}

- (UIImage *)imageWithText:(NSString *)text_
                      font:(UIFont *)font_
                 textColor:(UIColor *)textColor_
                textOrigin:(CGPoint)textOrigin_
{
    if ( text_ == nil ) return nil;
    
    CGSize selfSize = self.size;
    CGFloat selfScale = self.scale;
    CGFloat systemVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    CGRect rect;
    
    rect.origin.x = 0;
    rect.origin.y = 0;
    rect.size = selfSize;
    
    if ( systemVer >= 4.0 ) {
        UIGraphicsBeginImageContextWithOptions(selfSize, NO, selfScale);
    }
    else {
        UIGraphicsBeginImageContext(selfSize);
    }
    [self drawAtPoint:CGPointZero];
    
    [textColor_ set];
    [text_ drawAtPoint:textOrigin_ withFont:font_];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)clearImageWithSize:(CGSize)size_
{
    CGFloat systemVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    CGFloat scale = systemVer >= 4.0 ? UIScreen.mainScreen.scale : 1.0;
    
    return [self clearImageWithSize:size_ scale:scale];
}

+ (UIImage *)clearImageWithSize:(CGSize)size_
                          scale:(CGFloat)scale_
{
    CGFloat systemVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    if ( systemVer >= 4.0 ) {
        UIGraphicsBeginImageContextWithOptions(size_, NO, scale_);
    }
    else {
        UIGraphicsBeginImageContext(size_);
    }
    
    UIImage *clearImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return clearImage;
}

+ (UIImage *)imageWithCGColor:(CGColorRef)cgColor_
                         size:(CGSize)size_
{
    CGFloat systemVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    CGFloat scale = systemVer >= 4.0 ? UIScreen.mainScreen.scale : 1.0;
    
    return [self imageWithCGColor:cgColor_ size:size_ scale:scale];
}

+ (UIImage *)imageWithCGColor:(CGColorRef)cgColor_
                       size:(CGSize)size_
                      scale:(CGFloat)scale_
{
    CGFloat systemVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    if ( systemVer >= 4.0 ) {
        UIGraphicsBeginImageContextWithOptions(size_, NO, scale_);
    }
    else {
        UIGraphicsBeginImageContext(size_);
    }
    
    CGRect rect = CGRectZero;
    rect.size = size_;
    
    UIColor *color = [UIColor colorWithCGColor:cgColor_];
    
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect:rect];
    [color setFill];
    [rectanglePath fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
