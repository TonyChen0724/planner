//
//  Assignment.h
//  TestPOSIX
//
//  Created by Xinru Chen on 5/24/17.
//  Copyright © 2017 Xinru Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite_operations.hpp"

@interface AssignmentObjc : NSObject

@property (readonly) NSNumber *pkid;
@property (readonly) NSString *lecture;
@property (readonly) NSString *time;
@property (readonly) NSString *position;

- (instancetype)initWithPkid:(NSNumber *)pkid lecture:(NSString *)lecture time:(NSString *)time position:(NSString *)position;

- (instancetype)initWithAssignmentCpp:(AssignmentCpp)assCpp;

+ (instancetype)assignmentObjcWithPkid:(NSNumber *)pkid lecture:(NSString *)lecture time:(NSString *)time position:(NSString *)position;

+ (instancetype)assignmentObjcWithAssignmentCpp:(AssignmentCpp)assCpp;

- (AssignmentCpp)toAssignmentCpp;

@end

AssignmentCpp assignmentCppFromAssignmentObjc(AssignmentObjc *assobjc);
