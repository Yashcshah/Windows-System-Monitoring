# Windows System Monitoring Script
# Author: Yash Shah
# Description: Monitors CPU, RAM, and Disk usage, logs data, and sends alerts.

# Define log file path
$logFile = "C:\SystemMonitoring\performance_log.txt"

# Create folder if it doesn't exist
if (!(Test-Path "C:\SystemMonitoring")) { 
    New-Item -ItemType Directory -Path "C:\SystemMonitoring"
}

# Get System Performance Data
$cpu = Get-Counter '\Processor(_Total)\% Processor Time' | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue
$ram = (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory / 1024
$disk = Get-PSDrive C | Select-Object Used, Free

# Set Thresholds
$cpuThreshold = 80
$ramThreshold = 500 # in MB

# Log data
$logEntry = "$(Get-Date) - CPU: $([math]::Round($cpu,2))% | RAM: $([math]::Round($ram,2)) MB | Disk Free: $($disk.Free) bytes"
$logEntry | Out-File -Append -FilePath $logFile

# Check for Alerts
if ($cpu -gt $cpuThreshold) {
    Write-Output "WARNING: High CPU usage detected: $([math]::Round($cpu,2))%"
}

if ($ram -lt $ramThreshold) {
    Write-Output "WARNING: Low available RAM: $([math]::Round($ram,2)) MB remaining"
}

Write-Output "System monitoring log updated successfully."

# Optional: Email alert functionality (requires SMTP configuration)
# $smtpServer = "smtp.yourmail.com"
# $from = "monitoring@yourdomain.com"
# $to = "admin@yourdomain.com"
# $subject = "System Alert: High CPU or Low Memory"
# $body = "Warning: CPU Usage is at $([math]::Round($cpu,2))% or RAM is below $([math]::Round($ram,2)) MB. Please investigate."
# Send-MailMessage -To $to -From $from -Subject $subject -Body $body -SmtpServer $smtpServer
