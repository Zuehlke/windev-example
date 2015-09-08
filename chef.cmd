@echo off
if "%1"=="" goto no_params
echo Updating with configuration %1
echo Setting environment
set OLD_PATH=%PATH%
call scripts\env.cmd
call scripts\chef_check.cmd
subst L: %~dp0.
cd /D L:\
rd /S /Q nodes\
if not exist L:\berks-cookbooks (
  echo Pulling cookbook dependencies
  call berks vendor
  @if errorlevel 1 goto error
)
echo Running Chef
call chef-client -z --config scripts\client.rb -j %1
goto done
:no_params
echo ERROR: Missing parameter
goto done
:error
echo ERROR: Berkshelf failed
:done
echo Resetting environment
cd /D %~dp0
subst L: /D
set PATH=%OLD_PATH%
echo Done
