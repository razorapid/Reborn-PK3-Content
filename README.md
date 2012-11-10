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
<code>
* __../mymodfolder/__ 
	* compile.bat  
	* compile-pk3.bat  
	* compile-clear.bat  
	* build.bat  
	* __build/__
	* __src/__
		* __myownmod/__
			* myownmod.mcfg  
			* __libs/__
			* __scripts/__
</code>		

MorpheusDoc
===========

MorpheusDoc is a JavaDoc-like tool for autmatic Script Library documentation creation.
It can create documentation in Markdown and HTML version.

It's in a very early alpha stage, but it's already useable.

To use type:

> \> MorpheusDoc.exe \<scriptlib\> \<output\> \<outputtype\>

For example:

> \> MorpheusDoc.exe files.slib files.html -html

You can choose between -html or -md output types.

__How to create proper Script Library Documentation__

MorpheusDoc skips functions and variables that start with __.
Every MorpheusDoc documentation comment is inside of /** **/ comment tags.

It'll look for Variables and Constants declared in __libinfo function.
To declare them use specific notation:

> /** Constant, Type: String, Description: Custom constant variable **/  
> level.mymod.CONSTANT_VARIABLE = "content"

Variables can be either: Variable, or Constant  

For variable type you can choose from:

* String
* Integer
* Float
* Vector
* Entity
* Player
* Weapon
* Array
* Origin
* Function
* Void
* Unknown

Another example:

> /** Variable, Type: Integer, Description: Keeps seconds **/  
> level.mymod.secondsLeft = 30

MorpheusDoc documentation comments for functions are a bit different.
The scheme is as follows:

> /**  
> \* Description: test description  
> \* @filename: string, File's name  
> \* @accesstype: string, File access type, optional  
> \* Returns: Handle to file  
> \* Usage: local.file = waitexec level.newFile "file.txt" "r+"  
> **/  
> NewFile local.filename local.accesstype:  
> ...  

MorpheusDoc will scan whole lib and identify public functions (those which doesn't start with __).
It'll create a documentation for them even if MorpheusDoc Comments doesn't exists for given function.

In the comment, you can use multiple entires to describe arguments.
Arguments have to start with @, after which you should specify the name of the argument that you want to describe.
After the colon (:), you should specify a type of a variable.  

For argument type you can choose from:

* String
* Integer
* Float
* Vector
* Entity
* Player
* Weapon
* Array
* Origin
* Function
* Void
* Unknown

Argument type is followed by a comma, after which, you can specify a description for argument.
Second comma is optional. After that comma, you can specify additional parameter - optional, which states that given argument is optional and not required by the function.
