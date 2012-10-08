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
	
	ECHO >> %1\src\%2\%2.mcfg
	
	@COPY compile.bat %1\compile.bat
	@COPY compile-pk3.bat %1\compile-pk3.bat
	@COPY compile-clear.bat %1\compile-clear.bat
	
	ECHO compile.bat %2 >> %1\build.bat
	
	ECHO.
	ECHO Project tree created!
	ECHO.
	PAUSE
	GOTO END

:HELP
	ECHO.
	ECHO Help:
	ECHO 	create-project.bat ^<path^> ^<projectname^> ^<libtitle^> ^<version^> ^<author^>
	ECHO.
	ECHO 	eg. create-scriptlib.bat strings "Strings Library" "Elgans Strings Library" 1.0 "Elgan"
	PAUSE
	GOTO END
	
:END