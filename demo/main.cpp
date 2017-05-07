//
//  main.cpp
//  demo
//
//  Created by Xinru Chen on 5/7/17.
//  Copyright © 2017 Xinru Chen. All rights reserved.
//
#include <stdio.h>
#include <stdlib.h>
#include <sqlite3.h>
#include <string>
#include <iostream>

using namespace std;

static int callback(void *data, int argc, char **argv, char **azColName){
    int i;
    fprintf(stderr, "%s: ", (const char*)data);
    for(i=0; i<argc; i++){
        printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
    }
    printf("\n");
    return 0;
}

int main(int argc, char* argv[])
{
    sqlite3 *db;
    char *zErrMsg = 0;
    int rc;
    char *sql;
    const char* data = "Callback function called";
    
    /* Open database */
    rc = sqlite3_open("/home/cshome/x/xichen/Desktop/demo/demo/formalData.db", &db);
    if( rc ){
        fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
        return(0);
    }else{
        fprintf(stderr, "Opened database successfully\n");
    }
    
    
    /* Insert Lecture */
//    sql = "INSERT INTO users (lecture,time,position) "  \
//    "VALUES ('cosc243', '9am', 'ousa'); " \
//    "INSERT INTO users (lecture,time,position) "  \
//    "VALUES ('cosc345', '10am', 'burn'); ";
    
    char lectures[32];
    char times[32];
    char positions[32];
    
    cin.getline(lectures, 32);
    cin.getline(times, 32);
    cin.getline(positions, 32);
    
//    sql = "INSERT INTO users (lecture, time, position) " \
//    "VALUES (lectures, times, positions); " ;
    
//    sql = "INSERT INTO users (lecture, time, position) " \
//    "VALUES ('comp112', '6pm', 'ousa'); ";
//    sql = "INSERT INTO users (lecture, time, position) "  \
//    "VALUES (lectures, times, positions); " ;
    sql = "INSERT INTO users (" + lectures + "," + times + "," + positions + ");";
//     Execute SQL statement 
    rc = sqlite3_exec(db, sql, callback, 0, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }else{
        fprintf(stdout, "Records created successfully\n");
    }
    
    
    
    
    /* View Lecture */
    /* Create SQL statement */
    sql = "SELECT * from users";
    
    /* Execute SQL statement */
    rc = sqlite3_exec(db, sql, callback, (void*)data, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }else{
        fprintf(stdout, "Operation done successfully\n");
    }
    sqlite3_close(db);
    return 0;
}
