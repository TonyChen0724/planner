/**
 Cosc345 Asn 2, sqlite_operations.cpp
 Purpose: provide a database to interact with the UI.
 
 @author Xinru Chen, Luke Falvey, Molly Patterson
 @version 1.0 5/29/17
 */

#include "sqlite_operations.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <functional>
#include <sstream>

using namespace std;


sqlite3 *db;
char *zErrMsg = 0;
int rc;
const char *sql;
const char *debugsql;
const char* data = "Callback function called";

/*
 printf information we need to check.
 */
int callback(void *data, int argc, char **argv, char **azColName){
    int i;
    fprintf(stderr, "%s: ", (const char*)data);
    for(i=0; i<argc; i++){
        printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
    }
    printf("\n");
    return 0;
}

/*
 delete a record based on the times.
 */
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
/*
 select a record based on the times.
 */
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

/*
 view records from first to last.
 */
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
/*
 update a name of record based on the times.
 */
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

/*
 update a name of record based on the times.
 */
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


/*
 insert a record to the database.
 */
void insertAssignment(const char* lectures, const char* times, const char* positions) {
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

// doubt it's going to work cuz may have error concanating sqlinfo
void insertCalendarInfo(const char* classes, const char* starttimes, const char* days, const char* weekly, const char* fortnightly, const char* location) {
    string insertInto = "INSERT INTO calendar (class, starttime, days, weekly, fortnightly, location) VALUES ('";
    string topcomma = "'";
    string comma = ",";
    string bracelet = "); ";
    
    string sqlinfo = insertInto + classes + topcomma + comma + topcomma + starttimes + topcomma + comma + topcomma + days + topcomma + comma + topcomma + weekly + topcomma + comma + topcomma + fortnightly + topcomma + comma + topcomma + location + topcomma + bracelet;
    sql = &sqlinfo[0u];
    rc = sqlite3_exec(db, sql, callback, 0, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }else{
        fprintf(stdout, "Records created successfully\n");
    }
    
    
}


void insertMeetings(const char* lectures, const char* times, const char* positions) {
    string insertInto = "INSERT INTO newuser (lecture, time, position) VALUES ('";
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


void insertTasks(const char* lectures, const char* times, const char* positions) {
    string insertInto = "INSERT INTO thirduser (lecture, time, position) VALUES ('";
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

/* 
 a new sqlite query for conenct with the swift code. 
 */
AssignmentCpp::AssignmentCpp(int pkid, string lecture, string time, string position): pkid(pkid), lecture(lecture), time(time), position(position) {}

static long t_rowNum;
long rowNumberInAssignmentsTable() {
    return sqlite3_exec(db, "SELECT id FROM users", [](void *foo, int columnNum, char **columnTexts, char **columnNames){
        t_rowNum++;
        return 0;
    }, NULL, NULL) == SQLITE_OK ? t_rowNum : -1;
}

long rowNumberInNewAssignmentsTable() {
    return sqlite3_exec(db, "SELECT id FROM newusers", [](void *foo, int columnNum, char **columnTexts, char **columnNames){
        t_rowNum++;
        return 0;
    }, NULL, NULL) == SQLITE_OK ? t_rowNum : -1;
}


long rowNumberInNewNewAssignmentsTable() {
    return sqlite3_exec(db, "SELECT id FROM thirduser", [](void *foo, int columnNum, char **columnTexts, char **columnNames){
        t_rowNum++;
        return 0;
    }, NULL, NULL) == SQLITE_OK ? t_rowNum : -1;
}
vector<AssignmentCpp> t_assres{};
vector<AssignmentCpp> queryForAllAssignments() {
    t_assres.clear();
    sqlite3_exec(db, "SELECT * FROM users", [](void *foo, int columnNum, char **columnTexts, char **columnNames){
        auto vec = vector<string>{columnTexts, columnTexts + columnNum};
        t_assres.push_back(AssignmentCpp{stoi(vec[0]), vec[1], vec[2], vec[3]});
        return 0;
    }, NULL, NULL);
    return t_assres;
}

//vector<AssignmentCpp> t_assres{};
vector<AssignmentCpp> queryForAllNewAssignments() {
    t_assres.clear();
    sqlite3_exec(db, "SELECT * FROM newuser", [](void *foo, int columnNum, char **columnTexts, char **columnNames){
        auto vec = vector<string>{columnTexts, columnTexts + columnNum};
        t_assres.push_back(AssignmentCpp{stoi(vec[0]), vec[1], vec[2], vec[3]});
        return 0;
    }, NULL, NULL);
    return t_assres;
}

vector<AssignmentCpp> queryForAllNewNewAssignments() {
    t_assres.clear();
    sqlite3_exec(db, "SELECT * FROM thirduser", [](void *foo, int columnNum, char **columnTexts, char **columnNames){
        auto vec = vector<string>{columnTexts, columnTexts + columnNum};
        t_assres.push_back(AssignmentCpp{stoi(vec[0]), vec[1], vec[2], vec[3]});
        return 0;
    }, NULL, NULL);
    return t_assres;
}




/*
 add new assignment to the app.
 */
void insertNewAssignmentCpp(AssignmentCpp asscpp) {
    insertAssignment(asscpp.lecture.c_str(), asscpp.time.c_str(), asscpp.position.c_str());
}

void insertCalendarInfoCpp(AssignmentCpp asscpp) {
    /*insertCalendarInfo(asscpp.classes.c_str(), <#const char *starttimes#>, <#const char *days#>, <#const char *weekly#>, <#const char *fortnightly#>, <#const char *location#>)*/
}

void insertMeetingsCpp(AssignmentCpp asscpp) {
    insertMeetings(asscpp.lecture.c_str(), asscpp.time.c_str(), asscpp.position.c_str());
}

void insertTasksCpp(AssignmentCpp asscpp) {
    insertTasks(asscpp.lecture.c_str(), asscpp.time.c_str(), asscpp.position.c_str());
}


/*
 delete assignment by pkid.
 */
bool deleteAssignmentById(int pkid) {
    ostringstream os;
    os << "DELETE FROM users WHERE id = " << pkid;
    return sqlite3_exec(db, os.str().c_str(), [](void *foo, int columnNum, char **columnTexts, char **columnNames){return 0;}, NULL, NULL) == SQLITE_OK;
}

bool deleteMeetingsById(int pkid) {
    ostringstream os;
    os << "DELETE FROM newuser WHERE id = " << pkid;
    return sqlite3_exec(db, os.str().c_str(), [](void *foo, int columnNum, char **columnTexts, char **columnNames){return 0;}, NULL, NULL) == SQLITE_OK;
}

bool deleteTasksById(int pkid) {
    ostringstream os;
    os << "DELETE FROM thirduser WHERE id = " << pkid;
    return sqlite3_exec(db, os.str().c_str(), [](void *foo, int columnNum, char **columnTexts, char **columnNames){return 0;}, NULL, NULL) == SQLITE_OK;
}









/*
 delete the record by ID
 */
bool deleteCalendarById(int pkid) {
    ostringstream os;
    os << "DELETE FROM calendar WHERE id = " << pkid;
    return sqlite3_exec(db, os.str().c_str(), [](void *foo, int columnNum, char **columnTexts, char **columnNames){return 0;}, NULL, NULL) == SQLITE_OK;
}
