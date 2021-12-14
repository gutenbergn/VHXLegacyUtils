//
//  VHXDateTimeUtil.m
//  VHX
//
//  Created by James Dennis on 2/4/15.
//  Copyright (c) 2015 VHX. All rights reserved.
//

#import "VHXDateTimeUtil.h"

@implementation VHXDateTimeUtil

/**
 *  The purpose of this function is to take an NSTimeInterval and convert it to
 *  something intended for a human to read. This function tries to be
 *  comprehensive by stacking units, eg. "1h23m5s"
 *
 *  @param totalSeconds NSInterval represents some duration of time.
 *  @param showSeconds indicates if the seconds should be shown.
 *
 *  @return an NSString representing what the string.
 */
+ (NSString *)convertTimeIntervalToUnits:(NSTimeInterval)totalSeconds {
    return [VHXDateTimeUtil convertTimeIntervalToUnits:totalSeconds showSeconds:YES];
}
    
+ (NSString *)convertTimeIntervalToUnits:(NSTimeInterval)totalSeconds showSeconds:(BOOL)showSeconds {
    int hours = totalSeconds / 3600;
    int minutes = (totalSeconds - hours * 3600) / 60;
    int seconds = totalSeconds - hours * 3600 - minutes * 60;
    
    NSMutableString *remainingTimeStr = [[NSMutableString alloc] init];
    if (hours > 0)
        [remainingTimeStr appendFormat:@"%dh", hours];
    if (minutes > 0)
        [remainingTimeStr appendFormat:@"%dm", minutes];
    if (seconds > 0 && showSeconds)
        [remainingTimeStr appendFormat:@"%ds", seconds];
    
    return remainingTimeStr;
}

/**
 *  Converts from an NSTimeInterval to a fuzzy description.
 *
 *  Examples:
 *  - 90094 (1 day, 1, hour, 1 minute, 34 seconds) => "1 day"
 *  - 3934 (65 hours, 5 minutes, 34 seconds) => "65 hours"
 *
 *  @param totalSeconds NSTimeInterval representing some period of time
 *
 *  @return an NSString representing the fuzzy description
 */
+ (NSString *)convertTimeIntervalToFuzzyUnit:(NSTimeInterval)totalSeconds {
    int days = round(totalSeconds / 86400);
    if (days == 1) {
        return @"1 day";
    } else if (days > 0) {
        return [NSString stringWithFormat:@"%i days", days];
    }

    int hours = round(totalSeconds / 3600);
    if (hours == 1) {
        return @"1 hour";
    } else if (hours > 0) {
        return [NSString stringWithFormat:@"%i hours", hours];
    }

    int minutes = round(totalSeconds / 60);
    if (minutes == 1) {
        return @"1 minute";
    } else if (minutes > 0) {
        return [NSString stringWithFormat:@"%i minutes", minutes];
    }
    
    if (totalSeconds == 1) {
        return @"1 second";
    } else if (totalSeconds > 0) {
        return [NSString stringWithFormat:@"%d seconds", (int)totalSeconds];
    }
    
    return @"Expired";
}

+ (NSDateFormatter *)dateFormatterFromFormat:(NSString *)formatString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = formatString;
    return dateFormatter;
}

+ (NSDateFormatter *)iso8601DateFormatter {
    return [self dateFormatterFromFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
}

+ (NSDate *)dateFromString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [self iso8601DateFormatter];
    return [dateFormatter dateFromString:dateString];
}

+ (NSTimeInterval)timeLeftUntilDate:(NSDate *)futureDate {
    NSTimeInterval timeLeft = [futureDate timeIntervalSince1970] - [[NSDate new] timeIntervalSince1970];
    return timeLeft;
}

+ (NSDate *)newDateFromDate:(NSDate *)sourceDate byAddingMinutes:(int)minutes {
    NSDateComponents *minutesComponent = [[NSDateComponents alloc] init];
    minutesComponent.minute = minutes;
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    NSDate *newDate = [theCalendar dateByAddingComponents:minutesComponent toDate:sourceDate options:0];
    return newDate;
}

+ (NSInteger) daysBetweenDate: (NSDate *)fromDateTime andDate: (NSDate *)toDateTime {
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

@end
