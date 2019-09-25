local ffi = require ("ffi")
local sdl2sumo = require ('sdl2sumo')

local sdl2 = sdl2sumo['sdl2']

-- What sdl2 are we using here?

ver = ffi.new('SDL_version')
sdl2.SDL_GetVersion(ver)

io.write(string.format("Loaded SDL2 library version: %d %d %d\n",
                       ver.major, ver.minor, ver.patch))

