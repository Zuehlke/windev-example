@echo off
@setlocal EnableDelayedExpansion EnableExtensions
set CHEFDK_VERSION=0.9.0
set CHEFDK_URL=https://www.getchef.com/chef/download-chefdk?p=windows^&pv=2008r2^&m=x86_64^&v=%CHEFDK_VERSION%

set CHEFDK_MSI=chefdk-windows-%CHEFDK_VERSION%.msi
set CHEFDK_DIR=%TEMP%\chefdk
set CHEFDK_INSTALLER=%CHEFDK_DIR%\%CHEFDK_MSI%

echo ==^> Creating "%CHEFDK_DIR%"
mkdir "%CHEFDK_DIR%"
pushd "%CHEFDK_DIR%"

echo ==^> Downloading Chef DK to %CHEFDK_INSTALLER%
echo ==^> Downloading %CHEFDK_URL% to %CHEFDK_INSTALLER%
powershell -Command "(New-Object System.Net.WebClient).DownloadFile(\"%CHEFDK_URL%\", '%CHEFDK_INSTALLER%')" <NUL
if not exist "%CHEFDK_INSTALLER%" goto error
goto done
:error
echo Failed to download ChefDK
:done

