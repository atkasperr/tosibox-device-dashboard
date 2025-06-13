@echo 1:Reset Ethernet
@echo 2:Reset Wi-fi
@echo 3:Reset Both
@echo
@echo USPS RIS Lanes "1 & 2"
@echo 4: Ethernet 192.168.153.236
@echo 5: WiFi 192.168.153.236
@echo 
@echo USPS RIS Lanes "3 & 4"
@echo 6: Ethernet 192.168.155.236
@echo 7: WiFi 192.168.155.236
@echo off
set /p x=Selection:)

::RESET
if '%x%'=='1' netsh interface ip set address name="Ethernet" dhcp
if '%x%'=='2' netsh interface ip set address name="Wi-Fi" dhcp
if '%x%'=='3' netsh interface ip set address name="Ethernet" dhcp
if '%x%'=='3' netsh interface ip set address name="Wi-Fi" dhcp

if '%x%'=='4' netsh interface ip set address name="Ethernet" static 192.168.153.236 255.255.0.0
if '%x%'=='5' netsh interface ip set address name="Wi-Fi" static 192.168.153.236 255.255.0.0

if '%x%'=='6' netsh interface ip set address name="Ethernet" static 192.168.155.236 255.255.0.0
if '%x%'=='7' netsh interface ip set address name="Wi-Fi" static 192.168.155.236 255.255.0.0
