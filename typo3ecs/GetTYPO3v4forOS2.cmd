/* ******************************************************* */
/*                  (c) 2005-2006 by                       */
/*    Roland Schmalenberg, roland.schmalenberg@lycos.de    */
/*                                                         */
/*  My Swiss-knife-tools for running TYPO3 on eComStation  */
/* ******************************************************* */

progname = "GetTYPO3v4forOS2.cmd"
version  = "2.04"
date    = "2006-11-12"
rsdebug  = "0"

/* *********************************************************************************** */
/* Program to change all occurencies of TYPO3_OS-definitions in TYPO3-starter-packages */
/*                                         ***                                         */
/* For running this tool on operating systems like Windows NT and better you need the  */
/*  freeware Regina Rexx Interpreter together with Rexx Utility from www.interlog.com  */
/*                 My installation-package ReginaREXX_WinPack_1xxx.exe                 */
/*               contains a Pack-And-Go-version for those windows systems              */
/*                                         ***                                         */
/*     Only professional OS like OS/2 or eComStation contain all the stuff you need    */
/* *********************************************************************************** */

/* we want to know the program runtime */
StartTimer = Time(E)

/* load REXXUTIL-library */
CALL RxFuncAdd "SysLoadFuncs", "REXXUTIL", "sysloadfuncs"
CALL SysLoadFuncs

/* clear screen, say my hello */
CALL HelloProgram

/* fixed values of some tools we need */
tool_file_01 = 'wget.exe'                       /* thanks to Paul Smedley, who maintained the OS/2-build */
tool_zip_01  = 'wget-1.10.1-os2r2.zip'          /* thanks to Paul Smedley, who maintained the OS/2-build */
tool_file_02 = 'libc06r1.dll'                   /* thanks to Innotek */
tool_zip_02  = 'libc06r1.zip'                   /* thanks to Innotek */
tool_file_03 = 'iintl6i.dll'                    /* thanks to Paul Smedley */
tool_zip_03  = 'iintl6i.zip'                    /* thanks to Paul Smedley */
tool_file_04 = 'md5suml.exe'

/* fixed values of some urls for TYPO3-packages from different continents we need */
t3download_01 = 'http://cogent.dl.sourceforge.net/sourceforge/typo3/'      /* Reston, Virginia, North America */
t3download_02 = 'http://ufpr.dl.sourceforge.net/sourceforge/typo3/'        /* Curitiba, Brazil, South America */
t3download_03 = 'http://jaist.dl.sourceforge.net/sourceforge/typo3/'       /* Ishikawa, Japan, Asia */
t3download_04 = 'http://optusnet.dl.sourceforge.net/sourceforge/typo3/'    /* Sydney, Australia, Australia */
t3download_05 = 'http://ovh.dl.sourceforge.net/sourceforge/typo3/'         /* Paris, France; Europe */

/* fixed definitions */
crlfString     = '0D'x||'0A'x
t3quickstart   = 'quickstart-3.8.0'
t3dummy        = 'dummy-3.8.0'
t3testsite     = 'testsite-3.8.0'
t3quickstart1  = 'quickstart-3.8.1'
t3dummy1       = 'dummy-3.8.1'
t3testsite1    = 'testsite-3.8.1'
t3v4source     = 'typo3_src-4.0.2'
t3v4dummy      = 'dummy-4.0.2'
FileListT3v3x  = 'GetTYPO3v3forOS2List.txt'
FileListT3v4x  = 'GetTYPO3v4forOS2List.txt'
t3version3x    = '3'
t3version4x    = '4'


/* some variables */
LogFile        = 'GetTYPO3v4forOS2-'||Date(S)||'-'||Time(H)||Time(M)//60||'.log'
t3package      = t3quickstart                   /* preset, to be changed while running */
t3download     = t3download_05                  /* preset, to be changed while running */
FileList       = FileListT3v3x                  /* preset, to be changed while running */
t3version      = t3version3x                    /* preset, to be changed while running */

/* TYPO3 related values: TYPO3_OS */
strTYPO3_OS_00  = "define('TYPO3_OS', stristr(PHP_OS,'win')&&!stristr(PHP_OS,'darwin')?'WIN':'');"
strTYPO3_OS_01  = "define('TYPO3_OS', (stristr(PHP_OS,'win') && !stristr(PHP_OS,'darwin')) ? 'WIN' : '');"
strTYPO3_OS_02  = "define('TYPO3_OS', (stristr(PHP_OS,'win')&&!stristr(PHP_OS,'darwin'))||stristr(PHP_OS,'os/2')?'WIN':''); // changed by Team TYPO3-goes-eComStation"

/* TYPO3 related values: to switch TYPO3 to Install_Mode - remark the die-function in typo3\install\index.php */
strTYPO3Inst_00 = 'die("In the source distribution of TYPO3, the install script is disabled by a die() function call.<br/><b>Fix:</b> Open the file typo3/install/index.php and remove/out-comment the line that outputs this message!");'
strTYPO3Inst_01 = '// die("In the source distribution of TYPO3, the install script is disabled by a die() function call.<br/><b>Fix:</b> Open the file typo3/install/index.php and remove/out-comment the line that outputs this message!");'

/* *********************************************************** */
/* Interpret command line inputs                               */
/* *********************************************************** */
IF Arg(1) = '' THEN CALL HelpParameterMissed

IF Arg() > 0 THEN
        DO
        CommandLine = Arg(1)
                DO i = 1 TO Words(CommandLine)
                /* IF SubStr(Word(CommandLine, i),1,6) = '-pack:'  THEN t3package = SubStr(Word(CommandLine, i),7) */
                IF SubStr(Word(CommandLine, i),1,5) = '-dl:1'   THEN t3download = t3download_01
                IF SubStr(Word(CommandLine, i),1,5) = '-dl:2'   THEN t3download = t3download_02
                IF SubStr(Word(CommandLine, i),1,5) = '-dl:3'   THEN t3download = t3download_03
                IF SubStr(Word(CommandLine, i),1,5) = '-dl:4'   THEN t3download = t3download_04
                IF SubStr(Word(CommandLine, i),1,5) = '-dl:5'   THEN t3download = t3download_05
                IF SubStr(Word(CommandLine, i),1,5) = '-t3:1'   THEN t3package = t3quickstart
                IF SubStr(Word(CommandLine, i),1,5) = '-t3:2'   THEN t3package = t3dummy
                IF SubStr(Word(CommandLine, i),1,5) = '-t3:3'   THEN t3package = t3testsite
                IF SubStr(Word(CommandLine, i),1,5) = '-t3:4'   THEN t3package = t3quickstart1
                IF SubStr(Word(CommandLine, i),1,5) = '-t3:5'   THEN t3package = t3dummy1
                IF SubStr(Word(CommandLine, i),1,5) = '-t3:6'   THEN t3package = t3testsite1
                IF SubStr(Word(CommandLine, i),1,5) = '-t4:0'   THEN DO
                                                                        t3package = t3v4source
                                                                        t3package1 = t3v4dummy
                                                                        FileList = FileListT3v4x
                                                                        t3version = t3version4x
                                                                     END
                IF SubStr(Word(CommandLine, i),1,2) = '-h'      THEN CALL HelpProgram
                IF SubStr(Word(CommandLine, i),1,2) = '-?'      THEN CALL HelpProgram
                IF SubStr(Word(CommandLine, i),1,2) = '/?'      THEN CALL HelpProgram
                IF SubStr(Word(CommandLine, i),1,2) = '-H'      THEN CALL ShowHistory
                IF SubStr(Word(CommandLine, i),1,2) = '-T'      THEN CALL ShowToDo
                IF SubStr(Word(CommandLine, i),1,2) = '-V'      THEN CALL HelpProgramVersion
                IF SubStr(Word(CommandLine, i),1,5) = '-exec'   THEN Execute = '1'
                END
        CALL Lineout Logfile, '+--------------------------------------------------------------+'
        CALL Lineout Logfile, progname 'V'version '(c) 'date 'by Roland Schmalenberg'
        CALL Lineout Logfile, '+--------------------------------------------------------------+'
        CALL Lineout Logfile, 'Used command line options are: '||CommandLine
        SAY 'Used command line options are: '||CommandLine
        END

/* comand line input related values must be refreshed */
IF t3version = '4' THEN t3download1 = t3download
IF t3version = '4' THEN t3download1 = t3download1||t3package1||'.zip'
t3download  = t3download||t3package||'.zip'
t3folder    = t3package
IF t3version = '4' THEN t3folder1 = t3package1

IF rsdebug = "1" THEN SAY 't3download set to: '||t3download
IF rsdebug = "1" THEN SAY 'Press any key to continue ...'
IF rsdebug = "1" THEN Taste = SysGetKey(NoEcho)

/* fixed parameters */
crlfString     = '0D'x||'0A'x

/* *********************************************************** */
/* Main-Routine                                                */
/* *********************************************************** */

MyMainSubRoutine:

/* Check FileList */
IF STREAM(FileList, 'c', 'query exists') = '' THEN
   DO
      SAY 'Sorry, cannot find a file-list named: '||FileList
      SAY 'Please check your command line parameters or read the manual!'
      SAY
      SAY 'Press any key to leave this script ...'
      Taste = SysGetKey(NoEcho)
      EXIT
   END

/* the real work starts here */
CALL Lineout Logfile, Date(E)||'-'||Time()||' ... Start batch ...'

/* Check typo3 folder, we will not overwrite a existing folder */
IF t3version = '3' THEN rc = SysFileTree(t3package||'\*.*', s., 'B')
IF t3version = '4' THEN rc = SysFileTree(t3package1||'\*.*', s., 'B')
IF rsdebug = "1" THEN SAY s.0
IF rsdebug = "1" THEN IF s.0 \= 0 THEN SAY 't3folder: '||t3folder||' already exists!'
IF rsdebug = "1" THEN IF s.0 = 0 THEN SAY 't3folder: '||t3folder||' does not exist!'
IF rsdebug = "1" THEN SAY 'Press any key to continue ...'
IF rsdebug = "1" THEN Taste = SysGetKey(NoEcho)
IF t3version = '3' THEN IF s.0 \= 0 THEN CALL LineOut Logfile, Date(E)||'-'||Time()||' ... TYPO3-package-folder exist: '||t3folder||' -> continue with filecheck'
IF t3version = '3' THEN IF s.0 = 0 THEN CALL LineOut Logfile, Date(E)||'-'||Time()||' ... TYPO3-package-folder does not exist: '||t3folder||' -> continue with archive-check'
IF t3version = '4' THEN IF s.0 \= 0 THEN CALL LineOut Logfile, Date(E)||'-'||Time()||' ... TYPO3-package-folder exist: '||t3folder1||' -> continue with filecheck'
IF t3version = '4' THEN IF s.0 = 0 THEN CALL LineOut Logfile, Date(E)||'-'||Time()||' ... TYPO3-package-folder does not exist: '||t3folder1||' -> continue with archive-check'
IF s.0 = 0 THEN
   DO
   SAY 'Okay, folder does not exist, we check existing zip-file now!'
   ZipFile = t3package||'.zip'
   IF t3version = '4' THEN ZipFile1 = t3package1||'.zip'
   /* CALL Lineout Logfile, '.?. Does TYPO3-package-archiv exist: '||ZipFile */
   IF STREAM(ZipFile, 'c', 'query exists') = '' THEN
      DO
         CALL Lineout Logfile, ' ->TYPO3-package-archiv does not exist: '||ZipFile||' -> continue with download now'
         SAY 'Okay, we cannot find the zip-file named: '||ZipFile
         SAY 'We will now try to get it automatically, please wait ...'
         /* check existing wget-file and unzip if necessary */
         IF STREAM(tool_file_01, 'c', 'query exists') = '' THEN
            DO
               IF STREAM(tool_zip_01, 'c', 'query exists') = '' THEN
                  DO
                     CALL Lineout Logfile, '.!. Fatal error, missing tool: '||tool_zip_01
                     SAY 'Cannot find the archive: '||tool_zip_01
                     SAY 'This is a fatal error, please check your system!'
                     SAY
                     SAY 'Press any key to leave this script ...'
                     Taste = SysGetKey(NoEcho)
                     EXIT
                  END
               ELSE
                  DO
                     SAY 'Unzipping the wget files ...'
                     SAY
                     UnzipStr = 'unzip -o '||tool_zip_01||' wget.exe' /* we only need this file */
                     ADDRESS CMD UnzipStr
                     SAY 'Ready ...'
                     SAY
                  END
            END
         /* check existing libc06r1.dll and unzip if necessary */
         IF STREAM(tool_file_02, 'c', 'query exists') = '' THEN
            DO
               IF STREAM(tool_zip_02, 'c', 'query exists') = '' THEN
                  DO
                     CALL Lineout Logfile, '.!. Fatal error, missing tool: '||tool_zip_02
                     SAY 'Cannot find the archive: '||tool_zip_02
                     SAY 'This is a fatal error, please check your system!'
                     SAY
                     SAY 'Press any key to leave this script ...'
                     Taste = SysGetKey(NoEcho)
                     EXIT
                  END
               ELSE
                  DO
                     SAY 'Unzipping the libc06r1.dll ...'
                     SAY
                     UnzipStr = 'unzip -o '||tool_zip_02
                     ADDRESS CMD UnzipStr
                     SAY 'Ready ...'
                     SAY
                  END
            END
         /* check existing iintl6i.dll and unzip if necessary */
         IF STREAM(tool_file_03, 'c', 'query exists') = '' THEN
            DO
               IF STREAM(tool_zip_03, 'c', 'query exists') = '' THEN
                  DO
                     CALL Lineout Logfile, '.!. Fatal error, missing tool: '||tool_zip_03
                     SAY 'Cannot find the archive: '||tool_zip_03
                     SAY 'This is a fatal error, please check your system!'
                     SAY
                     SAY 'Press any key to leave this script ...'
                     Taste = SysGetKey(NoEcho)
                     EXIT
                  END
               ELSE
                  DO
                     SAY 'Unzipping iintl6i.dll ...'
                     SAY
                     UnzipStr = 'unzip -o '||tool_zip_03
                     ADDRESS CMD UnzipStr
                     SAY 'Ready ...'
                     SAY
                  END
            END
         /* wget the desired typo3-package(s) */
         CALL Lineout Logfile, Date(E)||'-'||Time()||' ... Download starts from: '||t3download
         WgetStr = 'wget '||t3download
         ADDRESS CMD WgetStr
         CALL Lineout Logfile, Date(E)||'-'||Time()||' ... Download done!'

         IF t3version = '4' THEN
                DO
                CALL Lineout Logfile, Date(E)||'-'||Time()||' ... Download starts from: '||t3download1
                WgetStr = 'wget '||t3download1
                ADDRESS CMD WgetStr
                CALL Lineout Logfile, Date(E)||'-'||Time()||' ... Download done!'
                END
      END

      /* Unzip the archive */
      SAY 'Please wait, unzipping the archive takes time ...'
      SAY
      CALL Lineout Logfile, Date(E)||'-'||Time()||' ... Start unzipping the TYPO3-package-archive: '||ZipFile
      UnzipStr = 'unzip -o '||ZipFile
      ADDRESS CMD UnzipStr
      CALL Lineout Logfile, Date(E)||'-'||Time()||' ... Unzipping finished!'
      SAY 'Ready ...'
      SAY
      /* Check for version, renaming and unzipping second package */
      IF t3version = '4' THEN
              DO
              CALL Lineout Logfile, Date(E)||'-'||Time()||' ... Renaming TYPO3-folder from '||t3folder||' to '||t3folder1
              RenameStr = 'ren '||t3folder||' '||t3folder1
              ADDRESS CMD RenameStr
              CALL Lineout Logfile, Date(E)||'-'||Time()||' ... Renaming done!'

              SAY 'Unzipping the 2nd archive ...'
              SAY
              CALL Lineout Logfile, Date(E)||'-'||Time()||' ... Start unzipping the TYPO3-package-archive: '||ZipFile1
              UnzipStr = 'unzip -o '||ZipFile1
              ADDRESS CMD UnzipStr
              CALL Lineout Logfile, Date(E)||'-'||Time()||' ... Unzipping finished!'
              SAY 'Ready ...'
              SAY
              END
   END

/* now we have a typo3-folder with the original stuff to be changed for use under eComStation */
IF t3version = '4' THEN t3folder = t3folder1
FoundCount = 0
NotFoundCount = 0
ChangedCount = 0

/* loop files */
DO WHILE Lines(FileList)
   TYPO3FileLine = Linein(FileList)
   IF Left(TYPO3FileLine, 1) = '#' THEN ITERATE
   IF Strip(TYPO3FileLine) \= '' THEN
      DO
         SAY WORD(TYPO3FileLine, 1)
         CALL CharOut Logfile, Date(E)||'-'||Time()||' ... processing file: '||WORD(TYPO3FileLine, 1)
         SourceFile = t3folder||'\'||WORD(TYPO3FileLine, 1)
         TargetFile = t3folder||'\'||WORD(TYPO3FileLine, 1)||'.new'
         /* check if the file to be changed exist, if not remember */
         IF STREAM(SourceFile, 'c', 'query exists') = '' THEN
            DO
               NotFoundCount = NotFoundCount + 1
               SAY 'Sorry, cannot find a file named: '||SourceFile
               CALL Lineout Logfile, ' -> file does not exist!'
               SAY 'Please check your command line parameters or read the manual!'
               SAY
               SAY 'Press any key to continue this script ...'
               Taste = SysGetKey(NoEcho)
            END
         ELSE
            DO
               FoundCount = FoundCount + 1
               CALL CharOut Logfile, ' -> exist'
            END
         /* Check Target, delete if exist */
         IF STREAM(TargetFile, 'c', 'query exists') \= '' THEN
            DO
               IF SysFileDelete(TargetFile) \= 0 THEN
                  DO
                     SAY 'Cannot delete the existing file: '||TargetFile
                     SAY 'Maybe it is write protected?'
                     SAY
                     SAY 'Press any key to leave this script ...'
                     Taste = SysGetKey(NoEcho)
                     EXIT
                  END
            END
         /* loop lines, read line of the original */
         LineCount = 0
         StringFoundInFile = 0
         DO WHILE Lines(SourceFile)
            SourceLine = Linein(SourceFile)
            LineCount = LineCount + 1
            IF Strip(SourceLine) \= '' THEN
               DO
                  /* check line for TYPO3_OS_00, change if necessary */
                  IF POS(TRANSLATE(strTYPO3_OS_00), TRANSLATE(SourceLine)) > '0' THEN
                     DO
                        ChangePos = POS(TRANSLATE(strTYPO3_OS_00), TRANSLATE(SourceLine))
                           IF rsdebug = "1" THEN SAY 'String TYPO3_OS variant 1 found in line '||LineCount||': '||SourceLine
                        CALL Lineout Logfile, ' -> found searchstring#1 in line '||LineCount
                        CALL Lineout LogFile, 'changing: >>'||SourceLine||'<<'
                        SourceLine = DELSTR(SourceLine, ChangePos, LENGTH(strTYPO3_OS_00))
                           IF rsdebug = "1" THEN SAY 'Shortened Line is now: '||SourceLine
                        SourceLine = INSERT(strTYPO3_OS_02, SourceLine, ChangePos-1, LENGTH(strTYPO3_OS_02))
                           IF rsdebug = "1" THEN SAY 'String TYPO3_OS added, line now contains: '||SourceLine
                        CALL Lineout Logfile, 'to        >>'||SourceLine||'<<'
                        ChangedCount = ChangedCount + 1
                        StringFoundInFile = 1
                     END
                  ELSE
                     DO
                     END
                  /* check line for TYPO3_OS, change if necessary */
                  IF POS(TRANSLATE(strTYPO3_OS_01), TRANSLATE(SourceLine)) > '0' THEN
                     DO
                        ChangePos = POS(TRANSLATE(strTYPO3_OS_01), TRANSLATE(SourceLine))
                           IF rsdebug = "1" THEN SAY 'String TYPO3_OS found in line '||LineCount||': '||SourceLine
                        CALL Lineout Logfile, ' -> found searchstring#2 in line '||LineCount
                        CALL Lineout LogFile, 'changing: >>'||SourceLine||'<<'
                        SourceLine = DELSTR(SourceLine, ChangePos, LENGTH(strTYPO3_OS_01))
                           IF rsdebug = "1" THEN SAY 'Shortened Line is now: '||SourceLine
                        SourceLine = INSERT(strTYPO3_OS_02, SourceLine, ChangePos-1, LENGTH(strTYPO3_OS_02))
                           IF rsdebug = "1" THEN SAY 'String TYPO3_OS added, line now contains: '||SourceLine
                        CALL Lineout Logfile, 'to        >>'||SourceLine||'<<'
                        ChangedCount = ChangedCount + 1
                        StringFoundInFile = 1
                     END
                  ELSE
                     DO
                     END
                  /* check line for INSTALL mode, change if necessary */
                  IF POS(TRANSLATE(strTYPO3Inst_00), TRANSLATE(SourceLine)) > '0' THEN
                     DO
                        ChangePos = POS(TRANSLATE(strTYPO3Inst_00), TRANSLATE(SourceLine))
                           IF rsdebug = "1" THEN SAY 'String die() found in line '||LineCount||': '||SourceLine
                        CALL Lineout Logfile, ' -> found searchstring in line '||LineCount
                        CALL Lineout LogFile, 'changing: >>'||SourceLine||'<<'
                        SourceLine = DELSTR(SourceLine, ChangePos, LENGTH(strTYPO3Inst_00))
                           IF rsdebug = "1" THEN SAY 'Shortened Line is now: '||SourceLine
                        SourceLine = INSERT(strTYPO3Inst_01, SourceLine, ChangePos-1, LENGTH(strTYPO3Inst_01))
                           IF rsdebug = "1" THEN SAY 'String die() added, line now contains: '||SourceLine
                        CALL Lineout Logfile, 'to        >>'||SourceLine||'<<'
                        ChangedCount = ChangedCount + 1
                        StringFoundInFile = 1
                     END
                  ELSE
                     DO
                     END
                  /* write line to new original */
                  CALL Lineout TargetFile, SourceLine
               END
         /* end loop lines */
         END
         IF StringFoundInFile = 0 THEN CALL Lineout Logfile, ' -> searchstring not found'
         CALL Lineout Logfile, '...'
      CALL Lineout TargetFile
      CALL Lineout SourceFile
      /* copy new original to original */
      ADDRESS CMD 'copy '||TargetFile||' '||SourceFile||' /v 2>&1 >NUL'
      /* del new original */
      ADDRESS CMD 'del '||TargetFile
      END
/* end loop lines */
END

CALL Lineout Logfile, Date(E)||'-'||Time()||' ... End batch ...'

IF rsdebug = "1" THEN SAY 'RolandSchmalenberg: Changes 1.07 done until this line ...'
IF rsdebug = "1" THEN SAY 'Press any key to continue ...'
IF rsdebug = "1" THEN Taste = SysGetKey(NoEcho)

/* jobs done, say goodbye */
CALL ShowResults
EXIT

/* *********************************************************** */
/* general sub-routines                                        */
/* *********************************************************** */

HelloProgram:
        '@echo off'
        CALL SysCls
        SAY
        SAY '+--------------------------------------------------------------+'
        SAY ' 'progname 'V'version '(c) 'date 'by Roland Schmalenberg'
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
        SAY '          * ******************************************************* *'
        SAY '          *                  (c) '||date||' by                      *'
        SAY '          *   RolandSchmalenberg, roland.schmalenberg@lycosxxl.de   *'
        SAY '          *  My swiss-knife-tools for running TYPO3 on eComStation  *'
        SAY '          * ******************************************************* *'
        SAY
        SAY 'This program will change all definitions of "TYPO3_OS" into values usable from'
        SAY 'Mac OS/X, linux, windows and also OS/2 or eComStation. Furthermore it will also'
        SAY 'switch line 45 in typo3\install\index.php to 1-2-3-install mode.'
        SAY
        SAY 'Command line options:'
        SAY '---------------------'
        SAY '-exec       execute this script (without any other option: script use defaults)'
        SAY '-dl:x       download from      1=Reston/North America, 2=Curitiba/South America'
        SAY '                               3=Ishikawa/Asia,        4=Sydney/Australia'
        SAY '                               5=Paris/Europe          (default)'
        SAY '-t3:x       get TYPO3-package  1=quickstart-3.8.0      (default)'
        SAY '                               2=dummy-3.8.0           3=testsite-3.8.0'
        SAY '                               4=quickstart-3.8.1      5=dummy-3.8.1'
        SAY '                               6=testsite-3.8.1'
        SAY '-t4:0       get TYPO3-package(s) typo3_src-4.0.2 + dummy-4.0.2'
        SAY '-h [-? /?]  show this help'
        SAY '-H [-T -V]  show history, todo or version of this program'
EXIT

HelpParameterMissed:
        SAY 'This program have to be used together with command line parameters!'
        SAY
        SAY 'You can get help with "'||progname||' -h" at your command line!'
EXIT

ShowResults:
      SAY
      SAY 'We had finished the jobs with the following results:'
      SAY
      SAY 'Number of missed files to be changed in source:  '||NotFoundCount
      SAY 'Number of found files to be changed in source:   '||FoundCount
      SAY 'Number of successfully changed files:            '||ChangedCount
      IF ChangedCount = FoundCount THEN
         DO
            SAY "           _______   ______   ___ _____                              "
            SAY "          |_   _\ \ / /  _ \ / _ \___ /    __ _  ___   ___  ___      "
            SAY "            | |  \ V /| |_) | | | ||_ \   / _` |/ _ \ / _ \/ __|     "
            SAY "            | |   | | |  __/| |_| |__) | | (_| | (_) |  __/\__ \     "
            SAY "            |_|   |_| |_|    \___/____/   \__, |\___/ \___||___/     "
            SAY "                                          |___/                      "
            SAY "             ____                ____  _        _   _                "
            SAY "        ___ / ___|___  _ __ ___ / ___|| |_ __ _| |_(_) ___  _ __     "
            SAY "       / _ \ |   / _ \| '_ ` _ \\___ \| __/ _` | __| |/ _ \| '_ \    "
            SAY "      |  __/ |__| (_) | | | | | |___) | || (_| | |_| | (_) | | | |   "
            SAY "       \___|\____\___/|_| |_| |_|____/ \__\__,_|\__|_|\___/|_| |_|   "
            SAY "                                                                     "
            SAY
            SAY '                              Hallelujah!'
            SAY '   You are now only a few steps away from using TYPO3 on eComStation'
            SAY '     TYPO3 goes eComStation is maintained by the following people:'
            SAY
            SAY '                  Michael Oehlhof, michael@ampos2.de'
            SAY '         Roland Schmalenberg, roland.schmalenberg@lycosxxl.de'
         END
      ELSE
         DO
            SAY
            SAY 'There had been some errors, please check your system before'
            SAY 'you try to use TYPO3 on eComStation anyway!'
            SAY
            SAY 'TYPO3 goes eComStation is maintained by the following people:'
            SAY
            SAY 'Michael Oehlhof, Michael Oehlhof, info@ampos2.de'
            SAY 'Roland Schmalenberg, roland.schmalenberg@lycosxxl.de'
         END
      SAY
      SAY Date(E)||'-'||Time()||' Elapsed runtime in seconds: '||Time(E)
RETURN

ShowToDo:
        SAY '          * ******************************************************* *'
        SAY '          *                  (c) '||date||' by                      *'
        SAY '          *    Roland Schmalenberg, roland.schmalenberg@lycos.de    *'
        SAY '          *  My Swiss-knife-tools for running TYPO3 on eComStation  *'
        SAY '          * ******************************************************* *'
        SAY
        SAY 'My ToDo-list:'
        SAY
        SAY '1. get TYPO3 starter package automatically               (dispatched with 1.06)'
        SAY '2. check MD5 selected TYPO3-package automatically'
        SAY '3. unzip automatically                                   (dispatched with 1.05)'
        SAY '4. zip the modified TYPO3-package automatically'
        SAY '5. build finally a MD5-checksum for that archive'
EXIT

ShowHistory:
        SAY '* *************************************************************************** *'
        SAY '* History                                                                     *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.00-20051106                                                               *'
        SAY '* The most beginnings start with troubles, but where is my Murphy?            *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.01-20051106                                                               *'
        SAY '* Changed all my german stuff to the english spoken world                     *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.02-20051106                                                               *'
        SAY '* Single file version is ready, should be tested if runnable without errors   *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.03-20051106                                                               *'
        SAY '* Multi file version is ready, should be tested if runnable without errors    *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.04-20051106                                                               *'
        SAY '* Create target folder -os2-prep, if not exist                                *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.05-20051107                                                               *'
        SAY '* Some minor corrections to the help function, pin stands now for package in  *'
        SAY '* Next public release will not create the folder -os2-prep, because no one of *'
        SAY '* the os/2-user will really use the windows original folder, so we can spare  *'
        SAY '* the copy folder time                                                        *'
        SAY '..................................................... go ahead with any key ...'
        Tastatureingabe = SysGetKey(NoEcho)
        CALL SysCls

        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.06-20051108                                                               *'
        SAY '* Major changes begins, I prefer now automatic download with wget, if the     *'
        SAY '* typo3-package cannot be found, wget and libraries are bundled in my tool to *'
        SAY '* make it easier, there are a lot of users out in the world without having it *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.07-20051109                                                               *'
        SAY '* Major changes (cont), 1/3 typo3-packages and 1/5 download areas from diffe- *'
        SAY '* rent continents can be selected in menue, default to quickstart-3.8.0 and   *'
        SAY '* Paris, Europe now                                                           *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.08-20051109                                                               *'
        SAY '* Minor changes (cont), will do the remark of the installblocker (//   die)   *'
        SAY '* automatically, because all of the people using this script should know what *'
        SAY '* they are doing, or not ;-)                                                  *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.09-20051110                                                               *'
        SAY '* Bugfix, the remarking of the installblocker (//  die) was not done before   *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.10-20051111                                                               *'
        SAY '* Cosmetic changes                                                            *'
        SAY '..................................................... go ahead with any key ...'
        Tastatureingabe = SysGetKey(NoEcho)
        CALL SysCls

        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.11-20051112                                                               *'
        SAY '* Added logging                                                               *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.12-20051112                                                               *'
        SAY '* Minor fixes in building logname, added some more information to log file    *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.13-20051112                                                               *'
        SAY '* Further minor fixes as found by Andreas Roederer, thanks                    *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.14-20051114                                                               *'
        SAY '* Minor changes in logging information as recommended by Andreas Roederer     *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 1.15-20051115                                                               *'
        SAY '* Added quickstart-3.8.1, dummy-3.8.1 and testsite-3.8.1                      *'
        SAY '..................................................... go ahead with any key ...'
        Tastatureingabe = SysGetKey(NoEcho)
        CALL SysCls

        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 2.00-20061110                                                               *'
        SAY '* Changed all mistyped Typo3 to TYPO3                                         *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 2.01-20061111                                                               *'
        SAY '* Renamed to GetTYPO3v4forOS2.cmd                                             *'
        SAY '* Added TYPO3 4.0.x, TYPO3.org changed method, there are now 2 archives to do *'
        SAY '* - typo3_src-4.0.2                                                           *'
        SAY '* - dummy-4.0.2                                                               *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 2.02-20061112                                                               *'
        SAY '* Added GetTYPO3v4forOS2List.txt for changes to be done in TYPO3 version 4.x  *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 2.03-20061112                                                               *'
        SAY '* Added TYPO_OS searchstring variant #2 :-( to find all occurences of TYPO_OS *'
        SAY '* --------------------------------------------------------------------------- *'
        SAY '* 2.04-20061112                                                               *'
        SAY '* Changed mail addresses due to spamming issues                               *'
        SAY '* *************************************************************************** *'
EXIT

/* End GetTYPO3v4forOS2 */
