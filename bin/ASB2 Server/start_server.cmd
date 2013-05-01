@echo off 
cls 
echo Protecting srcds from crashes... 
title srcds.com Watchdog 
:srcds 
echo (%time%) srcds started. 
start /wait srcds.exe -console -condebug -game swarm -port 27017 +map lobby -maxplayers 8 +exec server.cfg
echo (%time%) WARNING: srcds closed or crashed, restarting.... 
goto srcds