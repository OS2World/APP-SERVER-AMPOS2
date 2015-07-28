/* REXX Script to configure mySQL configuration */
parse arg appath datapath

etcpath = value( 'etc', , 'OS2ENVIRONMENT')
fileconf = etcpath"\my.cnf"

apdir = TRANSLATE(appath, "/", "\")
datadir = TRANSLATE(datapath, "/", "\")

crlf='0d0a'x

/*
say "ETC  " etcpath
say "Conf  " fileconf
*/

CALL RxFuncAdd 'SysFileDelete', 'RexxUtil', 'SysFileDelete'

/* create my.cnf */
outlines = "[client]"||crlf
outlines = outlines||"compress"||crlf
outlines = outlines||"user=root"||crlf
outlines = outlines||"[mysqld]"||crlf
outlines = outlines||"basedir="||apdir||crlf
outlines = outlines||"datadir="||datadir||crlf

rc = SysFileDelete(fileconf) 
call lineout fileconf,,1 
call lineout fileconf, outlines
rc=Stream(fileconf,"C","Close")
