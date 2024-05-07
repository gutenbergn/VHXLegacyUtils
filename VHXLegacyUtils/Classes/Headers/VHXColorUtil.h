//
//  VHXColorUtil.h
//  VHX
//
//  Created by Gina Binetti on 8/3/14.
//  Copyright (c) 2014 VHX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define COLOR_LUMINOSITY_THRESHOLD 150

@interface VHXColorUtil : NSObject

+ (UIColor *)getColorWithHexColor:(NSString *)hexString withDefaultUIColor:(UIColor *)defaultColor;
+ (float)getColorLuminosityWithHexColor:(NSString *) hexString;
+ (UIColor *)getDarkerColorForColor:(UIColor *) c;
+ (NSString *)hexStringFromColor:(UIColor *)color;

@end
