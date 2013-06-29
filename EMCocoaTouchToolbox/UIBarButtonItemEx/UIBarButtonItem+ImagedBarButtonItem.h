//
//  UIBarButtonItem+imagedBarButtonItem.h
//
//  Created by Echoldman on 13-5-27.
//  Copyright (c) 2013年 Echoldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ImagedBarButtonItem)

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image
                  highlightedImage:(UIImage *)highlightedImage
                            target:(id)target
          selectorForTouchUpInside:(SEL)selectorForTouchUpInside;

@end
