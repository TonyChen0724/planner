//
//  Assignment.m
//  TestPOSIX
//
//  Created by Xinru Chen on 5/24/17.
//  Copyright © 2017 Xinru Chen. All rights reserved.
//

#import "AssignmentObjc.h"

AssignmentCpp assignmentCppFromAssignmentObjc(AssignmentObjc *assobjc) {
    return AssignmentCpp([assobjc.pkid intValue], [assobjc.lecture cStringUsingEncoding:NSASCIIStringEncoding], [assobjc.time cStringUsingEncoding:NSASCIIStringEncoding], [assobjc.position cStringUsingEncoding:NSASCIIStringEncoding]);
}

@implementation AssignmentObjc

- (instancetype)initWithPkid:(NSNumber *)pkid lecture:(NSString *)lecture time:(NSString *)time position:(NSString *)position {
    _pkid = pkid;
    _lecture = lecture;
    _time = time;
    _position = position;
    return self;
}

- (instancetype)initWithAssignmentCpp:(AssignmentCpp)assCpp {
    return [self initWithPkid:[NSNumber numberWithInt:assCpp.pkid] lecture:[NSString stringWithCString:assCpp.lecture.c_str() encoding:NSASCIIStringEncoding] time:[NSString stringWithCString:assCpp.time.c_str() encoding:NSASCIIStringEncoding] position:[NSString stringWithCString:assCpp.position.c_str() encoding:NSASCIIStringEncoding]];
}

+ (instancetype)assignmentObjcWithPkid:(NSNumber *)pkid lecture:(NSString *)lecture time:(NSString *)time position:(NSString *)position {
    return [[AssignmentObjc alloc] initWithPkid:pkid lecture:lecture time:time position:position];
}

+ (instancetype)assignmentObjcWithAssignmentCpp:(AssignmentCpp)assCpp {
    return [[AssignmentObjc alloc] initWithAssignmentCpp:assCpp];
}

- (AssignmentCpp)toAssignmentCpp {
    return assignmentCppFromAssignmentObjc(self);
}

@end
