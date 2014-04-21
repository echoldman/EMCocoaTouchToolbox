//
//  EMKeyButton.m
//
//  Created by Echoldman on 13-6-10.
//  Copyright (c) 2013 Echoldman. All rights reserved.
//

#import "EMKeyButton.h"
#import "UIButton+imagedButton.h"

@implementation EMKeyButton

- (void)dealloc
{
    [_key release];
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        _key = nil;
    }
    return self;
}

+ (EMKeyButton *)buttonWithKey:(NSString *)key_
                         image:(UIImage *)image_
{
    return [self buttonWithKey:key_
                         image:image_
              highlightedImage:nil
                        target:self
      selectorForTouchUpInside:nil];
}

+ (EMKeyButton *)buttonWithKey:(NSString *)key_
                         image:(UIImage *)image_
              highlightedImage:(UIImage *)highlightedImage_
{
    return [self buttonWithKey:key_
                         image:image_
              highlightedImage:highlightedImage_
                        target:nil
      selectorForTouchUpInside:nil];
}

+ (EMKeyButton *)buttonWithKey:(NSString *)key_
                         image:(UIImage *)image_
              highlightedImage:(UIImage *)highlightedImage_
                        target:(id)target_
      selectorForTouchUpInside:(SEL)selector_
{
    EMKeyButton * button = (EMKeyButton *)[super buttonWithImage:image_
                                                highlightedImage:highlightedImage_
                                                          target:target_
                                        selectorForTouchUpInside:selector_];
    button.key = key_;
    
    return button;
}

@end
