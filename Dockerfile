# escape=`

FROM microsoft/windowsservercore:1709
MAINTAINER Glenn West <gwest@redhat.com>

# copy nodejs to nanoserver
RUN mkdir "C:\nodejs"
ADD ./nodejs/nodejs /nodejs
ADD ./public /public
ADD index.js /index.js
ADD package.json /package.json
ADD runit.bat /runit.bat

# set path
RUN powershell.exe -NoProfile -ExecutionPolicy Bypass -Command `
    $oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path; `
    $newpath = 'C:\nodejs;'+$oldpath; `
    Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newpath;
RUN npm install

EXPOSE 80

#ENTRYPOINT ["c:\nodejs\node.exe c:\index.js;cmd"]
ENTRYPOINT ["runit.bat"]
#ENTRYPOINT ["cmd"]
