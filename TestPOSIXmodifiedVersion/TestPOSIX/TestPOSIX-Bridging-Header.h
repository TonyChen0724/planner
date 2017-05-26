//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//
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
