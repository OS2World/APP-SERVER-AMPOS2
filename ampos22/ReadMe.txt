AMP for OS/2 Warp and eComStation
=================================


WARNING
  Use this installation only if you have none of Apache,
  MySQL and PHP installed.
NOTE
  This installer is for first time installations.


Contents
--------
  Welcome to the AMP package for OS/2 and eComStation.

  Modules included in this build:
        - Apache 2.2.23
        - MySQL 5.1.66
        - PHP5 5.3.17
        - phpMyAdmin 3.4.11.1
        - library files


Apache 2.2.23
-------------

  This is a binary package of Apache 2.2.23 for OS/2.

  The binaries were compiled by Brian Havard <bjh@apache.org>
  on an AMD Athlon/2800+ platform running OS/2 Warp Server v4.5
  using EMX gcc version 0.9d.

  To use this binary you will need to have the EMX runtime installed.
  This can be downloaded from
  ftp://hobbes.nmsu.edu/pub/os2/dev/emx/v0.9d/emxrt.zip

  For some tips and other info on running Apache under OS/2 see
  http://silk.apana.org.au/apache/

  This port is brought to you by:
  Paul Smedley <http://smedley.info/os2ports>


MySQL 5.1.66
------------

  The MySQL server is distributed under the GPL license.
  Please refer to the file COPYING for the license information.

  The MySQL client library is distributed under the LGPL license.
  Please refer to the file COPYING for the license information.

  Most of the MySQL clients are distributed under the GPL license,
  but some files may be in the public domain.

  MySQL is brought to you by: TcX DataKonsult AB & MySQL Finland AB

  This port is brought to you by:
  Paul Smedley <http://smedley.info/os2ports>


PHP5 5.3.17
-----------
 
  Including pdflib

  This archive contains a port of PHP5 for OS/2.
  This port is brought to you by:
  Paul Smedley <http://smedley.info/os2ports>


phpMyAdmin 3.4.11.1
-------------------

  This is the original source package from SourceForge.
  <http://www.phpmyadmin.net>


library files
-------------
  gcc335.dll
  gcc432.dll
  gcc440.dll
  gcc444.dll
  gcc446.dll
  gcc453.dll
  libc06.dll
  libc061.dll
  libc062.dll
  libc062x.dll
  libc063.dll
  libc064.dll
  libc065.dll



System requirements:
--------------------
- OS/2 Warp 3 with FP ?? or later,
  OS/2 Warp 4 with FP ?? or later,
  OS/2 Warp Server for e-Business,
  eComStation 1.0, 1.1, 1.2, 2.0, 2.1
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

        WARPIN AMPOS2-A22-yyyymmdd.WPI

  from the command line. Thereby yyyymmdd stand for the
  appropriate creation date of the installation package.


================================================
Michael Oehlhof <info@amp4ecs.de>
http://www.amp4ecs.de
http://www.ampos2.de
