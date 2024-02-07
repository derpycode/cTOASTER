@ECHO OFF
SET _find_cmd=FINDSTR ctoaster_root "%USERPROFILE%\.ctoasterrc"
FOR /F "tokens=2" %%r IN ('%_find_cmd%') DO (
  SET "PATH=%%r\tools\netcdf\%TARGET_ARCH%\lib;%PATH%"
  CALL %%r\tools\find_python.bat
  IF NOT DEFINED PYTHON EXIT /B 0
  %PYTHON% %%r\tools\go.py %*
  EXIT /B 0
)
