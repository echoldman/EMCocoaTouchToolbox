//
//  UIView+Interaction.h
//
//  Created by Echoldman on 5/19/14.
//

#import <UIKit/UIKit.h>

@interface UIView (Interaction)

- (UITapGestureRecognizer *)addTapRectangle:(CGRect)rectangle
                                     target:(id)target
                                   selector:(SEL)selector;
- (UITapGestureRecognizer *)addTapRectangle:(CGRect)rectangle
                                     target:(id)target
                                   selector:(SEL)selector
                                      color:(UIColor *)color;

@end
