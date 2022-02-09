# Debugging Lua Busted tests on Visual Studio
Repository contains instruction steps for succseeding task

Computer enviroment:
OS: Windows 10
MSVC: Microsoft Visual Studio Professional 2019 (Version 16.11.10)
Lua: -

## Install LuaRocks
It is neccessary for installing Lua Busted testing framework
Download LuaRocks and install according instruction -> https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Windows
Using LuaRocks to install packages in the current directory -> https://leafo.net/guides/customizing-the-luarocks-tree.html
If failed look at "Install script"

## Install Busted
Installing instruction -> https://exercism.org/docs/tracks/lua/installation
If failed look at "Install script"

## Install script Lua, LuaRocks, Busted, ...
- Download Lua5.4 & LuaRocks to one directory:
  - LUA 5.4.2 -> https://sourceforge.net/projects/luabinaries/files/5.4.2/Tools%20Executables/lua-5.4.2_Win32_bin.zip/download
  - LUA lib -> https://sourceforge.net/projects/luabinaries/files/5.4.2/Windows%20Libraries/Dynamic/lua-5.4.2_Win32_dll16_lib.zip/download
  - LuaRocks -> https://luarocks.github.io/luarocks/releases/luarocks-3.8.0-win32.zip
- To same directory add 'install_lua_busted.cmd'
- Execute windows command line ("cmd")
- Execute 'launchdevcmd.bat'. Lua extension want's to be compiled. What's not problem on Linux, and totally different story for Windows. Prerequisites Visual Studio contains C++ toolchain and Windows 10 SDK
- Execute 'install_lua_busted.cmd'
- If everything succseeded, you can try execute busted on tests. For example: 'c:\lua\bin\busted.bat . -c -o gtest' in directory with tests
- If you use only one version of Lua, you might want update computer enviroment settings according recomendation

## Visual Studio preparation
- From 'Manage Extensions' install 'BabeLua'. Optional can be added 'c++ debugger extensions for Lua'
- Create new project. Project type: 'Lua Application'
- In project properties update:
  - Lua host exe path: C:\lua\bin\lua54.exe
  - Working path: <test source directory>
  - Command line: <test_spec.lua>
  
## Test preparation
Add to test:
  require 'preload'
  require 'busted.runner'({ standalone = true, output = 'gtest' })
