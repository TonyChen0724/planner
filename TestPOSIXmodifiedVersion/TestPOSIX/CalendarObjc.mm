/**
 Cosc345 Asn 2, CalendarObjc.mm
 Purpose: part of code that solve the IOS sandbox environment problem.
 @author Xinru Chen, Luke Falvey, Molly Patterson
 @version 1.0 5/29/17
 */

#import "CalendarObjc.h"

CalendarCpp calendarCppFromCalendarObjc(CalendarObjc *calobjc) {
    return CalendarCpp([calobjc.pkid intValue], [calobjc.classes cStringUsingEncoding:NSASCIIStringEncoding], [calobjc.starttimes cStringUsingEncoding:NSASCIIStringEncoding], [calobjc.days cStringUsingEncoding:NSASCIIStringEncoding], [calobjc.weekly cStringUsingEncoding:NSASCIIStringEncoding], [calobjc.fortnightly cStringUsingEncoding:NSASCIIStringEncoding], [calobjc.location cStringUsingEncoding:NSASCIIStringEncoding]);
}

@implementation CalendarObjc

- (instancetype)initWithPkid:(NSNumber *)pkid classes:(NSString *)classes starttimes:(NSString *)starttimes days:(NSString *)days weekly:(NSString *)weekly fortnightly:(NSString *)fortnightly location:(NSString *)location {
    _pkid = pkid;
    _classes = classes;
    _starttimes = starttimes;
    _days = days;
    _weekly = weekly;
    _fortnightly = fortnightly;
    _location = location;
    
    return self;
}

- (instancetype)initWithCalendarCpp:(CalendarCpp)calCpp {
    return [self initWithPkid:[NSNumber numberWithInt:calCpp.pkid] classes:[NSString stringWithCString:calCpp.classes.c_str() encoding:NSASCIIStringEncoding] starttimes:[NSString stringWithCString:calCpp.starttimes.c_str() encoding:NSASCIIStringEncoding] days:[NSString stringWithCString:calCpp.days.c_str() encoding:NSASCIIStringEncoding] weekly:[NSString stringWithCString:calCpp.weekly.c_str() encoding:NSASCIIStringEncoding] fortnightly:[NSString stringWithCString:calCpp.fortnightly.c_str() encoding:NSASCIIStringEncoding] location:[NSString stringWithCString:calCpp.location.c_str() encoding:NSASCIIStringEncoding]];
}

+ (instancetype)calendarObjcWithPkid:(NSNumber *)pkid classes:(NSString *)classes starttimes:(NSString *)starttimes days:(NSString *)days weekly:(NSString *)weekly fortnightly:(NSString *)fortnightly location:(NSString *)location{
    return [[CalendarObjc alloc] initWithPkid:pkid classes:classes starttimes:starttimes days:days weekly:weekly fortnightly:fortnightly location:location];
}

+ (instancetype)calendarObjcWithCalendarCpp:(CalendarCpp)calCpp {
    return [[CalendarObjc alloc] initWithCalendarCpp:calCpp];
}

- (CalendarCpp)toCalendarCpp {
    return calendarCppFromCalendarObjc(self);
}

@end
