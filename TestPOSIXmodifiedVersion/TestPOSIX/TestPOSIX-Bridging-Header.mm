//
//  TestPOSIX-Bridging.m
//  TestPOSIX
//
//  Created by Xinru Chen on 5/25/17.
//  Copyright © 2017 Xinru Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestPOSIX-Bridging-Header.hpp"
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

+ (void)insertNewAssignment:(AssignmentObjc *)ass {
    
}

@end
