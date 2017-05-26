//
//  sqlite_operations.hpp
//  TestPOSIX
//
//  Created by Xinru Chen on 5/22/17.
//  Copyright © 2017 Xinru Chen. All rights reserved.
//

#ifndef sqlite_operations_hpp
#define sqlite_operations_hpp

#include <sqlite3.h>
#include <vector>
#include <string>

extern sqlite3 *db;
extern char *zErrMsg;
extern int rc;
extern const char *sql;
extern const char* data;

extern int callback(void *data, int argc, char **argv, char **azColName);
extern void deleter(char* times);
extern void selectBytime(char *times);
extern void view();
extern void updateName(char* timer, char* name);
extern void updatePosition(char* timer, char* positioner);
extern void insertAssignment(const char* lectures, const char* times, const char* positions);
extern void insertCalendar(const char *row, const char *col, const char *content, const char *color); // TODO: Mr. Chen, I will leave this to you. You'll implement it in sqlite_operations.cpp file, just like insertAssignment. I'm too lazy to write those boilerplate codes. -- Yutong Zhang

extern long rowNumberInAssignmentsTable();
class AssignmentCpp {
public:
    int pkid;
    std::string lecture;
    std::string time;
    std::string position;
    
    AssignmentCpp(int pkid, std::string lecture, std::string time, std::string position);
};
extern std::vector<AssignmentCpp> queryForAllAssignments();
extern void insertNewAssignmentCpp(AssignmentCpp asscpp);
extern bool deleteAssignmentById(int pkid);
class CalendarCpp {
public:
    int pkid;
    std::string row;
    std::string col;
    std::string content;
    std::string color;
    
    CalendarCpp(int pkid, std::string row, std::string col, std::string content, std::string color);
};
extern std::vector<CalendarCpp> queryForAllCalendarCpp();
extern void insertNewCalendarCpp(CalendarCpp calcpp);
extern bool deleteCalendarById(int pkid);

#endif /* sqlite_operations_hpp */
