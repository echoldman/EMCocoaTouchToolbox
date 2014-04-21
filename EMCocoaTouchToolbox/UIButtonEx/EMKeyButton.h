//
//  EMKeyButton.h
//
//  Created by Echoldman on 13-6-10.
//  Copyright (c) 2013 Echoldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMKeyButton : UIButton

@property (nonatomic, copy) NSString *key;

+ (EMKeyButton *)buttonWithKey:(NSString *)key
                         image:(UIImage *)image;

+ (EMKeyButton *)buttonWithKey:(NSString *)key
                         image:(UIImage *)image
              highlightedImage:(UIImage *)highlightedImage;

+ (EMKeyButton *)buttonWithKey:(NSString *)key
                         image:(UIImage *)image
              highlightedImage:(UIImage *)highlightedImage
                        target:(id)target
      selectorForTouchUpInside:(SEL)selector;

@end
