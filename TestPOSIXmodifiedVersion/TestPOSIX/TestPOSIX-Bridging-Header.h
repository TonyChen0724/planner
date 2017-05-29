/**
 Cosc345 Asn 2, TestPOSIX-Bridging-Header.h
 
 @author Xinru Chen, Luke Falvey, Molly Patterson
 @version 1.0 5/29/17
 */
#import "AssignmentObjc.hm"
#import "CalendarObjc.hm"

@interface Bridging : NSObject

+ (NSArray *)queryForAllAssignments;

+ (void)insertNewAssignmentObjc:(AssignmentObjc *)assobjc;

+ (BOOL)deleteAssignmentById:(NSNumber *)pkid;

+ (NSArray *)queryForAllCalendars;

+ (void)insertNewCalendarObjc:(CalendarObjc *)calobjc;

+ (BOOL)deleteCalendarById:(NSNumber *)pkid;

@end
