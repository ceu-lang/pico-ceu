@echo off

set CEU_SRC=%1
if exist %CEU_SRC%\main.ceu set CEU_SRC=%CEU_SRC%\main.ceu
for %%A in ("%CEU_SRC%") do (
    set CEU_DIR=%%~dpA
)

set PATH=%~dp0\..\mingw\bin

cd %~dp0

lua53.exe ceu.lua --pre --pre-args="-Iceu\include -DCEU_SRC=%CEU_SRC%" --pre-input="ceu\pico.ceu" --ceu --ceu-line-directives=false --ceu-err-unused=pass --ceu-err-uninitialized=pass --env --env-types=ceu\env\types.h --env-main=ceu\env\main.c --cc --cc-args="-Ic\include -Lc\lib -lm -lmingw32 -lSDL2main -lSDL2 -lSDL2_gfx -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_net" --cc-output=dist\tmp.exe
if ERRORLEVEL 1 goto ERROR

rem md %CEU_DIR%\dist\
%systemroot%\System32\xcopy %CEU_DIR%\ %CEU_DIR%\dist\ /s /e /y

copy dist\*.* %CEU_DIR%\dist\ > NUL
cd %CEU_DIR%\dist\

tmp.exe
if ERRORLEVEL 1 goto ERROR
exit

:ERROR
pause
