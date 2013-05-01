#include "my_sql.h"
#include "cbase.h"

bool cSQL::cInit(void)
{
	if (!mysql_init(&conn)) { return false; } //Error: can't create MySQL-descriptor
	
	// Подключение к базе MySQL
	// Для наглядного примера оставил самый простой способ, чтобы было понятно.
	// Из своего оригинала, я удалил методы шифрования т.п.
	// поэтому думайте сами, шифруйте сами - всё в ваших руках. ;-)
	
	// host, user, pass, database, port, sckt, cl_fl
	if (!mysql_real_connect (&conn, "host", "user", "password", "database", 0, NULL, 0)) { return false; } //Error: can't connect to MySQL server
	

	// Устанавливаем кодировку соединения, чтобы предотвратить искажения русского текста
	if (mysql_query(&conn, "SET NAMES 'utf8'") != 0) { return false; } //Error: can't set character set

	return true;
}

void cSQL::cDestroy(void)
{
	mysql_close(&conn);
}
