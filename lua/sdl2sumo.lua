-- SDL2Sumo - Simple DirectMedia Layer 2-2.0.10, SDL2_image, SDL2_ttf
-- and SDL2_mixer single file Luajit binding
-- Copyright (C) 2019 Paul Furber

-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2.1 of the License, or (at your option) any later version.

-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.

-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

-- Paul Furber
-- paul.furber@gmail.com



local ffi = require("ffi")

-- table of all the SDL2 ffi modules
local sdl2sumo = {}

local debug = false

local function debug_print(msg)
    if debug then
        print (msg)
    end    
end

-- error placeholder function for xpcall
local function load_err()
end

-- if SDL loads, add it to sdlsumo and include its definitions
local ok = xpcall(ffi.load, load_err, 'SDL2')
if ok then
    local sdl2 = ffi.load("SDL2")
    sdl2sumo['sdl2'] = sdl2

    -- SDL 2-2.0.10 definitions
    ffi.cdef[[

        typedef struct SDL_version
        {
            uint8_t major;        /**< major version */
            uint8_t minor;        /**< minor version */
            uint8_t patch;        /**< update version */
        } SDL_version;

        enum {
            SDL_MAJOR_VERSION =  2,
            SDL_MINOR_VERSION =  0,
            SDL_PATCHLEVEL    =  10
        };

        void SDL_GetVersion(SDL_version *version);

    ]]
   
else
   -- SDL2 not found
    assert (nil, "Unable to load SDL2 shared library\n")
end

return sdl2sumo
