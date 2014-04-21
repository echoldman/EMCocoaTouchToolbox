//
//  UIButton+imagedButton.h
//
//  Created by Echoldman on 13-5-27.
//  Copyright (c) 2013 Echoldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ImagedButton)

+ (UIButton *)buttonWithImage:(UIImage *)image;

+ (UIButton *)buttonWithImage:(UIImage *)image
             highlightedImage:(UIImage *)highlightedImage;

+ (UIButton *)buttonWithImage:(UIImage *)image
             highlightedImage:(UIImage *)highlightedImage
                       target:(id)target
     selectorForTouchUpInside:(SEL)selector;

@end
