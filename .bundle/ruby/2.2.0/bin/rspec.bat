@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"G:\RailsInstaller\Ruby2.2.0\bin\ruby.exe" "G:/CompScience/Projects/Web_Development/the_odin_project/connect-four/.bundle/ruby/2.2.0/bin/rspec" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"G:\RailsInstaller\Ruby2.2.0\bin\ruby.exe" "%~dpn0" %*
