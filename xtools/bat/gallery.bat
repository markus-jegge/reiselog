@echo off & setlocal
dir /b *.JPG > gallery

set "datei=gallery"                  
set "xml=%datei%.xml"
set "txt=%datei%.txt"
move "%datei%" "%txt%"

if exist %xml% (
attrib -R %xml% 
del %xml%
)

set "Prefix=   ^<url^>images/"
set "Suffix=^</url^>"

echo ^<?xml version="1.0" encoding="UTF-8"?^> >>"%xml%"
echo ^<gallery frameColor="0xFFFFFF" frameWidth="15" imagePadding="20" displayTime="6" enableRightClickOpen="true"^> >>"%xml%"
echo. >>"%xml%"

for /f "usebackq delims=" %%i in ("%txt%") do (

:AddLines
echo ^<image^> >>"%xml%"
echo %Prefix%%%i%Suffix% >>"%xml%"
echo     ^<caption^>^</caption^> >>"%xml%"
echo     ^<width^>640^</width^> >>"%xml%"
echo     ^<height^>480^</height^> >>"%xml%"
echo ^</image^> >>"%xml%" >>"%xml%"
)

echo. >>"%xml%"
echo ^</gallery^> >>"%xml%"
del %txt%

rem goto :eof
