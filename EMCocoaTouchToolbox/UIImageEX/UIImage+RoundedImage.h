//
//  UIImage+RoundImage.h
//
//  Created by Echoldman on 13-4-17.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundedImage)

- (UIImage *)roundedImageWithCamber:(CGFloat)camberValue;
- (UIImage *)roundedImageWithOvalWidth:(CGFloat)ovalWidth ovalHeight:(CGFloat)ovalHeight;

@end
