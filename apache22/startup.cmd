@echo off
rem adjust as necessary
SET LIBPATHSTRICT=T
set beginlibpath=C:\Apps\apache2\bin;C:\Apps\apache2\modules;
C:
cd \Apps\apache2
bin\httpd -d . 2>&1
