//
//  NSDate+Helpers.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 19/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "NSDate+Helpers.h"

static const unsigned componentFlags = (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay);

@implementation NSDate (Helpers)

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)aDate {
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:componentFlags fromDate:aDate];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

@end
