//
//  global.h
//  MyData
//
//  Created by Matt Memmo on 5/13/14.
//  Copyright (c) 2014 RWS. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *var3; 


@interface global : NSObject{
    
    NSString *var1s;
    NSString *var2s;
}



@property(nonatomic, retain) NSString *var1s;
@property(nonatomic, retain) NSString *var2s;

+ (global *)sharedSingleton;


@end
