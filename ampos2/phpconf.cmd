/* REXX Script to configure PHP4 configuration */
parse arg appath

etcpath = value( 'etc', , 'OS2ENVIRONMENT')
filedef = appath"\php.ini-ampos"
fileconf = etcpath"\php.ini"

stpath = "C:\Apps\php4"

crlf='0d0a'x

/*
say "ETC  " etcpath
say "Def   " filedef
say "Conf  " fileconf
*/

CALL RxFuncAdd 'SysFileDelete', 'RexxUtil', 'SysFileDelete'

/* update php.ini */
outlines = ""
do while( lines( filedef ) )
  rec = linein( filedef )

  /* substitute path */
  p1 = POS(stpath, rec)
  rec2 = ""
  rec3 = ""
  do while p1>0 
    if p1>1 then rec2 = LEFT(rec, p1-1)
    if LENGTH(rec)>(p1+LENGTH(stpath)) then rec3 = RIGHT(rec, LENGTH(rec)-p1-LENGTH(stpath)+1)
    rec = rec2||appath||rec3
    p1 = POS(stpath, rec, p1+LENGTH(appath))
  end

  outlines = outlines||rec||crlf
end
rc=Stream(filedef,"C","Close")

rc = SysFileDelete(fileconf) 
call lineout fileconf,,1 
call lineout fileconf, outlines
rc=Stream(fileconf,"C","Close")
