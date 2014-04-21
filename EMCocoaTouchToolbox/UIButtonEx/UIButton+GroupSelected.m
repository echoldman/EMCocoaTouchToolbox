//
//  UIButton+GroupSelected.m
//
//  Created by Echoldman on 4/21/14.
//  Copyright (c) 2014 Echoldman. All rights reserved.
//
//

#import "UIButton+GroupSelected.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation UIButton (GroupSelected)

#define UIButton_EX_lastSelectedButton          "UIButton_Ex_lastSelectedButton"

#define UIButton_EX_normalImage                 "UIButton_EX_normalImage"
#define UIButton_EX_selectedImage               "UIButton_EX_selectedImage"
#define UIButton_EX_selected                    "UIButton_EX_selected"
#define UIButton_EX_group                       "UIButton_EX_group"
#define UIButton_EX_target                      "UIButton_EX_target"
#define UIButton_EX_selectorForTouchUpInside    "UIButton_EX_selectorForTouchUpInside"

#define UIButton_EX_Key_sender                                  @"UIButton_EX_Key_sender"

#define UIButton_EX_Notification_LastSelectedButtonDidChange    @"UIButton_EX_Notification_LastSelectedButtonDidChange"

- (void)dealloc
{
    if (self.group) {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
    
    [super dealloc];
}

- (BOOL)lastSelectedButton
{
    NSNumber *object = objc_getAssociatedObject(self, UIButton_EX_lastSelectedButton);
    BOOL last = FALSE;
    if (object) {
        last = object.boolValue;
    }
    return last;
}

- (void)setLastSelectedButton:(BOOL)isLast
{
    objc_setAssociatedObject(self, UIButton_EX_lastSelectedButton, [NSNumber numberWithBool:isLast], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)normalImage
{
    return objc_getAssociatedObject(self, UIButton_EX_normalImage);
}

- (void)setNormalImage:(UIImage *)normalImage
{
    objc_setAssociatedObject(self, UIButton_EX_normalImage, normalImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)selectedImage
{
    return objc_getAssociatedObject(self, UIButton_EX_selectedImage);
}

- (void)setSelectedImage:(UIImage *)selectedImage
{
    objc_setAssociatedObject(self, UIButton_EX_selectedImage, selectedImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)selected
{
    NSNumber *object = objc_getAssociatedObject(self, UIButton_EX_selected);
    BOOL selected = FALSE;
    if (object) {
        selected = object.boolValue;
    }
    return selected;
}

- (void)setSelected:(BOOL)selected
{
    UIImage *image = selected ? self.selectedImage : self.normalImage;
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:nil forState:UIControlStateHighlighted];
    
    if (selected) {
        self.lastSelectedButton = YES;
    }
    
    objc_setAssociatedObject(self, UIButton_EX_selected, [NSNumber numberWithBool:selected], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)group
{
    return objc_getAssociatedObject(self, UIButton_EX_group);
}

- (void)setGroup:(NSString *)group
{
    objc_setAssociatedObject(self, UIButton_EX_group, group, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (self.group) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onLastSelectedButtonDidChange:)
                                                     name:UIButton_EX_Notification_LastSelectedButtonDidChange
                                                   object:nil];
    }
    else {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UIButton_EX_Notification_LastSelectedButtonDidChange
                                                      object:nil];
    }
}

- (void)setTarget:(id)target selectorForTouchUpInside:(SEL)selector
{
    objc_setAssociatedObject(self, UIButton_EX_target, target, OBJC_ASSOCIATION_ASSIGN);
    objc_setAssociatedObject(self, UIButton_EX_selectorForTouchUpInside, NSStringFromSelector(selector), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addTarget:self action:@selector(onTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onTouchUpInside:(UIButton *)sender
{
    NSDictionary *userInfo = @{@"sender": self};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UIButton_EX_Notification_LastSelectedButtonDidChange
                                                        object:nil
                                                      userInfo:userInfo];
    
    self.selected = !(self.selected);
    
    NSString *selectorString = (NSString *)objc_getAssociatedObject(self, UIButton_EX_selectorForTouchUpInside);
    SEL selector = NSSelectorFromString(selectorString);
    id target = objc_getAssociatedObject(self, UIButton_EX_target);
    objc_msgSend(target, selector, self);
}

- (void)onLastSelectedButtonDidChange:(NSNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    UIButton *sender = [userInfo objectForKey:@"sender"];
    
    if (![sender isEqual:self] && self.lastSelectedButton && [sender.group isEqual:self.group]) {
        
        self.lastSelectedButton = NO;
        
        self.selected = !(self.selected);
    }
}

@end
