del .\Config\*.bak /S

ruby CreateHtml2.rb

copy .\Config\template\image\*.* .\www\image\
copy .\www\index\index.html .\www\

del .\www\*.bak /S


rem lftp.exe -f .\Config\autoupload.lftp

pause
