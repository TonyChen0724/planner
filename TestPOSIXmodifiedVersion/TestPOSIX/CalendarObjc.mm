/**
 Cosc345 Asn 2, CalendarObjc.mm
 
 @author Xinru Chen, Luke Falvey, Molly Patterson
 @version 1.0 5/29/17
 */

#import "CalendarObjc.h"

CalendarCpp calendarCppFromCalendarObjc(CalendarObjc *calobjc) {
    return CalendarCpp {
        [calobjc.pkid intValue],
        std::string([[calobjc.row stringValue] cStringUsingEncoding:NSASCIIStringEncoding]),
        std::string([[calobjc.col stringValue] cStringUsingEncoding:NSASCIIStringEncoding]),
        std::string([calobjc.content cStringUsingEncoding:NSASCIIStringEncoding]),
        std::string([calobjc.colorName cStringUsingEncoding:NSASCIIStringEncoding])
    };
}

@implementation CalendarObjc

- (instancetype)initWithPkid:(NSNumber *)pkid row:(NSNumber *)row col:(NSNumber *)col content:(NSString *)content color:(UIColor *)color {
    _pkid = pkid;
    _row = row;
    _col = col;
    _content = content;
    _color = color;
    return self;
}

+ (instancetype)calendarObjcWithPkid:(NSNumber *)pkid row:(NSNumber *)row col:(NSNumber *)col content:(NSString *)content color:(UIColor *)color {
    return [[CalendarObjc alloc] initWithPkid:pkid row:row col:col content:content color:color];
}

- (instancetype)initWithCalendarCpp:(CalendarCpp)calcpp {
    SEL colorSel = NSSelectorFromString([NSString stringWithCString:calcpp.color.c_str() encoding:NSASCIIStringEncoding]);
    auto colorImp = (UIColor *(*)(SEL)) [UIColor methodForSelector:colorSel];
    return [self initWithPkid:[NSNumber numberWithInt:calcpp.pkid] row:[NSNumber numberWithInt:std::stoi(calcpp.row)] col:[NSNumber numberWithInt:std::stoi(calcpp.col)] content:[NSString stringWithCString:calcpp.content.c_str() encoding:NSASCIIStringEncoding] color:colorImp(colorSel)];
}

+ (instancetype)calendarObjcWithCalendarCpp:(CalendarCpp)calcpp {
    return [[CalendarObjc alloc] initWithCalendarCpp:calcpp];
}

- (CalendarCpp)toCalendarCpp {
    return calendarCppFromCalendarObjc(self);
}



@end
