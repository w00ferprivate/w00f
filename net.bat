@echo off
: Disable Static IP/Enable DHCP    Remove DNS     Enable NICs
for /f "skip=2 tokens=3*" %%i in ('netsh interface show interface') do (
netsh int ip set address "%%j" dhcp
netsh int ip set dns "%%j" dhcp
netsh interface set interface name="%%j" admin=enabled
)
ipconfig /flushdns

netsh interface ip delete arpcache

certutil -URLCache * delete

netsh int ip reset
netsh int ipv4 reset
netsh int ipv6 reset

netsh winsock reset
pause