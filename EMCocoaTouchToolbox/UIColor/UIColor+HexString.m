//
//  UIColor+HexString.m
//
//  Created by Echoldman on 14-5-8.
//  Copyright (c) 2014 Echoldman. All rights reserved.
//

#import "UIColor+HexString.h"

@implementation UIColor (HexString)

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    unsigned int red;
    unsigned int green;
    unsigned int blue;
    unsigned int offset = ((hexString.length == 7) ? 1 : 0);

    NSRange range;
    range.length = 2;
    
    range.location = 0 + offset;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&red];
    range.location = 2 + offset;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&green];
    range.location = 4 + offset;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:1.0f];
}

@end
