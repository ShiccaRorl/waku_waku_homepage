del .\contents\*.bak /S

ruby CreateHtml2.rb

rem copy .\Config\template\image\*.* .\www\image\
rem copy .\www\index\index.html .\www\

del .\www\*.bak /S


rem lftp.exe -f .\Config\autoupload.lftp

pause
