@echo off & setlocal
dir /b *.JPG > index

set "datei=index"                  
set "xml=%datei%.html"
set "txt=%datei%.txt"
move "%datei%" "%txt%"

if exist %xml% (
attrib -R %xml% 
del %xml%
)

set "Prefix=   ^<img src="
set "Suffix=^ alt="image" title="" width="640" height="480" align="middle"^>"

echo ^<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"^> >>"%xml%"
echo ^<html^> >>"%xml%"
echo ^<head^> >>"%xml%"
echo ^<title^>Reiselog images^</title^> >>"%xml%"
echo ^</head^> >>"%xml%"
echo. >>"%xml%"
echo ^<body bgcolor="#6699FF"^> >>"%xml%"

echo  Reiselog images (c) Markus Jegge >>"%xml%"
echo. >>"%xml%"

for /f "usebackq delims=" %%i in ("%txt%") do (

:AddLines
echo    ^<p^> >>"%xml%"
echo %Prefix%%%i%Suffix% >>"%xml%"
echo    ^<br^> >>"%xml%"
echo         %%i >>"%xml%"
echo    ^</p^> >>"%xml%" 
)

echo. >>"%xml%"

echo ^<a href="index.htm" title="Go Back"^>Go Back^</a^> >>"%xml%"
echo ^<br^> >>"%xml%"
echo ^<br^> >>"%xml%"

echo. >>"%xml%"

echo ^</body^> >>"%xml%"
echo ^</html^> >>"%xml%"
del %txt%

rem goto :eof
