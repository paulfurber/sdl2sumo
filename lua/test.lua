local ffi = require ("ffi")
local sdl2sumo = require ('sdl2sumo')

local sdl2 = sdl2sumo['sdl2']

-- What sdl2 are we using here?
print (sdl2.SDL_MAJOR_VERSION, sdl2.SDL_MINOR_VERSION, sdl2.SDL_PATCHLEVEL)

