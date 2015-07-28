/* Rexx script to shut down Apache */

pid = linein("logs\httpd.pid")
'kill.exe -TERM 'pid
