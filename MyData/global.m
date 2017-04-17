//
//  global.m
//  MyData
//
//  Created by Matt Memmo on 5/13/14.
//  Copyright (c) 2014 RWS. All rights reserved.
//

#import "global.h"

NSString *var3; // global variable

@implementation global

@synthesize var1s, var2s;

static global *shared = NULL;



- (id)init
{
    if ( self = [super init] )
    {
        // initialize your singleton variable here (i.e. set to initial value that you require)
        
        var1s = @"My Singleton 1";
        var2s = @"newtimetable.db"; // ***
    }
    return self;
    
}


+ (global *)sharedSingleton
{
    @synchronized(shared)
    {
        if ( !shared || shared == NULL )
        {
            // allocate the shared instance, because it hasn't been done yet
            shared = [[global alloc] init];
        }
        
        return shared;
    }
}





@end

