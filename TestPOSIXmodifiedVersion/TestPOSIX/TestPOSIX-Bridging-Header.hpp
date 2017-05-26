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

@interface Bridging : NSObject

+ (NSArray *)convertToAssignmentObjcArrayWithAssignmentCppVector:(std::vector<AssignmentCpp>)vasscpp;

+ (NSArray *)queryForAllAssignments;

+ (void)insertNewAssignment:(AssignmentObjc *)ass;

@end

#endif /* TestPOSIX_Bridging_Header_h */
