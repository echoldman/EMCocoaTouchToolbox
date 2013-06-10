//
//  EMIndexButton.h
//
//  Created by Echoldman on 13-6-10.
//  Copyright (c) 2013年 Echoldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMIndexButton : UIButton

@property (nonatomic, assign) NSUInteger index;

+ (EMIndexButton *)buttonWithIndex:(NSUInteger)index
                             image:(UIImage *)image;

+ (EMIndexButton *)buttonWithIndex:(NSUInteger)index
                             image:(UIImage *)image
                  highlightedImage:(UIImage *)highlightedImage;

+ (EMIndexButton *)buttonWithIndex:(NSUInteger)index
                             image:(UIImage *)image
                  highlightedImage:(UIImage *)highlightedImage
                            target:(id)target
          selectorForTouchUpInside:(SEL)selector;

@end
