//
//  TestPOSIX-Bridging-Header.hpp
//  TestPOSIX
//
//  Created by Xinru Chen on 5/25/17.
//  Copyright © 2017 Xinru Chen. All rights reserved.
//

#ifndef TestPOSIX_Bridging_Header_h
#define TestPOSIX_Bridging_Header_h

#import "AssignmentObjc.h"
#import "CalendarObjc.h"
#import "vector"

AssignmentCpp assignmentCppFromAssignmentObjc(AssignmentObjc *assobjc);
CalendarCpp calendarCppFromCalendarObjc(CalendarObjc *calobjc);

@interface Bridging : NSObject

+ (NSArray *)convertToAssignmentObjcArrayWithAssignmentCppVector:(std::vector<AssignmentCpp>)vasscpp;

+ (NSArray *)queryForAllAssignments;

+ (void)insertNewAssignmentCpp:(AssignmentCpp)asscpp;

+ (void)insertNewAssignmentObjc:(AssignmentObjc *)assobjc;

+ (BOOL)deleteAssignmentById:(NSNumber *)pkid;

+ (NSArray *)convertToCalendarObjcArrayWithCalendarCppVector:(std::vector<CalendarCpp>)vcalcpp;

+ (NSArray *)queryForAllCalendars;

+ (void)insertNewCalendarCpp:(CalendarCpp)calcpp;

+ (void)insertNewCalendarObjc:(CalendarObjc *)calobjc;

+ (BOOL)deleteCalendarById:(NSNumber *)pkid;

@end

#endif /* TestPOSIX_Bridging_Header_h */
