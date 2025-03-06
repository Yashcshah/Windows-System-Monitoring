# Windows System Monitoring with PowerShell

## 📌 Overview
This PowerShell script automates **Windows system monitoring** by tracking:
- **CPU Usage**
- **Available RAM**
- **Disk Space (C: Drive)**

It logs data into a text file (`performance_log.txt`) and can **send alerts** if CPU or RAM exceed predefined thresholds.

## ⚡ Features
 Logs system performance data automatically  
 Alerts on high CPU usage or low RAM  
 Can be scheduled using **Windows Task Scheduler**  
 (Optional) Sends **email alerts** for critical system warnings  

## 🛠️ Installation & Usage
### **Download & Save the Script**
 **Clone the repository** or download `monitor.ps1` manually:
   git clone https://github.com/Yashcshah/Windows-System-Monitoring.git
   
 **Run the Script**
Open PowerShell as Administrator.

**Navigate to the script directory:**

cd C:\SystemMonitoring

**Run the script:**
.\monitor.ps1

 **Automate with Task Scheduler**

Open Task Scheduler (taskschd.msc).
Click Create Basic Task → Name it System Monitoring.
Choose Daily or Hourly execution.
Select Start a Program → Enter:
Program: powershell.exe
Arguments: -ExecutionPolicy Bypass -File C:\SystemMonitoring\monitor.ps1

Click Finish and ensure the task runs successfully.
