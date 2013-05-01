#ifndef MY_SQL_H
#define MY_SQL_H
#ifdef _WIN32
#pragma once
#endif

#include <my_global.h>
#include <mysql.h>

class cSQL
{
public:
	MYSQL conn;
	MYSQL_RES *res;
	MYSQL_ROW row;

	int asd;
	bool cInit(void);
	void cDestroy(void);
	//bool cSQL::cQuery(MYSQL* arg, const char *pFormat, const char *format, ...);
	//void cPrint(void);
};

#endif
