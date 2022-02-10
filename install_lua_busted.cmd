@echo off
@rem LUA, LuaRocks & busted (testing framework) installer

@echo ------------------------------------------------------------------------------------------------
@echo  Please execute 'launchdevcmd.bat' before starting install.cmd
@echo  "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\launchdevcmd.bat"
@echo  Preinstall requirements: Windows 10 SDK
@echo ------------------------------------------------------------------------------------------------


@rem Have it installed at a path in the following structure
@rem - rootPath
@rem      |- bin
@rem           |- lua52.exe (Can be simply lua.exe)
@rem           |- lua52.dll (or lua53.dll for Lua 5.3)
@rem      |- lib
@rem           |- lua52.dll
@rem      |- include
@rem           |- lauxlib.h
@rem           |- lua.h
@rem           |- lua.hpp
@rem           |- luaconf.h
@rem           |- lualib.h
@rem      |- luarocks

@rem Install LUA
rmdir /s /q c:\lua
mkdir c:\lua
mkdir c:\lua\bin
mkdir c:\lua\lib

@rem LUA 5.4.2 downloaded "https://sourceforge.net/projects/luabinaries/files/5.4.2/Tools%20Executables/lua-5.4.2_Win32_bin.zip/download"
tar -zxf lua-5.4.2_Win32_bin.zip -C c:\lua\bin
@rem LUA lib downloaded "https://sourceforge.net/projects/luabinaries/files/5.4.2/Windows%20Libraries/Dynamic/lua-5.4.2_Win32_dll16_lib.zip/download"
tar -zxf lua-5.4.2_Win32_dll16_lib.zip -C c:\lua\lib
xcopy /e /y /i /q c:\lua\lib\include c:\lua\include
rmdir /s /q c:\lua\lib\include


@rem Install LuaRocks
mkdir c:\lua\temp
@rem LuaRocks downloaded "https://luarocks.github.io/luarocks/releases/luarocks-3.8.0-win32.zip"
tar -zxf luarocks-3.8.0-win32.zip --strip-components=1 -C c:\lua\temp

mkdir c:\lua\luarocks
pushd c:\lua\temp
call install.bat /F /Q /MSVC /LUA c:\lua /P c:\lua\luarocks /NOADMIN
cd c:\lua\luarocks
rmdir /s /q c:\lua\temp

@rem set PATH=%PATH%;c:\lua\bin;c:\lua\luarocks
@rem set PATHEXT=%PATHEXT%;.LUA


@rem Install busted (testing framework) & LuaCov
@echo ----------------------
@echo  Disconnect from VPN! 
@echo ----------------------

@rem moonscript doesn't support LUA 5.4 yet, developement version
@rem call luarocks.bat install moonscript
call luarocks.bat install moonscript --dev

call luarocks.bat install luacov
call luarocks.bat install busted

popd

@echo --------------------------------------------
@echo  Usage: c:\lua\bin\busted.bat . -c -o gtest
@echo --------------------------------------------
