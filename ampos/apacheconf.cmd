/* **************************************/
/*                                      */
/*              (c) 2005 by             */
/*    Michael Oehlhof, info@ampos2.de   */
/*                                      */
/* **************************************/

progname = "apacheconf.cmd"
version  = "1.1"
date    = "2005-11-16"
modebug  = "0"

/* *********************************************************************************** */
/* REXX Script to configure Apache configuration and startup                           */
/* Change all occurencies of /Apps/apache1 in httpd.conf to the selected installation  */
/* path from the WarpIn installation                                                   */
/* *********************************************************************************** */

/* we want to know the program runtime */
StartTimer = Time(E)

/* load REXXUTIL-library */
CALL RxFuncAdd "SysLoadFuncs", "REXXUTIL", "sysloadfuncs"
CALL SysLoadFuncs

/* clear screen, say my hello */
CALL HelloProgram

/* REXX Script to configure Apache configuration and startup */
parse arg appath
apdrive = LEFT(appath, 2)
apdir = RIGHT(appath, LENGTH(appath)-2)
apdirunix = TRANSLATE(apdir, "/", "\")

filestart = appath"\startup.cmd"
fileconf = appath"\conf\httpd.conf"

stdrive = "C:"
stdir = "\Apps\apache1"
stdirunix = "/Apps/apache1"

crlf='0d0a'x

IF modebug = "1" THEN
DO
	say "Drive " apdrive
	say "Dir   " apdir
	say "Dir-x " apdirunix
	say "Start " filestart
	say "StNew " filestnew
	say "Conf  " fileconf
END

IF Arg(1) = '' THEN CALL HelpParameterMissed

/* Create tmp folder for Apache/2 */
rc = SysMkDir(apdrive||"\tmp")

/* update startup.cmd */
outlines = ""
do while( lines( filestart ) )
  rec = linein( filestart )

  /* substitute drive letter */
  p1 = POS(stdrive, rec)
  rec2 = ""
  rec3 = ""
  do while p1>0
    if p1>1 then rec2 = LEFT(rec, p1-1)
    if LENGTH(rec)>(p1+2) then rec3 = RIGHT(rec, LENGTH(rec)-p1-1)
    rec = rec2||apdrive||rec3
    p1 = POS(stdrive, rec, p1+1)
  end

  /* substitute directory */
  p1 = POS(stdir, rec)
  rec2 = ""
  rec3 = ""
  do while p1>0
    if p1>1 then rec2 = LEFT(rec, p1-1)
    if LENGTH(rec)>(p1+LENGTH(stdir)) then rec3 = RIGHT(rec, LENGTH(rec)-p1-LENGTH(stdir)+1)
    rec = rec2||apdir||rec3
    p1 = POS(stdir, rec, p1+LENGTH(apdir))
  end

  outlines = outlines||rec||crlf
end
rc=Stream(filestart,"C","Close")

/* delete old file and write with new contents */
rc = SysFileDelete(filestart)
call lineout filestart,,1
call lineout filestart, outlines
rc=Stream(filestart,"C","Close")


/* update httpd.conf */
outlines = ""
do while( lines( fileconf ) )
  rec = linein( fileconf )

  /* substitute directory */
  p1 = POS(stdirunix, rec)
  rec2 = ""
  rec3 = ""
  do while p1>0
    if p1>1 then rec2 = LEFT(rec, p1-1)
    if LENGTH(rec)>(p1+LENGTH(stdirunix)) then rec3 = RIGHT(rec, LENGTH(rec)-p1-LENGTH(stdirunix)+1)
    rec = rec2||apdirunix||rec3
    p1 = POS(stdirunix, rec, p1+LENGTH(apdirunix))
  end

  outlines = outlines||rec||crlf
end
rc=Stream(fileconf,"C","Close")

/* delete old file and write with new contents */
rc = SysFileDelete(fileconf)
call lineout fileconf,,1
call lineout fileconf, outlines
rc=Stream(fileconf,"C","Close")

/* we are ready */
EXIT


/* *********************************************************** */
/* general sub-routines                                        */
/* *********************************************************** */

HelloProgram:
        '@echo off'
        CALL SysCls
        SAY
        SAY '+--------------------------------------------------------------+'
        SAY ' 'progname 'V'version '(c) 'date 'by Michael Oehlhof'
        SAY '+--------------------------------------------------------------+'
        SAY
RETURN

HelpProgramVersion:
        SAY 'Name of program:    'progname
        SAY 'This version:       'version
        SAY 'Last change:        'date
        SAY
EXIT

HelpProgram:
        SAY '          * ************************************** *'
        SAY '          *               (c) 2005 by              *'
        SAY '          *     Michael Oehlhof, info@ampos2.de    *'
        SAY '          * ************************************** *'
        SAY
        SAY 'Program to change all occurencies of /Apps/apache1 in httpd.conf to the selected'
        SAY 'installation path from the WarpIn installation'
        SAY
        SAY 'Command line options:'
        SAY '---------------------'
        SAY 'installationpath'
        SAY '-V show Version of this program'
EXIT

