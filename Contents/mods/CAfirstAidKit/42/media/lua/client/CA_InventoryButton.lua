-- Adds buttons for the first aid kits that are attached to the bottom of the travel backpacks so they can be accessed from the inventory window
-- Works for any attached container, so new items can be supported later without changing this file.
-- Baseed on "function ISInventoryPage:refreshBackpacks()" in Contents/media/lua/client/ISInventoryPage.lua of the vanilla game
local function CA_AddAttachedButtons(page, reason)
    -- Only add buttons when the inventory window is being refreshed
    if reason == "buttonsAdded" and page.onCharacter then
        -- Grabs the player and their inventory
        local player = getSpecificPlayer(page.player)
		local it = player:getInventory():getItems()
        -- Iterates through the player's inventory and checks each item to see if it is a container and if it is attached to a slot on the player, then adds a button for it
		for i = 0, it:size()-1 do
			local item = it:get(i)
			if instanceof(item, "InventoryContainer") and item:getAttachedSlot() ~= -1 then
				-- found a container, so create a button for it...
				page:addContainerButton(item:getInventory(), item:getTex(), item:getName(), item:getName())
			end
		end
    end
end
Events.OnRefreshInventoryWindowContainers.Add(CA_AddAttachedButtons)