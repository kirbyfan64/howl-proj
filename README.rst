howl-proj
=========

An extended project system for `Howl <http://howl.io/>`_.

Installation
************

Copy ``init.moon`` into ``~/.howl/bundles/howl-proj``, creating directories as necessary.

OR

Run ``./install.sh``.

Usage
*****

You use it like so::
   
   $ howl my-project-file.howl-proj -

replacing ``my-project-file.howl-proj`` with your project file.

You can also do this::
   
   $ howl -

which will use ``.howl-proj`` as the project file.

Project files
*************

They look like this::
   
   file1.cpp
   file2.py
   file3.flx
   file4.moon
   file5.nim
   !:
   this_section_is_moonscript_code = ->
     print 123456

The files listed will be opened, and anything past the ``!:`` will be considered MoonScript code. (Howl tip: to switch between the open files, use ``Ctrl-B``.)

TODO
****

- Scanning the filesystem upwards for project files.
- Better documentation!
