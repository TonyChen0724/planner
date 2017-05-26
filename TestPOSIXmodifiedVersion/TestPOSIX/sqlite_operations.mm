//
//  sqlite_operations.m
//  TestPOSIX
//
//  Created by Xinru Chen on 5/25/17.
//  Copyright © 2017 Xinru Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "sqlite_operations.hpp"

AssignmentCpp::AssignmentCpp(AssignmentObjc *assobjc): AssignmentCpp([assobjc.pkid intValue], [assobjc.lecture cStringUsingEncoding:NSASCIIStringEncoding], [assobjc.time cStringUsingEncoding:NSASCIIStringEncoding], [assobjc.position cStringUsingEncoding:NSASCIIStringEncoding]) {}
