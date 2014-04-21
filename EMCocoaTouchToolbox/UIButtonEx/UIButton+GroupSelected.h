//
//  UIButton+GroupSelected.h
//
//  Created by Echoldman on 4/21/14.
//  Copyright (c) 2014 Echoldman. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@interface UIButton (GroupSelected)

@property (nonatomic, assign) BOOL lastSelectedButton;

@property (nonatomic, retain) UIImage *normalImage;
@property (nonatomic, retain) UIImage *selectedImage;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, retain) NSString *group;

- (void)setTarget:(id)target selectorForTouchUpInside:(SEL)selector;

@end
