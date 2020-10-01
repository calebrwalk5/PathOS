========================
The MikeOS Mouse Library
========================
Copyright (C) Joshua Beck 2013
Email: mikeosdeveloper@gmail.com
This program is licence under the GNU General Public Licence, version 3
See 'licence.txt' for details

The MikeOS Mouse Library is a fully functional mouse library for MikeOS that can be included in any assembly program.

How to use the MikeOS mouse library in your MikeOS program:

1) Copy the file 'mouse.lib' from the archive to the 'programs' directory inside your MikeOS folder.

2) Include the library with your program. This can be archieved by adding the following line anywhere in the program.
%include 'mouse.lib'

3) Install the mouse driver in the program before any mouse functionality is needed. This can be done with the following line.
call mouselib_setup

4) Before the program exits remember to run uninstall the mouse driver or MikeOS may lockup. Use the following line.
call mouselib_remove_driver

5) That's it, you can now use calls to the mouse library in your program. See the 'API' document for details.

Information on library calls can be found within the API document.

Files:
readme.txt --- This document.
mouse.lib --- The mouse library. This is included with programs so place it in your MikeOS folder.
mouse.asm --- Demonstration Program. An example of basic library functions.
mouse2.asm --- Demonstration Program. An example of interactive move.
mouse3.asm --- Demonstration Program. An example of event mode.
api.txt --- API Documentation. Reference for the functions provided by the library.
licence.txt --- The GNU General Public Licence version 3, under which all code in this archive is released.
changes.txt --- Log of previous changes to the library.


