//
//  UIBarButtonItem+imagedBarButtonItem.m
//
//  Created by Echoldman on 13-5-27.
//  Copyright (c) 2013年 Echoldman. All rights reserved.
//

#import "UIBarButtonItem+ImagedBarButtonItem.h"
#import "UIButton+ImagedButton.h"

@implementation UIBarButtonItem (ImagedBarButtonItem)

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image_
                  highlightedImage:(UIImage *)highlightedImage_
                            target:(id)target_
          selectorForTouchUpInside:(SEL)selectorForTouchUpInside_
{
    UIButton *button = [UIButton buttonWithImage:image_
                                highlightedImage:highlightedImage_
                                          target:target_
                        selectorForTouchUpInside:selectorForTouchUpInside_];
    UIBarButtonItem * barButtonItem = [[self alloc] initWithCustomView:button];
    [barButtonItem autorelease];
    
    return barButtonItem;
}

@end
