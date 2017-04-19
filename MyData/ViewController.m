//
//  ViewController.m
//  MyData
//
//  Created by Matt Memmo on 3/29/14.
//  Copyright (c) 2014 RWS. All rights reserved.
//

#import "ViewController.h"
#import "global.h"

@interface ViewController ()

@end

NSString * myDB = @"sstep.db";
global *globalVar;

 //table name is users
//fields are id, username, email

@implementation ViewController
@synthesize user;
@synthesize email;
@synthesize listNames;
@synthesize ider;
@synthesize globVar;

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
	// Do any additional setup after loading the view, typically from a nib.
    
    global * myVar = [global sharedSingleton];
    listNames.text = myVar.var1s;//show the start value of singleton 1
    myVar.var1s=@"Change Var";//singleton 1 - we change the value for demonstration purposes.
    myDB= myVar.var2s;//singleton 2 holds the databasae name
    var3=@"Screen 1";//global var
    globVar.text=var3;//global var 1
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)view:(id)sender {//========================VIEW=========================
    
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
        
        //  NSLog(@"Databasae opened = %@", userN);
        
        if (sqlite3_prepare_v2(database,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
           int rows = sqlite3_column_int(statement, 0);
            
            while(sqlite3_step(statement) == SQLITE_ROW)
            {
                userN = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                timesdu = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                
                theID = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)]; //* will change to:
                
                /* thePosition = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                 isMeeting = "true";
                 theID = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                 */
                 
               myLine= [NSString stringWithFormat:@"%@%@%@%@%@%@%@", myLine,userN, @":", timesdu, @"-", theID, @"   "]; // * will change to:
                /*
                 myLine= [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@", myLine,userN, @":", timesdu, @" position:", thePosition, @"-", theID, @"   "]; */

                
            }
            //  username.text=@"No Username";
            
            
            sqlite3_finalize(statement);
        }
      //  NSLog( @"Save Error: %s", sqlite3_errmsg(database) );
        
        sqlite3_close(database);
    }
  //  NSLog(@"user = %@", userN);
    
    listNames.text=myLine;
}

- (IBAction)deleteName:(id)sender {//==============================DELETE=======================
    
    // Copy the database if needed
    [self createEditableCopyOfDatabaseIfNeeded];
    
    NSString *filePath = [self getWritableDBPath];
    
    sqlite3 *database;
    NSString * theID=ider.text;
  
    
    if(sqlite3_open([filePath UTF8String], &database) == SQLITE_OK) {
        
        NSString * sState=@"DELETE FROM users WHERE id='";
        
        
      NSString * s=  [NSString stringWithFormat:@"%@%@%@",sState,theID,@"';"];
        
        const char *sqlStatement = [s cStringUsingEncoding:NSUTF8StringEncoding];//"DELETE FROM users WHERE id='3';";
        sqlite3_stmt *compiledStatement;
        sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL);
           
           
    if(sqlite3_step(compiledStatement) != SQLITE_DONE ) {
            NSLog( @"Save Error: %s", sqlite3_errmsg(database) );
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
    
}


- (IBAction)addName:(id)sender {
    [self saveUserInDatabase];
}

- (IBAction)update:(id)sender {//=======================UPDATE=================================
    
    // Copy the database if needed
    [self createEditableCopyOfDatabaseIfNeeded];
    
    NSString *filePath = [self getWritableDBPath];
    
    sqlite3 *database;
    NSString * theU=user.text;
    NSString * theE=email.text;
     NSString * theID=ider.text;
    
    if(sqlite3_open([filePath UTF8String], &database) == SQLITE_OK) {
         NSString * sState=@"UPDATE users SET lecture='";
        NSString * sState2=@"', time='";
        NSString * sState3=@"' WHERE id='";
        NSString * sState4=@"';";
        NSString * s=  [NSString stringWithFormat:@"%@%@%@%@%@%@%@",sState,theU,sState2,theE,sState3,theID,sState4];
        
        const char *sqlStatement =[s cStringUsingEncoding:NSUTF8StringEncoding];
        //"UPDATE users SET username='?', email='?' WHERE id='3';";
        sqlite3_stmt *compiledStatement;
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK)    {
           // sqlite3_bind_text( compiledStatement, 1,[theU UTF8String], -1, SQLITE_TRANSIENT);
           // sqlite3_bind_text( compiledStatement, 2,[theE UTF8String], -1, SQLITE_TRANSIENT);
            //sqlite3_bind_text( compiledStatement, 3,[theID UTF8String], -1, SQLITE_TRANSIENT);

            
        }
        if(sqlite3_step(compiledStatement) != SQLITE_DONE ) {
            NSLog( @"Save Error: %s", sqlite3_errmsg(database) );
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
   // UPDATE users SET username='?', email='?' WHERE id='1';
}



-(void)saveUserInDatabase { //========================SAVE==============================
    
    // Copy the database if needed
    [self createEditableCopyOfDatabaseIfNeeded];
    
    NSString *filePath = [self getWritableDBPath];
    
    sqlite3 *database;
    NSString * theU=user.text;
    NSString * theE=email.text;
    
    if(sqlite3_open([filePath UTF8String], &database) == SQLITE_OK) {
        
        //NSString *temp = [NSString stringWithFormat:@"insert into allusers (user_id,user_name) VALUES (%@,%@)",user_id,user_name];
        const char *sqlStatement = "insert into users (lecture,time) VALUES (?,?)";
        sqlite3_stmt *compiledStatement;
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK)    {
            sqlite3_bind_text( compiledStatement, 1,[theU UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text( compiledStatement, 2,[theE UTF8String], -1, SQLITE_TRANSIENT);
            
            
        }
        if(sqlite3_step(compiledStatement) != SQLITE_DONE ) {
            NSLog( @"Save Error: %s", sqlite3_errmsg(database) );
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
}

//========================================WRITABLE DATABSE PATH=======================
- (NSString *) getWritableDBPath {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:myDB];
    
}

//================================================Copies database to appropriate location============

-(void)createEditableCopyOfDatabaseIfNeeded 
{
    // Testing for existence
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
    
    // The writable database does not exist, so copy the default to
    // the appropriate location.
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
