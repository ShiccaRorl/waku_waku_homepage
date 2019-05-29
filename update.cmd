rem del .\Config\*.bak /S

ruby CreateHtml.rb

copy .\Config\template\index.html .\www\

rem del .\www\*.bak /S

rem .\lftp\tools\bin\lftp.exe -f .\Config\autoupload.lftp

pause
