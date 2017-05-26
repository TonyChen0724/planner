//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//
#import "AssignmentObjc.hm"

@interface Bridging : NSObject

+ (NSArray *)queryForAllAssignments;

+ (void)insertNewAssignment:(AssignmentObjc *)ass;

@end
