//
//  UIImage+RoundImage.m
//  RoundRectImage
//
//  Created by Echoldman on 13-4-17.
//  Copyright (c) 2013年 Echoldman. All rights reserved.
//

#import "UIImage+RoundedImage.h"

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth, float ovalHeight)
{
    float fw, fh;
    if (ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);                // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);   // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);     // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);      // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1);    // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

@implementation UIImage (RoundedImage)

- (UIImage *)roundedImageWithCamber:(CGFloat)camberValue_
{
    return [self roundedImageWithOvalWidth:camberValue_ ovalHeight:camberValue_];
}

- (UIImage *)roundedImageWithOvalWidth:(CGFloat)ovalWidth_ ovalHeight:(CGFloat)ovalHeight_
{
    // The size of CGContextRef
    CGFloat sysVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    CGFloat scale  = (sysVer >= 4.0) ? self.scale : 1.0;
    size_t width   = (size_t)floorf(self.size.width * scale);
    size_t height  = (size_t)floorf(self.size.height * scale);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context       = CGBitmapContextCreate(NULL, width, height, 8, 4*width, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGRect rect                = CGRectMake(0, 0, width, height);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, ovalWidth_, ovalHeight_);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), self.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    // Make the new image
    UIImage *result;
    if (sysVer >= 4.0) {
        result = [UIImage imageWithCGImage:imageMasked scale:self.scale orientation:self.imageOrientation];
    }
    else {
        result = [UIImage imageWithCGImage:imageMasked];
    }
    CGImageRelease(imageMasked);
    
    return result;
}

@end
