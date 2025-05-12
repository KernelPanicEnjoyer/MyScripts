# Пути к папкам с бэкапами
$BackupPaths = @{
    "MAIN" = "E:\MSSQL2008\MAIN"
    "DO"   = "E:\MSSQL2008\DO"
    "ATC"  = "E:\MSSQL2008\ATC"
}

# Папка назначения (Samba Server)
$DestinationRoot = "\\192.168.112.38\Backups"

# Перебираем каждую папку
foreach ($key in $BackupPaths.Keys) {
    $sourcePath = $BackupPaths[$key]
    $destPath = "$DestinationRoot\$key"

    # Проверяем, существует ли папка назначения
    if (!(Test-Path $destPath)) {
        Write-Host "Ошибка: Папка назначения $destPath не существует! Пропускаем..."
        continue
    }

    Write-Host "Поиск файлов в $sourcePath..."

    # Получаем самый свежий файл
    $LatestBackup = Get-ChildItem -Path $sourcePath -File | 
                    Sort-Object LastWriteTime -Descending | 
                    Select-Object -First 1

    if ($LatestBackup -ne $null) {
        Write-Host "Копируем файл: $($LatestBackup.FullName) -> $destPath"
        
        # Копируем файл
        Copy-Item -Path $LatestBackup.FullName -Destination $destPath -Force
    } else {
        Write-Host "Файл резервной копии не найден в $sourcePath!"
    }
}
