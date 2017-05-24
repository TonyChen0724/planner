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
extern void insert(const char* lectures, const char* times, const char* positions);

extern long rowNumberInAssignmentsTable();
class AssignmentCpp {
public:
    int pkid;
    std::string lecture;
    std::string time;
    std::string position;
};
extern std::vector<AssignmentCpp> queryForAllAssignments();

#endif /* sqlite_operations_hpp */
