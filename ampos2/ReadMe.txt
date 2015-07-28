AMP for OS/2 Warp and eComStation
=================================


WARNING
  Use this installation only if you have none of Apache,
  MySQL and PHP installed.
NOTE
  This installer is for first time installations.


Contents
--------
  Welcome to the first AMP package for OS/2 and eComStation.

  Modules included in this build:
        - Apache 2.0.55
        - MySQL 4.1.7
        - PHP4 4.3.10


Apache 2.0.55
-------------

  This is a binary package of Apache 2.0.55 for OS/2.

  The binaries were compiled by Brian Havard <bjh@apache.org>
  on an AMD Athlon/2800+ platform running OS/2 Warp Server v4.5
  using EMX gcc version 0.9d.

  To use this binary you will need to have the EMX runtime installed.
  This can be downloaded from
  ftp://hobbes.nmsu.edu/pub/os2/dev/emx/v0.9d/emxrt.zip

  For some tips and other info on running Apache under OS/2 see
  http://silk.apana.org.au/apache/



MySQL 4.1.7
-----------

  The MySQL server is distributed under the GPL license.
  Please refer to the file COPYING for the license information.

  The MySQL client library is distributed under the LGPL license.
  Please refer to the file COPYING for the license information.

  Most of the MySQL clients are distributed under the GPL license,
  but some files may be in the public domain.

  MySQL is brought to you by: TcX DataKonsult AB & MySQL Finland AB

  This port is brought to you by:

  Yuri Dario <mc6530@mclink.it>, development, porting
  Timo Maier <tam@gmx.de>, documentation, testing
  John M Alfredsson <jma@jmast.se>, documentation, testing



PHP4 4.3.10
-----------

  This archive contains a port of PHP4 for OS/2.
  The binaries were compiled by Brian Havard <bjh@apache.org>



System requirements:
--------------------
- OS/2 Warp 3 with FP ?? or later,
  OS/2 Warp 4 with FP ?? or later,
  OS/2 Warp Server for e-Business,
  eComStation 1.0,1.1,1.2
- TCPIP 4.x installed (requires 32-bit tcpip stack)
- WarpIN installer 1.0.4
  (ftp://ftp.netlabs.org/pub/warpin/warpin-1-0-4.exe)
- Pentium (or higher) processor is required (no 386/486)

Note: probably some fixpak level is required on both Warp3&Warp4
      to support >2GB file sizes.



Installation
------------

  Save the installation archives into a temporary folder and
  double click on the main package; otherwise you can drop the
  ampos2 package in your WarpIN object or type

        WARPIN AMPOS2-A20.WPI

  from the command line.


================================================
Michael Oehlhof <info@ampos2.de>
http://www.ampos2.de

