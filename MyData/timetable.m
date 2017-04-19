//
//  timetable.m
//  MyData
//
//  Created by Xinru Chen on 4/17/17.
//  Copyright © 2017 RWS. All rights reserved.
//

#import "timetable.h"
#import "global.h"
@interface timetable ()

@end

NSString * myDB;
global *globalVar;

@implementation timetable

@synthesize ider;
@synthesize listNames;
@synthesize globVar;


- (void)viewDidLoad {
    [super viewDidLoad];
    global * myVar = [global sharedSingleton];
    listNames.text = myVar.var1s;
    myVar.var1s=@"Change Var";
    myDB= myVar.var2s;
    var3=@"Screen 1";
    globVar.text=var3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



- (IBAction)view:(id)sender {
    NSString* emailN;
    NSString * theID;
    NSString* userN;
    NSString* timesdu;
    NSString * myLine=@" ";
    NSString * paths=[self getWritableDBPath];
    
    const char *dbpath =  [paths UTF8String];
    sqlite3_stmt    *statement;
    static sqlite3 *database = nil;
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"SELECT lecture, time, id FROM users",nil];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(database,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            while(sqlite3_step(statement) == SQLITE_ROW)
            {
                userN = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                timesdu = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                emailN = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                theID = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                 myLine= [NSString stringWithFormat:@"%@%@%@%@%@%@%@", myLine,userN, @":", timesdu, @"-", theID, @"   "];
                
                
            }
            
            
            sqlite3_finalize(statement);
        }
        
        sqlite3_close(database);
    }
    listNames.text=myLine;
}



- (IBAction)deleteName:(id)sender {
    [self createEditableCopyOfDatabaseIfNeeded];
    
    NSString *filePath = [self getWritableDBPath];
    
    sqlite3 *database;
    NSString * theID=ider.text;
    
    
    if(sqlite3_open([filePath UTF8String], &database) == SQLITE_OK) {
        
        NSString * sState=@"DELETE FROM users WHERE id='";
        
        
        NSString * s=  [NSString stringWithFormat:@"%@%@%@",sState,theID,@"';"];
        
        const char *sqlStatement = [s cStringUsingEncoding:NSUTF8StringEncoding];
        sqlite3_stmt *compiledStatement;
        sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
        
        
        if(sqlite3_step(compiledStatement) != SQLITE_DONE ) {
            NSLog( @"Save Error: %s", sqlite3_errmsg(database) );
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
}

- (NSString *) getWritableDBPath {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:myDB];
    
}
-(void)createEditableCopyOfDatabaseIfNeeded
{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:myDB];
    
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success)
        return;
    
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath]
                               stringByAppendingPathComponent:myDB];
    success = [fileManager copyItemAtPath:defaultDBPath
                                   toPath:writableDBPath
                                    error:&error];
    if(!success)
    {
        NSAssert1(0,@"Failed to create writable database file with Message : '%@'.",
                  [error localizedDescription]);
    }
}
@end
