/**
 Cosc345 Asn 2, TestPOSIX-Bridging-Header.h
 Purpose: part of code that solve the IOS sandbox environment problem.
 @author Xinru Chen, Luke Falvey, Molly Patterson
 @version 1.0 5/29/17
 */
#import "AssignmentObjc.hm"
#import "CalendarObjc.hm"

@interface Bridging : NSObject

+ (NSArray *)queryForAllAssignments;

+ (NSArray *)queryForAllNewAssignments;

+ (void)insertNewAssignmentObjc:(AssignmentObjc *)assobjc;

+ (void)insertNewNewAssignmentObjc:(AssignmentObjc *)assobjc;

+ (BOOL)deleteAssignmentById:(NSNumber *)pkid;

+ (BOOL)deleteNewAssignmentById:(NSNumber *)pkid;


+ (NSArray *)queryForAllCalendars;

+ (void)insertNewCalendarObjc:(CalendarObjc *)calobjc;

+ (BOOL)deleteCalendarById:(NSNumber *)pkid;

@end
