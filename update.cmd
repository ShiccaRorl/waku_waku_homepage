rem del .\Config\*.bak /S

ruby CreateHtml.rb

rem del .\www\*.bak /S

rem .\lftp\tools\bin\lftp.exe -f .\Config\autoupload.lftp

pause
