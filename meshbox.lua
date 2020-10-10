minetest.register_node("priutils:mymeshbox", {
    description = "Mesh based example with UV texture mapping..",
    drawtype = "mesh",
    paramtype = "light",
    paramtype2 = "none",
    mesh = "priutils_meshbox.b3d",
    tiles = { 
        { name="priutils_meshbox.png" }
    },
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.48, -0.48, -0.48, 0.48, 0.48, 0.48},
        },
    },
    is_ground_content = false,
    groups = {cracky = 3},
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        print("Node was right-clicked: " .. dump(node))
    end
})