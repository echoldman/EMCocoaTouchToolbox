//
//  UIImage+RoundImage.h
//  RoundRectImage
//
//  Created by Echoldman on 13-4-17.
//  Copyright (c) 2013 Echoldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundedImage)

- (UIImage *)roundedImageWithCamber:(CGFloat)camberValue;
- (UIImage *)roundedImageWithOvalWidth:(CGFloat)ovalWidth ovalHeight:(CGFloat)ovalHeight;

@end
