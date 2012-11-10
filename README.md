Reborn-PK3-Content
==================

Content for Reborn 1.12 .pk3 library

Compiling .pk3 content
======================

There are several ways you can choose to build a .pk3

* Build the .pk3 file using build.bat

> \> build.bat

* Build the .pk3 file using compile.bat script (build.bat uses it with a predefined name):

> \> compile.bat \<pakname\>


Creating a new Script Library
=============================

To create a new script library template, run:

> \> create-scriptlib.bat \<filename\> \<libname\> \<libtitle\> \<version\> \<author\>

For example:

> \> create-scriptlib.bat strings "Strings Library" "Elgans Strings Library" 1.0 "Elgan"

This will create a .slib Script Library file compatible with Reborn ModLoader Framework, for you to fill in with needed library functions

Creating a new Mod Project
==========================

To create a new mod project compatible with Reborn ModLoader Framework, run:

> \> create-project.bat \<path\> \<projectname\>

For example:

> \> create-project.bat mymodfolder myownmod

This will create a proper folder structure for your project, as well as Mod Config File (.mcfg), and proper build and compile scripts.

The folder structure for the project will look like this:

>&nbsp../mymodfolder/<br/>
>&nbsp&nbsp&nbsp&nbsp|<br/>
>&nbsp&nbsp&nbsp&nbsp-->&nbspcompile.bat<br/>
>&nbsp&nbsp&nbsp&nbsp--> compile-pk3.bat<br/>
>&nbsp&nbsp&nbsp&nbsp--> compile-clear.bat<br/>
>&nbsp&nbsp&nbsp&nbsp--> build.bat<br/>
>&nbsp&nbsp&nbsp&nbsp--> build/<br/>
>&nbsp&nbsp&nbsp&nbsp--> src/<br/>
>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp|<br/>
>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--> myownmod/<br/>
>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp|<br/>
>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp-->&nbspmyownmod.mcfg<br/>
>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp-->&nbsplibs/<br/>
>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp-->&nbspscripts/<br/>
			  