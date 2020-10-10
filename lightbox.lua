local mesecon_rules = {
	{x=0,  y=0,  z=-1},
	{x=1,  y=0,  z=0},
	{x=-1, y=0,  z=0},
	{x=0,  y=0,  z=1},
	{x=1,  y=1,  z=0},
	{x=1,  y=-1, z=0},
	{x=-1, y=1,  z=0},
	{x=-1, y=-1, z=0},
	{x=0,  y=1,  z=1},
	{x=0,  y=-1, z=1},
	{x=0,  y=1,  z=-1},
	{x=0,  y=-1, z=-1},
	{x=0,  y=-1, z=0},
}

minetest.register_node("priutils:lightbox_white_off", {
	description = "Test light box. Can be switched manually, or by mesecon.",
    drawtype = "nodebox",
    node_box = {
        type = "regular"
    },
    tiles = {
        "priutils_testbox_up.png",    -- y+
        "priutils_testbox_down.png",  -- y-
        "priutils_testbox_right.png", -- x+
        "priutils_testbox_left.png",  -- x-
        "priutils_testbox_front.png",  -- z+
        "priutils_testbox_back.png", -- z-
    },
	--paramtype = "light",
	--color = "white",
    --[[
	drawtype = "allfaces",
    paramtype = "light",
    description = "Whatever, it's a sweet Node...",
    tiles = { 
        { name="priutils_light_1_black.png", backface_culling=false }
    },
	--]]
    is_ground_content = false,
    groups = {cracky = 3},
    mesecons = {effector = {
        rules = mesecon_rules,
        action_on = function(pos, node)
            minetest.swap_node(pos, { name = "priutils:lightbox_white_on" }) 
        end,
    }},
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        print("Node was right-clicked: " .. dump(node))
        minetest.swap_node(pos, { name = "priutils:lightbox_white_on", param2 = node.param2 })       
    end
})

minetest.register_node("priutils:lightbox_white_on", {
	description = "Test light box. Can be switched manually, or by mesecon.",
    drawtype = "nodebox",
    node_box = {
        type = "regular"
    },
    tiles = {
        "priutils_testbox_up.png",    -- y+
        "priutils_testbox_down.png",  -- y-
        "priutils_testbox_right.png", -- x+
        "priutils_testbox_left.png",  -- x-
        "priutils_testbox_front.png",  -- z+
        "priutils_testbox_back.png", -- z-
    },
	--paramtype = "light",
	--color = "white",
    --[[
	drawtype = "allfaces",
    paramtype = "light",
    description = "Whatever, it's a sweet Node...",
    tiles = { 
        { name="priutils_light_1_black.png", backface_culling=false }
    },
	--]]
    is_ground_content = false,
    light_source = minetest.LIGHT_MAX,
    groups = {cracky = 3, not_in_creative_inventory = 1 },
    mesecons = {effector = {
        rules = mesecon_rules,
        action_off = function(pos, node)
            minetest.swap_node(pos, { name = "priutils:lightbox_white_off" }) 
        end,
    }},
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        print("Node was right-clicked: " .. dump(node))
        minetest.swap_node(pos, { name = "priutils:lightbox_white_off", param2 = node.param2 })       
    end
})

