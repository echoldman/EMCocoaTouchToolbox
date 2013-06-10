//
//  EMIndexButton.m
//
//  Created by Echoldman on 13-6-10.
//  Copyright (c) 2013年 Echoldman. All rights reserved.
//

#import "EMIndexButton.h"
#import "UIButton+imagedButton.h"

@implementation EMIndexButton

+ (EMIndexButton *)buttonWithIndex:(NSUInteger)index_
                             image:(UIImage *)image_
{
    return [self buttonWithIndex:index_
                           image:image_
                highlightedImage:nil
                          target:nil
        selectorForTouchUpInside:nil];
}

+ (EMIndexButton *)buttonWithIndex:(NSUInteger)index_
                             image:(UIImage *)image_
                  highlightedImage:(UIImage *)highlightedImage_
{
    return [self buttonWithIndex:index_
                           image:image_
                highlightedImage:highlightedImage_
                          target:nil
        selectorForTouchUpInside:nil];
}

+ (EMIndexButton *)buttonWithIndex:(NSUInteger)index_
                             image:(UIImage *)image_
                  highlightedImage:(UIImage *)highlightedImage_
                            target:(id)target_
          selectorForTouchUpInside:(SEL)selector_
{
    EMIndexButton *button = (EMIndexButton *)[super buttonWithImage:image_
                                                   highlightedImage:highlightedImage_
                                                             target:self
                                           selectorForTouchUpInside:selector_];
    button.index = index_;
    return button;
}

@end
