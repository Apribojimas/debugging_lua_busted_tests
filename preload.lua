local busted_path = "c:/lua/share/lua/5.4/?.lua;c:/lua/share/lua/5.4/?/init.lua;"..
    "c:/lua/luarocks/lua/?.lua;c:/lua/luarocks/lua/?/init.lua;"..
    "c:/lua/share/lua/5.4/busted/modules/files/?.lua;"
package.path=busted_path..package.path;
package.cpath="c:/lua/lib/lua/5.4/?.dll;"..package.cpath;

local k,l,_=pcall(require,'luarocks.loader') _=k and l.add_context('busted','2.0.0-1')
