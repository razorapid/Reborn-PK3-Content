@ECHO OFF
IF [%1]==[] GOTO WRONG_LIB

SET LIBNAMETOZIP=%1
SET BUILDDIR=build
SET SOURCEDIR=src
@RMDIR /S /Q %BUILDDIR%
@MKDIR %BUILDDIR%

CALL :GENERATE_FILE
CALL :COMPILE
CALL :BUILD

:GENERATE_FILE
	
	ECHO Set objArgs = WScript.Arguments > zipIt.vbs
	ECHO InputFolder = objArgs(0) >> zipIt.vbs
	ECHO ZipFile = objArgs(1) >> zipIt.vbs
	ECHO Set app = CreateObject("Shell.Application") >> zipIt.vbs
	ECHO Set fso = CreateObject("Scripting.FileSystemObject") >> zipIt.vbs
	ECHO Set pak = fso.CreateTextFile(ZipFile, True) >> zipIt.vbs
	ECHO pak.Write "PK" ^& Chr(5) ^& Chr(6) ^& String(18, vbNullChar) >> zipIt.vbs
	ECHO pak.Close >> zipIt.vbs
	ECHO Set files = app.NameSpace(fso.GetAbsolutePathName(InputFolder)) >> zipIt.vbs
	ECHO Set source = files.Items >> zipIt.vbs
	ECHO Set destination = app.NameSpace(fso.GetAbsolutePathName(ZipFile)) >> zipIt.vbs
	ECHO destination.CopyHere(source) >> zipIt.vbs
	
	ECHO Do Until destination.Items.Count = files.Items.Count >> zipIt.vbs
    ECHO    WScript.Sleep 200 >> zipIt.vbs
	ECHO Loop >> zipIt.vbs
	GOTO :EOF

:COMPILE	
	@CScript  zipIt.vbs  %SOURCEDIR%  %LIBNAMETOZIP%.zip
	ECHO Compilation finished.
	GOTO :EOF

:BUILD
	ECHO Building...
	@COPY /Y /B %LIBNAMETOZIP%.zip /B %LIBNAMETOZIP%.pk3
	@MOVE /Y %LIBNAMETOZIP%.pk3 %BUILDDIR%/
	@MOVE /Y %LIBNAMETOZIP%.zip %BUILDDIR%/
	
	ECHO Building finished.
	
	GOTO :EOF

:WRONG_LIB
	ECHO Compile error! Empty library name!
	 
	 