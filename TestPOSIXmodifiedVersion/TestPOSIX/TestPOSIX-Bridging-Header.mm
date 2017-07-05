/**
 Cosc345 Asn 2, TestPOSIX-Bridging-Header.mm
 Purpose: part of code that solve the IOS sandbox environment problem.
 @author Xinru Chen, Luke Falvey, Molly Patterson
 @version 1.0 5/29/17
 */

#import <Foundation/Foundation.h>
#import "TestPOSIX-Bridging-Header.hpp"
#import "AssignmentObjc.h"
#import "sqlite_operations.hpp"

#import "vector"
#import "string"
#import "functional"

using namespace std;

@interface Bridging ()

@end

@implementation Bridging

+ (NSArray *)convertToAssignmentObjcArrayWithAssignmentCppVector:(vector<AssignmentCpp>)vasscpp {
    vector<AssignmentObjc *> outVec;
    outVec.resize(vasscpp.size());
    transform(vasscpp.begin(), vasscpp.end(), outVec.begin(), [](AssignmentCpp asscpp){
        return [AssignmentObjc assignmentObjcWithAssignmentCpp:asscpp];
    });
    return [NSArray arrayWithObjects:&outVec[0] count:outVec.size()];
}

+ (NSArray *)queryForAllAssignments {
    auto assVec = queryForAllAssignments();
    return [Bridging convertToAssignmentObjcArrayWithAssignmentCppVector:assVec];
}

+ (NSArray *)queryForAllNewAssignments {
    auto assVec = queryForAllNewAssignments();
    return [Bridging convertToAssignmentObjcArrayWithAssignmentCppVector:assVec];
}

+ (NSArray *)queryForAllNewNewAssignments {
    auto assVec = queryForAllNewNewAssignments();
    return [Bridging convertToAssignmentObjcArrayWithAssignmentCppVector:assVec];
}



+ (void)insertNewAssignmentCpp:(AssignmentCpp)asscpp {
    insertNewAssignmentCpp(asscpp);
}

+ (void)insertNewNewAssignmentCpp:(AssignmentCpp)asscpp {
    insertNewNewAssignmentCpp(asscpp);
}

+ (void)insertNewNewNewAssignmentCpp:(AssignmentCpp)asscpp {
    insertNewNewNewAssignmentCpp(asscpp);
}

+ (void)insertNewAssignmentObjc:(AssignmentObjc *)assobjc {
    [Bridging insertNewAssignmentCpp:assignmentCppFromAssignmentObjc(assobjc)];
}

+ (void)insertNewNewAssignmentObjc:(AssignmentObjc *)assobjc {
    [Bridging insertNewNewAssignmentCpp:assignmentCppFromAssignmentObjc(assobjc)];
}

+ (void)insertNewNewNewAssignmentObjc:(AssignmentObjc *)assobjc {
    [Bridging insertNewNewAssignmentCpp:assignmentCppFromAssignmentObjc(assobjc)];
}

+ (BOOL)deleteAssignmentById:(NSNumber *)pkid {
    return deleteAssignmentById([pkid intValue]);
}

+ (BOOL)deleteNewAssignmentById:(NSNumber *)pkid {
    return deleteNewAssignmentById([pkid intValue]);
}

+ (BOOL)deleteNewNewAssignmentById:(NSNumber *)pkid {
    return deleteNewNewAssignmentById([pkid intValue]);
}

+ (NSArray *)convertToCalendarObjcArrayWithCalendarCppVector:(std::vector<CalendarCpp>)vcalcpp {
    vector<CalendarObjc *> outVec;
    outVec.resize(vcalcpp.size());
    transform(vcalcpp.begin(), vcalcpp.end(), outVec.begin(), [](CalendarCpp calcpp){
        return [CalendarObjc calendarObjcWithCalendarCpp:calcpp];
    });
    return [NSArray arrayWithObjects:&outVec[0] count:outVec.size()];
}

+ (NSArray *)queryForAllCalendars {
    auto calVec = queryForAllCalendarCpp();
    return [Bridging convertToCalendarObjcArrayWithCalendarCppVector:calVec];
}

/*+ (void)insertNewCalendarCpp:(CalendarCpp)calcpp {
    insertNewCalendarCpp(calcpp);
}*/

+ (void)insertNewCalendarObjc:(CalendarObjc *)calobjc {
    [Bridging insertNewCalendarCpp:calendarCppFromCalendarObjc(calobjc)];
}

+ (BOOL)deleteCalendarById:(NSNumber *)pkid {
    return deleteCalendarById([pkid intValue]);
}



@end
