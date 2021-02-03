//
//  VHXColorUtil.m
//  VHX
//
//  Created by Gina Binetti on 8/3/14.
//  Copyright (c) 2014 VHX. All rights reserved.
//

#import "VHXColorUtil.h"

@implementation VHXColorUtil

+ (UIColor *)getColorWithHexColor:(NSString *)hexString withDefaultUIColor:(UIColor *)defaultColor {
    if (hexString.length == 7) { // # hex value
        NSString *noHashString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""]; //remove hash
        NSScanner *scanner = [NSScanner scannerWithString:noHashString];
        [scanner setCharactersToBeSkipped:[NSCharacterSet symbolCharacterSet]]; // remove + and $
        
        unsigned hex;
        if ([scanner scanHexInt:&hex]) {
            int r = (hex >> 16) & 0xFF;
            int g = (hex >> 8) & 0xFF;
            int b = (hex) & 0xFF;
            
            return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f];
        } else {
            return defaultColor;
        }
    } else {
        return defaultColor;
    }
}

+ (float)getColorLuminosityWithHexColor:(NSString *) hexString {
    if (hexString.length == 7) { // # hex value
        NSString *noHashString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""]; //remove hash
        NSScanner *scanner = [NSScanner scannerWithString:noHashString];
        [scanner setCharactersToBeSkipped:[NSCharacterSet symbolCharacterSet]]; // remove + and $
        
        unsigned hex;
        if ([scanner scanHexInt:&hex]) {
            int r = (hex >> 16) & 0xFF;
            int g = (hex >> 8) & 0xFF;
            int b = (hex) & 0xFF;
            
            return [VHXColorUtil getColorLuminosityWithRed:r green:g blue:b];
        } else {
            return 0;
        }
    } else {
        return 0;
    }
}

+ (float)getColorLuminosityWithRed:(float) red green:(float) green blue:(float) blue {
    return  ((red * 299) + (green * 587) + (blue * 114)) / 1000;
}
    
+ (UIColor *)getDarkerColorForColor:(UIColor *) c {
    CGFloat r, g, b, a;
    if ([c getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MAX(r - 0.1, 0.0)
                               green:MAX(g - 0.1, 0.0)
                                blue:MAX(b - 0.1, 0.0)
                               alpha:a];
    return nil;

}

+ (NSString *)hexStringFromColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    CGFloat r;
    CGFloat g;
    CGFloat b;
    
    // if there are only 2 components, the color was created by setting only its `white` values, not the RGB, so
    // it needs to be treated differently [GN]
    if (CGColorGetNumberOfComponents(color.CGColor) == 2) {
        r = components[0];
        g = r;
        b = r;
    } else {
        r = components[0];
        g = components[1];
        b = components[2];
    }

    return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}

@end
