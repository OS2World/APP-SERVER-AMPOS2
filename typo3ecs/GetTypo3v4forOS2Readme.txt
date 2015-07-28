           _______   ______   ___ _____
          |_   _\ \ / /  _ \ / _ \___ /    __ _  ___   ___  ___
            | |  \ V /| |_) | | | ||_ \   / _` |/ _ \ / _ \/ __|
            | |   | | |  __/| |_| |__) | | (_| | (_) |  __/\__ \
            |_|   |_| |_|    \___/____/   \__, |\___/ \___||___/
                                          |___/
             ____                ____  _        _   _
        ___ / ___|___  _ __ ___ / ___|| |_ __ _| |_(_) ___  _ __
       / _ \ |   / _ \| '_ ` _ \\___ \| __/ _` | __| |/ _ \| '_ \
      |  __/ |__| (_) | | | | | |___) | || (_| | |_| | (_) | | | |
       \___|\____\___/|_| |_| |_|____/ \__\__,_|\__|_|\___/|_| |_|


   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±± GetTYPO3v4forOS2Readme.txt ±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
                        [Release 2.03  2006-11-12]

    Hi folks,
    welcome to my Swiss-knife-tools around <*TYPO3 goes eComStation*>!
    If you downloaded this archive before, you had decided to run one
    of the most famous Open Source Content Management Systems ever seen:

   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±±±±±±±±±±±± TYPO3 ±±±±±±±±±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

    That CMS is well-known for running on different operating systems
    like
    - Linux,
    - Mac OS/X, and
    - Windows
    but not OS/2 or eComStation.

    At Warpstock Europe 2005 in Dresden, Germany that became history.

    From that time on TYPO3 has been running based on our favorite
    operating systems OS/2 and eComStation.

    One of the main tasks we had to do, was to change some of the PHP
    files to our needs. This will become obsolete if the developers
    of TYPO3 agree to our proposals in the near future.

    In the meantime you can use this little script.


   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±± The archive consists of ±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

    - this 'GetTYPO3v4forOS2Readme.txt',
    - the shortened 'Readme.txt' for the WarpIn-package,
    - the script 'GetTYPO3v4forOS2.cmd',
    - the to-be-changed-list-file 'GetTYPO3v3forOS2list.txt'
    - the to-be-changed-list-file 'GetTYPO3v4forOS2list.txt'
    - the tool 'wget-1.10.1-os2r2.zip',
    - the lib 'libc06r1.zip',
    - the lib 'iintl6i.zip', and
    - the tool 'md5suml.exe'

   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±± What does the script do? ±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

    It
    1. looks if there is already an unpacked TYPO3-folder
       (quickstart-3.8.0, dummy-3.8.0, testsite-3.8.0,
        quickstart-3.8.1, dummy-3.8.1, testsite-3.8.1, or
        dummy-4.02)
    2. if not, looks if there is one of the TYPO3 archives
    3. if not, downloads it from the internet and extracts it
       (to e.g., quickstart-3.8.0)
    4. changes all occurences of TYPO3_OS definitions in the files
       listed in 'GetTYPO3v3forOS2List.txt' or 'GetTYPO3v4forOS2List.txt'
    5. switches typo3\install\index.php to install mode, too,
    6. and finally reports any errors or success

    If everything goes well, you will have a folder (e.g.,
    quickstart-3.8.0) with all the files for running TYPO3 on OS/2
    and eComStation. . .


   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±±± How to use this script ±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

    This script has to be used together with command line parameters!
    You can get help with "GetTYPO3v4forOS2 -h" at your command line!

    Command line options:
    ---------------------
    -exec       execute this script (without any other option: script uses defaults)
    -dl:x       download from      1=Reston/North America, 2=Curitiba/South America
                                   3=Ishikawa/Asia,        4=Sydney/Australia
                                   5=Paris/Europe          (default)
    -t3:x       get TYPO3-package  1=quickstart-3.8.0      (default)
                                   2=dummy-3.8.0           3=testsite-3.8.0
                                   4=quickstart-3.8.1      5=dummy-3.8.1
                                   6=testsite-3.8.1
    -t4:0       get TYPO3-package(s) typo3_src-4.0.2 + dummy-4.0.2
    -h [-? /?]  show this help
    -H [-T -V]  show history, todo or version of this program

    As you can see above, there will be no execution if you don't call
    the script together with the '-exec' or other option, so nothing
    happened to those people who tried to start it without reading this
    readme.txt first! ;-)

   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±± Who maintains TYPO3 goes eComStation? ±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±±±±±±±±±±± OAMP ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

                    Thorolf Godawa, thorolf@godawa.de
           based on ports from Paul Smedley, paul@smedley.info


   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±±±±± OAMP-WP-Installer ±±±±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

                     Michael Oehlhof, info@ampos2.de
          Roland Schmalenberg, roland.schmalenberg@lycosxxl.de


   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±±±±± GetTYPO3v4forOS2 ±±±±±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

          Roland Schmalenberg, roland.schmalenberg@lycosxxl.de


   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±±±±±±±± 2006-11-12 ±±±±±±±±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ