rem del .\Config\*.bak /S

ruby CreateHtml.rb

rem copy .\Config\template\image\*.* .\www\image\
copy .\www\index\index.html .\www\

rem del .\www\*.bak /S


rem lftp.exe -f .\Config\autoupload.lftp

pause
