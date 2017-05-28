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
#include <sstream>

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



/*void insertCalendar(const char *rows, const char *cols, const char *contents) {
    // TODO: Mr. Chen, I will leave this to you. You'll implement it in sqlite_operations.cpp file, just like insertAssignment. I'm too lazy to write those boilerplate codes. -- Yutong Zhang
    string insertInto = "INSERT INTO calendar (row, col, content) VALUES ('";
    string topcomma = "'";
    string comma = ",";
    string bracelet = ");";
    string sqlinfo = insertInto + rows + topcomma + comma + topcomma + cols + topcomma + comma + topcomma + contents + topcomma + bracelet;
    sql = &sqlinfo[0u];
    rc = sqlite3_exec(db, sql, callback, 0, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
    }else{
        fprintf(stdout, "Records created successfully\n");
    }

}*/

AssignmentCpp::AssignmentCpp(int pkid, string lecture, string time, string position): pkid(pkid), lecture(lecture), time(time), position(position) {}

static long t_rowNum;
long rowNumberInAssignmentsTable() {
    return sqlite3_exec(db, "SELECT id FROM users", [](void *foo, int columnNum, char **columnTexts, char **columnNames){
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

void insertNewAssignmentCpp(AssignmentCpp asscpp) {
    insertAssignment(asscpp.lecture.c_str(), asscpp.time.c_str(), asscpp.position.c_str());
}

bool deleteAssignmentById(int pkid) {
    ostringstream os;
    os << "DELETE FROM users WHERE id = " << pkid;
    return sqlite3_exec(db, os.str().c_str(), [](void *foo, int columnNum, char **columnTexts, char **columnNames){return 0;}, NULL, NULL) == SQLITE_OK;
}

CalendarCpp::CalendarCpp(int pkid, std::string row, std::string col, std::string content, std::string color): pkid(pkid), row(row), col(col), content(content), color(color) {}

vector<CalendarCpp> t_calres{};
std::vector<CalendarCpp> queryForAllCalendarCpp() {
    t_calres.clear();
    sqlite3_exec(db, "SELECT * FROM calendar", [](void *foo, int columnNum, char **columnTexts, char **columnNames){
        auto vec = vector<string>{columnTexts, columnTexts + columnNum};
        t_calres.push_back(CalendarCpp{stoi(vec[0]), vec[1], vec[2], vec[3], vec[4]});
        return 0;
    }, NULL, NULL);
    return t_calres;
}

/*void insertNewCalendarCpp(CalendarCpp calcpp) {
    insertCalendar(calcpp.row.c_str(), calcpp.col.c_str(), calcpp.content.c_str(), calcpp.color.c_str());
}*/

bool deleteCalendarById(int pkid) {
    ostringstream os;
    os << "DELETE FROM calendar WHERE id = " << pkid;
    return sqlite3_exec(db, os.str().c_str(), [](void *foo, int columnNum, char **columnTexts, char **columnNames){return 0;}, NULL, NULL) == SQLITE_OK;
}
