@echo off
title Create image for Windows 7/8/10/11 (ISO file)

:createimage

set /p hack=„What system you want to create an ISO file for?”
if %hack%==Windows 7 goto image_create_windows_7

if %hack%==Windows 8 goto image_create_windows_8

if %hack%==Windows 10 goto image_create_windows_10

if %hack%==Windows 11 goto image_create_windows_11

:image_create_windows_7
goto createimage
curl -o "C:\Users\%USERNAME%\Desktop\Windows7.iso" "https://dl.malwarewatch.org/file/windows/Windows-7-x64.iso"

goto createimage

:image_create_windows_8

curl -o  "C:\Users\%USERNAME%\Desktop\Windows8.iso” „https://dl.malwarewatch.org/file/windows/Windows-8.1-x64.iso”

goto createimage

:image_create_windows_10

curl -o  "C:\Users\%USERNAME%\Desktop\Windows10.iso” „https://dl.malwarewatch.org/file/windows/en-us_windows_10_iot_enterprise_version_22h2_x64_dvd_51cc370f.iso”

goto createimage

:image_create_windows_11

curl -o  "C:\Users\%USERNAME%\Desktop\Windows10.iso” „https://archive.org/download/windows-11_20210626/windows%2011.iso”
                                                
                                            



