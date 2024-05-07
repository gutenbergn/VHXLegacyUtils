//
//  VHXDateTimeUtil.h
//  VHX
//
//  Created by James Dennis on 2/4/15.
//  Copyright (c) 2015 VHX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VHXDateTimeUtil : NSObject

+ (NSString *)convertTimeIntervalToUnits:(NSTimeInterval)totalSeconds;
+ (NSString *)convertTimeIntervalToUnits:(NSTimeInterval)totalSeconds showSeconds:(BOOL)showSeconds;
+ (NSString *)convertTimeIntervalToFuzzyUnit:(NSTimeInterval)totalSeconds;

+ (NSDateFormatter *)dateFormatterFromFormat:(NSString *)formatString;
+ (NSDateFormatter *)iso8601DateFormatter;
+ (NSDate *)dateFromString:(NSString *)dateString;

+ (NSTimeInterval)timeLeftUntilDate:(NSDate *)futureDate;
+ (NSDate *)newDateFromDate:(NSDate *)sourceDate byAddingMinutes:(int)minutes;
+ (NSInteger)daysBetweenDate:(NSDate *)fromDateTime andDate:(NSDate *)toDateTime;

@end
