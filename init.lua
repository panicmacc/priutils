
--
-- Mod init
--

print("Loading PRI Utilities...")

if not pri_mods then
	pri_mods = { description = "Runtime data for Panic Recursive Industries mods." }
end

pri_mods.utils = {}

local modpath = minetest.get_modpath("priutils")

dofile(modpath .. "/common.lua")
dofile(modpath .. "/lightbox.lua")
dofile(modpath .. "/meshbox.lua")

print("PRI Utilities loading complete.")
