//
//  UIButton+imagedButton.m
//
//  Created by Echoldman on 13-5-27.
//  Copyright (c) 2013年 Echoldman. All rights reserved.
//

#import "UIButton+imagedButton.h"

@implementation UIButton (ImagedButton)

+ (UIButton *)buttonWithImage:(UIImage *)image_
{
    return [self buttonWithImage:image_
                highlightedImage:nil
                          target:nil
        selectorForTouchUpInside:nil];
}

+ (UIButton *)buttonWithImage:(UIImage *)image_
             highlightedImage:(UIImage *)highlightedImage_
{
    return [self buttonWithImage:image_
                highlightedImage:highlightedImage_
                          target:nil
        selectorForTouchUpInside:nil];
}

+ (UIButton *)buttonWithImage:(UIImage *)image_
             highlightedImage:(UIImage *)highlightedImage_
                       target:(id)target_
     selectorForTouchUpInside:(SEL)selector_
{
    UIButton *button = [self buttonWithType:UIButtonTypeCustom];
    
    [button setImage:image_ forState:UIControlStateNormal];
    [button setImage:highlightedImage_ forState:UIControlStateHighlighted];
    
    CGSize size = image_.size;
    button.frame = CGRectMake(0, 0, size.width, size.height);
    
    if (target_ && selector_) {
        [button addTarget:target_ action:selector_ forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
}

@end
