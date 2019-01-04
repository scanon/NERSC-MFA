@ECHO OFF
SET USER=%1
IF NOT DEFINED USER (
	ECHO usage: %0 username
	EXIT /b 1
)
SET SCOPE=default
SET PPK=nersckey.ppk
SET URL=sshproxy-dev.nersc.gov
SET CURL=%USERPROFILE%\Downloads\curl-7.61.0_4-win32-mingw\curl-7.61.0-win32-mingw\bin\
PATH %PATH%;%CURL%

curl -s -S -u %USER% -X POST -o %PPK% "https://%URL%/create_pair/%SCOPE%/?format=ppk"

pageant %PPK%
putty -agent %USER%@cori.nersc.gov
