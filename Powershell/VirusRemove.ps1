# Остановить и удалить службы xsv[a-z]
'a'..'z' | ForEach-Object {
    $serviceName = "xsv$_"
    sc.exe stop $serviceName
    sc.exe delete $serviceName
}

# Завершить процессы
taskkill /IM sqhost.exe /F
taskkill /IM rdpclip.exe /F
taskkill /IM rdpcIip.exe /F
taskkill /IM smcard.exe /F

# Удалить файлы
del /f /q C:\Windows\sqhost.exe
del /f /q C:\Windows\dell\sqhost.exe
del /f /q C:\Windows\rdpclip.exe
del /f /q C:\Windows\dell\rdpclip.exe
del /f /q C:\Windows\rdpcIip.exe
del /f /q C:\Windows\dell\rdpcIip.exe
del /f /q C:\Windows\smcard.exe
del /f /q C:\Windows\dell\smcard.exe
del /f /q C:\Windows\netwalker
del /f /q C:\Windows\uplugplay
del /f /q C:\Windows\updates1.7z
del /f /q C:\Windows\updates2.7z
del /f /q C:\Windows\dell\updates1.7z
del /f /q C:\Windows\dell\updates2.7z
del /f /q C:\Windows\updates1
del /f /q C:\Windows\updates2
del /f /q C:\Windows\dell\updates1
del /f /q C:\Windows\dell\updates2

# Удалить папку и её содержимое
rmdir /s /q "C:\Windows\dell"


