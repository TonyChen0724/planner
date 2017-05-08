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
sqlite3 *db;
char *zErrMsg = 0;
int rc;
char *sql;
const char* data = "Callback function called";

static int callback(void *data, int argc, char **argv, char **azColName){
    int i;
    fprintf(stderr, "%s: ", (const char*)data);
    for(i=0; i<argc; i++){
        printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
    }
    printf("\n");
    return 0;
}

static void deleter (char* times) {
    string sqlhead = "DELETE FROM users WHERE time = ";
    string topcomma = "'";
    string sqlinfo = sqlhead + topcomma + times + topcomma;
    sql = &sqlinfo[0u];
    rc = sqlite3_exec(db, sql, callback, 0, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }else{
        fprintf(stdout, "Records deleted successfully\n");
    }
    
    
}


static void selectBytime(char* times) {
//    sql = "SELECT * from users";
    string select = "SELECT lecture, time, position";
    string from = " from users";
    string whereif = " WHERE time = '";
    string topcomma = "'";
    string simicolon = ";";
    string sqlinfo = select + from + whereif + times + topcomma + simicolon;
    sql = &sqlinfo[0u];
    rc = sqlite3_exec(db, sql, callback, 0, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }else{
        fprintf(stdout, "Records selected successfully\n");
    }

    
    
}


static void view () {
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
    
}

static void updateName(char* timer, char* name) {
    string updateusers = "UPDATE users SET lecture = '";
    string where = " WHERE time = '";
    string topcomma = "'";
    string comma = ",";
    string bracelet = "); ";
    string simicolon = ";";
    
    string sqlinfo = updateusers + name + topcomma + where + timer + topcomma + simicolon;
    sql = &sqlinfo[0u];
    cout << sql;
    rc = sqlite3_exec(db, sql, callback, 0, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }else{
        fprintf(stdout, "Records updated successfully\n");
    }
    
    
}

static void updatePosition(char* timer, char* positioner) {
    string updateusers = "UPDATE users SET position = '";
    string where = " WHERE time = '";
    string topcomma = "'";
    string comma = ",";
    string bracelet = "); ";
    string simicolon = ";";
    
    string sqlinfo = updateusers + positioner + topcomma + where + timer + topcomma + simicolon;
    sql = &sqlinfo[0u];
    cout << sql;
    rc = sqlite3_exec(db, sql, callback, 0, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }else{
        fprintf(stdout, "Records updated successfully\n");
    }
    
    
}




static void insert(char* lectures, char* times, char* positions) {
    string insertInto = "INSERT INTO users (lecture, time, position) VALUES ('";
    string topcomma = "'";
    string comma = ",";
    string bracelet = "); ";
    
    string sqlinfo = insertInto + lectures + topcomma + comma + topcomma + times + topcomma + comma + topcomma + positions + topcomma + bracelet;
    sql = &sqlinfo[0u];
    rc = sqlite3_exec(db, sql, callback, 0, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }else{
        fprintf(stdout, "Records created successfully\n");
    }

    
}






int main(int argc, char* argv[])
{
    
    
    /* Open database */
    rc = sqlite3_open("/home/cshome/x/xichen/Desktop/demo/demo/formalData.db", &db);
    if( rc ){
        fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
        return(0);
    }else{
        fprintf(stderr, "Opened database successfully\n");
    }
    
    
/*  insert syntax :
    char lectures[32];
    char times[32];
    char positions[32];
    
    cin.getline(lectures, 32);
    cin.getline(times, 32);
    cin.getline(positions, 32);
    insert(lectures, times, positions);
 */
    
    /* delete syntax
    char deletetime[32];
    cin.getline(deletetime, 32);
    deleter(deletetime);
     */

//    updatePosition("8am", "ousa");        update syntax
//    selectBytime("8am");              select syntax
view();       //view syntax
}


