
           _____                 _____
          |_   _|   _ _ __   ___|___ /    __ _  ___   ___  ___
            | || | | | '_ \ / _ \ |_ \   / _` |/ _ \ / _ \/ __|
            | || |_| | |_) | (_) |__) | | (_| | (_) |  __/\__ \
            |_| \__, | .__/ \___/____/   \__, |\___/ \___||___/
                |___/|_|                 |___/
             ____                ____  _        _   _
        ___ / ___|___  _ __ ___ / ___|| |_ __ _| |_(_) ___  _ __
       / _ \ |   / _ \| '_ ` _ \\___ \| __/ _` | __| |/ _ \| '_ \
      |  __/ |__| (_) | | | | | |___) | || (_| | |_| | (_) | | | |
       \___|\____\___/|_| |_| |_|____/ \__\__,_|\__|_|\___/|_| |_|


   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±± GetTypo3forOS2Readme.txt ±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
                        [Release 1.15  2005-11-15]

    Hi folks,
    welcome to my swiss-knife-tools around <*Typo3 goes eComStation*>!
    If you downloaded this archive before you had decided to run one
    of the famoust Open Source Content Management Systems ever seen:

   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±±±±±±±±±±±± Typo3 ±±±±±±±±±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

    That CMS is well known for running on different operating systems
    like
    - Linux,
    - Mac OS/X and
    - Windows
    but not for OS/2 or eComStation.

    Yes, this is history.

   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±± Warpstock 2005 Dresden, Germany ±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

    From now on, Typo3 is running based on our favorite operating
    systems OS/2 and eComStation.

    One of the main tasks, we had to do, is to change some files of
    the php files to our needs. This will be obsolete if the
    developers of Typo3 agree to our proposal in the near future.

    In the meantime you can use this little script.


   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±± The archive consists of ±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

    - this 'GetTypo3forOS2Readme.txt',
    - the shortened 'Readme.txt' for the WarpIn-package,
    - the script 'GetTypo3forOS2.cmd',
    - the to-be-changed-list-file 'GetTypo3forOS2list.txt'
    - the tool 'wget-1.10.1-os2r2.zip',
    - the lib 'libc06r1.zip',
    - the lib 'iintl6i.zip' and
    - the tool 'md5suml.exe'

   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±± What does the script do? ±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

    It
    1. looks if there is already an unpacked Typo3-folder
       (quickstart-3.8.0, dummy-3.8.0, testsite-3.8.0,
        quickstart-3.8.1, dummy-3.8.1 or testsite-3.8.1)
    2. if not, looks if there is one of the Typo3 archives
    3. if not, downloads it from the internet and extract it
       (to e.g. quickstart-3.8.0)
    4. changes all occurencies of TYPO3_OS-definitions in the files
       listed in 'GetTypo3forOS2List.txt'
    5. switches typo3\install\index.php to install mode too
    6. and finally reports any errors or success

    If anything goes well, you have a folder (e.g. quickstart-3.8.0)
    with all the files for running Typo3 on OS/2 and eComStation ...


   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±±± How to use this script ±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

    This script has to be used together with command line parameters!
    You can get help with "GetTypo3forOS2 -h" at your command line!

    Command line options:
    ---------------------
    -exec       execute this script (if no other option: use defaults)
    -dl:1       download from Reston (North America)
    -dl:2       download from Curitiba (South America
    -dl:3       download from Ishikawa (Asia)
    -dl:4       download from Sydney (Australia)
    -dl:5       download from Paris (Europe)          (default)
    -t3:1       download Typo3-quickstart-3.8.0       (default)
    -t3:2       download Typo3-dummy-3.8.0
    -t3:3       download Typo3-testsite-3.8.0
    -t3:4       download Typo3-quickstart-3.8.1
    -t3:5       download Typo3-dummy-3.8.1
    -t3:6       download Typo3-testsite-3.8.1
    -h [-? /?]  show this help
    -H [-T -V]  show History, ToDo or Version of this program


    As you can see above, there will be no execution if you don't call
    the script together with the '-exec' or other option, so nothing
    happened to that people, who try to start it without reading this
    readme.txt first ;-)!

   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±±±±±±±± Hallelujah! ±±±±±±±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

    You are now only a few steps away from <*Typo3 goes eComStation*>


   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±± Maintainer of Typo3 goes eComStation ±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±±±±±±± ImageMagick/2 ±±±±±±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

                     Paul Smedley, paul@smedley.info


   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±±±±± eCAMP- and AMPOS2 ±±±±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

                     Michael Oehlhof, info@ampos2.de
            Roland Schmalenberg, roland.schmalenberg@lycos.de


   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±±±±±± GetTypo3forOS2 ±±±±±±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

            Roland Schmalenberg, roland.schmalenberg@lycos.de


   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ³±±±±±±±±±±±±±±±±±±±±±±±±±± 2005-11-15 ±±±±±±±±±±±±±±±±±±±±±±±±±±±³
   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ