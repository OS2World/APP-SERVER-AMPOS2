/* REXX Script to configure Apache configuration and startup */
parse arg appath datapath
apdrive = LEFT(appath, 2)
apdir = RIGHT(appath, LENGTH(appath)-2)
apdirunix = TRANSLATE(apdir, "/", "\")
dadrive = LEFT(datapath, 2)
dadir = RIGHT(datapath, LENGTH(datapath)-2)
dadirunix = TRANSLATE(dadir, "/", "\")

stdrive = "C:"
stadir = "\Apps\apache2"
stadirunix = "/Apps/apache2"
stdir = "\Data\htdocs"
stdirunix = "/Data/htdocs"


filestart = appath"\startup.cmd"
fileconf = appath"\conf\httpd.conf"

crlf='0d0a'x

/*
say "Drive " apdrive
say "Dir   " apdir
say "Dir-x " apdirunix
say "Drive " dadrive
say "Dir   " dadir
say "Dir-x " dadirunix
say "Conf  " fileconf
*/

CALL RxFuncAdd 'SysFileDelete', 'RexxUtil', 'SysFileDelete'
CALL RxFuncAdd 'SysMkDir', 'RexxUtil', 'SysMkDir'

/* Create tmp folder for Apache */
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
  p1 = POS(stadir, rec)
  rec2 = ""
  rec3 = ""
  do while p1>0 
    if p1>1 then rec2 = LEFT(rec, p1-1)
    if LENGTH(rec)>(p1+LENGTH(stadir)) then rec3 = RIGHT(rec, LENGTH(rec)-p1-LENGTH(stadir)+1)
    rec = rec2||apdir||rec3
    p1 = POS(stadir, rec, p1+LENGTH(apdir))
  end

  outlines = outlines||rec||crlf
end
rc=Stream(filestart,"C","Close")

rc = SysFileDelete(filestart) 
call lineout filestart,,1 
call lineout filestart, outlines
rc=Stream(filestart,"C","Close")


/* update httpd.conf */

outlines = ""
do while( lines( fileconf ) )
  rec = linein( fileconf )

  /* substitute apps directory */
  p1 = POS(stadirunix, rec)
  rec2 = ""
  rec3 = ""
  do while p1>0 
    if p1>1 then rec2 = LEFT(rec, p1-1)
    rec3 = RIGHT(rec, LENGTH(rec)-p1-LENGTH(stadirunix)+1)
    rec = rec2||apdirunix||rec3
    p1 = POS(stadirunix, rec, p1+LENGTH(apdirunix))
  end

  /* substitute data directory */
  p1 = POS(stdirunix, rec)
  rec2 = ""
  rec3 = ""
  do while p1>0 
    if p1>1 then rec2 = LEFT(rec, p1-1)
    rec3 = RIGHT(rec, LENGTH(rec)-p1-LENGTH(stdirunix)+1)
    rec = rec2||dadirunix||rec3
    p1 = POS(stdirunix, rec, p1+LENGTH(dadirunix))
  end

  outlines = outlines||rec||crlf
end
rc=Stream(fileconf,"C","Close")

rc = SysFileDelete(fileconf) 
call lineout fileconf,,1 
call lineout fileconf, outlines
rc=Stream(fileconf,"C","Close")
