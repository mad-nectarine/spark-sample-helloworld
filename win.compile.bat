echo OFF
set ROOT_DIR=%CD%
call :GET_FILENAME "%ROOT_DIR%"
set OUT_DIR=C:\%DIR_NAME%
echo "root path is %ROOT_DIR%"
echo "output directory is %OUT_DIR%"

echo "==== #1 initialize compile directory ===="
if exist "%OUT_DIR%" (
    echo "output directory already exists"    
    echo "clean output directory"
    rmdir /s "%OUT_DIR%"
) 
echo "==== #2 copy project ===="
echo D | xcopy "%ROOT_DIR%\project" "%OUT_DIR%\project" /I /Y /R
echo "==== #3 copy src ===="
echo D | xcopy "%ROOT_DIR%\src" "%OUT_DIR%\src" /I /Y /R /E
echo "==== #4 copy build.sbt, sample-data.txt ===="
echo F | xcopy "%ROOT_DIR%\build.sbt" "%OUT_DIR%\build.sbt" /Y /R
echo F | xcopy "%ROOT_DIR%\sample-data.txt" "%OUT_DIR%\sample-data.txt" /Y /R
echo "copy completed."
echo "==== #5 compile by sbt ===="
cd "%OUT_DIR%"
sbt assembly >> "compile.log" | echo "log file [compile.log]"
echo "compile completed. [%OUT_DIR%\target\scala-2.11]"
explorer "%OUT_DIR%\target\scala-2.11"

PAUSE
EXIT

:GET_FILENAME
SET DIR_NAME=%~n1
:END






