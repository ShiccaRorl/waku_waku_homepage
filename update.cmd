del .\Config\*.bak /S

ruby CreateHtml.rb

copy .\Config\template\image\*.* .\www\image\
copy .\www\index\index.html .\www\

del .\www\*.bak /S


lftp.exe -f .\Config\autoupload.lftp

pause
