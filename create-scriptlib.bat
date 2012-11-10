@ECHO OFF
IF [%1] == [] GOTO HELP

GOTO CREATE
GOTO END

:CREATE
	ECHO __libinfo: > %1.slib
	ECHO 	local.info["name"] ^= %2 >> %1.slib
	ECHO 	local.info["namespace"] ^= "%1" >> %1.slib
	ECHO 	local.info["title"] ^= %3 >> %1.slib
	ECHO 	local.info["version"] ^= %4 >> %1.slib
	ECHO 	local.info["author"] ^= %5 >> %1.slib
	ECHO end local.info >> %1.slib
	ECHO. >> %1.slib
	ECHO __libinit local.libFilePath: >> %1.slib
	ECHO. >> %1.slib
	ECHO 	local.init["loaded"] ^= 0 >> %1.slib
	ECHO 	local.init["lib"] ^= NIL >> %1.slib
	ECHO. >> %1.slib
	ECHO 	level.%1 ^= local CreateListener >> %1.slib
	ECHO 	level.%1.getInfo ^= local.libFilePath::_libinfo >> %1.slib
	ECHO. >> %1.slib
	ECHO 	if(level.%1 ^!^= NULL ^&^& level.%1 ^!^= NIL) { >> %1.slib
	ECHO. >> %1.slib
	ECHO 		// Place your code here >> %1.slib
	ECHO. >> %1.slib
	ECHO 	} >> %1.slib
	ECHO. >> %1.slib
	ECHO 	// If your lib is initialized and loaded properly >> %1.slib
	ECHO 	local.init["loaded"] ^= 1 >> %1.slib
	ECHO 	local.init["lib"] ^= level.%1 >> %1.slib
	ECHO. >> %1.slib
	ECHO end local.init >> %1.slib
	
	ECHO.
	ECHO Your Script Library Template has been created.
	ECHO You can now fill it with the rest of the content.
	ECHO.
	PAUSE
	GOTO END

:HELP
	ECHO.
	ECHO Help:
	ECHO 	create-scriptlib.bat ^<filename^> ^<libname^> ^<libtitle^> ^<version^> ^<author^>
	ECHO.
	ECHO 	eg. create-scriptlib.bat strings "Strings Library" "Elgans Strings Library" 1.0 "Elgan"
	PAUSE
	GOTO END
	
:END
	