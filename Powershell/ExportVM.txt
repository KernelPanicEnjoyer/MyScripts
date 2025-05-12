$BitrixVMName = "VMBitrix7.4.0-CentOS7.6"
$CentOSVMName = "Centos"
$ExportPath = "C:\HyperV_Backups\SITE"
$Date = Get-Date -Format "yyyy-MM-dd_HH-mm"
$FullExportPath = Join-Path -Path $ExportPath -ChildPath $Date

# Создание папки экспорта
if (!(Test-Path -Path $FullExportPath)) {
    New-Item -ItemType Directory -Path $FullExportPath | Out-Null
}

# Отключение и экспорт ВМ CentOS
Stop-VM -Name $CentOSVMName
Export-VM -Name $CentOSVMName -Path $FullExportPath
Start-VM -Name $CentOSVMName

# === Отключение и экспорт BitrixVM ===
Stop-VM -Name $BitrixVMName
Export-VM -Name $BitrixVMName -Path $FullExportPath
Start-VM -Name $BitrixVMName
