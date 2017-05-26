//
//  TestPOSIX-Bridging.m
//  TestPOSIX
//
//  Created by Xinru Chen on 5/25/17.
//  Copyright © 2017 Xinru Chen. All rights reserved.
//

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

+ (void)insertNewAssignmentCpp:(AssignmentCpp)asscpp {
    insertNewAssignmentCpp(asscpp);
}

+ (void)insertNewAssignmentObjc:(AssignmentObjc *)assobjc {
    [Bridging insertNewAssignmentCpp:assignmentCppFromAssignmentObjc(assobjc)];
}

+ (BOOL)deleteAssignmentById:(NSNumber *)pkid {
    return deleteAssignmentById([pkid intValue]);
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

+ (void)insertNewCalendarCpp:(CalendarCpp)calcpp {
    insertNewCalendarCpp(calcpp);
}

+ (void)insertNewCalendarObjc:(CalendarObjc *)calobjc {
    [Bridging insertNewCalendarCpp:calendarCppFromCalendarObjc(calobjc)];
}

+ (BOOL)deleteCalendarById:(NSNumber *)pkid {
    return deleteCalendarById([pkid intValue]);
}

@end
