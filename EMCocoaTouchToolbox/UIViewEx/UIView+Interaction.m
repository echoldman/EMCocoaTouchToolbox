//
//  UIView+Interaction.m
//
//  Created by Echoldman on 5/19/14.
//

#import "UIView+Interaction.h"

@implementation UIView (Interaction)

- (UITapGestureRecognizer *)addTapRectangle:(CGRect)rectangle
                                     target:(id)target
                                   selector:(SEL)selector
{
    return [self addTapRectangle:rectangle
                          target:target
                        selector:selector
                           color:[UIColor clearColor]];
}

- (UITapGestureRecognizer *)addTapRectangle:(CGRect)rectangle
                                     target:(id)target
                                   selector:(SEL)selector
                                      color:(UIColor *)color
{
    UITapGestureRecognizer *tapRecognizer = [[[UITapGestureRecognizer alloc] initWithTarget:target
                                                                                     action:selector] autorelease];
    tapRecognizer.numberOfTouchesRequired = 1;
    tapRecognizer.numberOfTapsRequired = 1;
    
    UIView *tapView = [[[UIView alloc] initWithFrame:rectangle] autorelease];
    [tapView setBackgroundColor:[UIColor clearColor]];
    [tapView addGestureRecognizer:tapRecognizer];
    
    [self addSubview:tapView];
    
    return tapRecognizer;
}

@end
