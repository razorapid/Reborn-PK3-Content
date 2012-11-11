@ECHO OFF
IF [%1] == [] GOTO HELP

GOTO CREATE
GOTO END

:CREATE
	@MKDIR %1
	@MKDIR %1\build
	@MKDIR %1\src
	@MKDIR %1\src\%2
	@MKDIR %1\src\%2\libs
	@MKDIR %1\src\%2\scripts
	@MKDIR %1\src\%2\data
	
	ECHO >> %1\src\%2\%2.mcfg
	
	@COPY compile.bat %1\compile.bat
	@COPY compile-pk3.bat %1\compile-pk3.bat
	@COPY compile-clear.bat %1\compile-clear.bat
	
	ECHO compile.bat r_%2 >> %1\build.bat
	
	ECHO.
	ECHO Project tree created!
	ECHO.
	PAUSE
	GOTO END

:HELP
	ECHO.
	ECHO Help:
	ECHO 	create-project.bat ^<path^> ^<projectname^>
	ECHO.
	ECHO 	eg. create-project.bat mymodfolder myownmod
	PAUSE
	GOTO END
	
:END