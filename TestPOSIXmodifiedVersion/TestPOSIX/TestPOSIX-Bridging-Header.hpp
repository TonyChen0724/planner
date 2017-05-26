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
#import "vector"

AssignmentCpp assignmentCppFromAssignmentObjc(AssignmentObjc *assobjc);

@interface Bridging : NSObject

+ (NSArray *)convertToAssignmentObjcArrayWithAssignmentCppVector:(std::vector<AssignmentCpp>)vasscpp;

+ (NSArray *)queryForAllAssignments;

+ (void)insertNewAssignmentCpp:(AssignmentCpp)asscpp;

+ (void)insertNewAssignmentObjc:(AssignmentObjc *)assobjc;

+ (BOOL)deleteAssignmentById:(NSNumber *)pkid;

@end

#endif /* TestPOSIX_Bridging_Header_h */
