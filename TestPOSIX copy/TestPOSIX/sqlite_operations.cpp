//
//  sqlite_operations.cpp
//  TestPOSIX
//
//  Created by Xinru Chen on 5/22/17.
//  Copyright © 2017 Xinru Chen. All rights reserved.
//

#include "sqlite_operations.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <functional>

using namespace std;
sqlite3 *db;
char *zErrMsg = 0;
int rc;
const char *sql;
const char* data = "Callback function called";

int callback(void *data, int argc, char **argv, char **azColName){
    int i;
    fprintf(stderr, "%s: ", (const char*)data);
    for(i=0; i<argc; i++){
        printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
    }
    printf("\n");
    return 0;
}

void deleter (char* times) {
    string sqlhead = "DELETE FROM users;";
    string topcomma = "'";
    string semicolon = ";";
    string sqlinfo = sqlhead + topcomma + times + topcomma + semicolon;
    sql = sqlinfo.c_str();
    printf("%s", sql);
    rc = sqlite3_exec(db, sqlhead.c_str(), callback, 0, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n %d", zErrMsg, rc);
        sqlite3_free(zErrMsg);
    }else{
        fprintf(stdout, "Records deleted successfully\n");
    }
    
    
}

void selectBytime(char* times) {
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


void view () {
    sql = "SELECT * from users";
    
    /* Execute SQL statement */
    rc = sqlite3_exec(db, sql, callback, (void*)data, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }else{
        fprintf(stdout, "Operation done successfully\n");
    }
    //    sqlite3_close(db);
    
}

void updateName(char* timer, char* name) {
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

void updatePosition(char* timer, char* positioner) {
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




void insert(const char* lectures, const char* times, const char* positions) {
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

static long t_rowNum;
long rowNumberInAssignmentsTable() {
    return sqlite3_exec(db, "SELECT id FROM users", [](void *foo, int columnNum, char **columnTexts, char **columnNames){
        t_rowNum++;
        return 0;
    }, NULL, NULL) == SQLITE_OK ? t_rowNum : -1;
}

vector<AssignmentCpp> t_res{};
vector<AssignmentCpp> queryForAllAssignments() {
    t_res.clear();
    sqlite3_exec(db, "SELECT * FROM users", [](void *foo, int columnNum, char **columnTexts, char **columnNames){
        auto vec = vector<string>{columnTexts, columnTexts + columnNum};
        t_res.push_back(AssignmentCpp{stoi(vec[0]), vec[1], vec[2], vec[3]});
        return 0;
    }, NULL, NULL);
    return t_res;
}

