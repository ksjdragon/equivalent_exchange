local modname = "equivalent_exchange:"

-- chest = {
-- 	talisman_check = function(pos)
-- 		local meta = minetest.get_meta(pos)
-- 		local inventory = meta:get_inventory()
-- 		local size = inventory:get_size("container")
-- 		for i = 1, size do
-- 			local stack = inventory:get_stack("from", i)
			
-- 		end
-- }

-- Registering Nodes --

minetest.register_node(modname.."alchemical_chest", {
	description = "Alchemical Chest",
	tiles = {
		"ee_alchemical_chest_top.png",
		"ee_alchemical_chest_bottom.png",
		"ee_alchemical_chest_side.png",
		"ee_alchemical_chest_side.png",
		"ee_alchemical_chest_side.png",
		"ee_alchemical_chest_front.png",
	},
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
			"size[13,13]"..
			"label[0,0;Alchemical Chest]"..
			"list[current_name;container;0,0.5;13,8;]"..
			"list[current_player;main;2.5,9;8,4;]")
		meta:set_string("infotext", "Alchemical Chest")
		local inv = meta:get_inventory()
		inv:set_size("container", 13*8)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	-- on_metadata_inventory_put = function(pos, listname, index, stack, player)
	-- 	chest.talisman_check(pos)
	-- end,
	-- on_metadata_inventory_take = function(pos, listname, index, stack, player) 
	-- 	chest.talisman_check(pos)
	-- end,
	-- on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
	-- 	chest.talisman_check(pos)
	-- end,
	emc = 8987
})

-- Registering Crafts --

minetest.register_craft({
	output = modname.."alchemical_chest",
	recipe = {
		{modname.."low_covalence", modname.."medium_covalence", modname.."high_covalence"},
		{"default:stone", "default:diamond", "default:stone"},
		{"default:steel_ingot", "default:chest", "default:steel_ingot"}
	}
})