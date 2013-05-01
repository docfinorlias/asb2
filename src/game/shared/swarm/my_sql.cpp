#include "my_sql.h"
#include "cbase.h"

bool cSQL::cInit(void)
{
	if (!mysql_init(&conn)) { return false; } //Error: can't create MySQL-descriptor
	
	// ����������� � ���� MySQL
	// ��� ���������� ������� ������� ����� ������� ������, ����� ���� �������.
	// �� ������ ���������, � ������ ������ ���������� �.�.
	// ������� ������� ����, �������� ���� - �� � ����� �����. ;-)
	
	// host, user, pass, database, port, sckt, cl_fl
	if (!mysql_real_connect (&conn, "host", "user", "password", "database", 0, NULL, 0)) { return false; } //Error: can't connect to MySQL server
	

	// ������������� ��������� ����������, ����� ������������� ��������� �������� ������
	if (mysql_query(&conn, "SET NAMES 'utf8'") != 0) { return false; } //Error: can't set character set

	return true;
}

void cSQL::cDestroy(void)
{
	mysql_close(&conn);
}
