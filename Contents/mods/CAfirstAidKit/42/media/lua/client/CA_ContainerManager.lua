-- Function looks at all containers in the player's inventory and removes their parent if they are not attached to a slot on the player.
local function CA_RefreshContainerParents()
    
    -- Grabs the player and their inventory
    local player = getPlayer()
    local playerInv = player:getInventory():getItems()

    -- attaching a container to a slot sets its parent to the player, and detaching never clears it, so the container reports the player’s weight and make the container unusable.

    -- Iterates through the player's inventory and checks each item to see if it is a container and if it is not attached to a slot on the player, then removes its parent if it is player
    for i=0, playerInv:size()-1 do
        local item = playerInv:get(i)
        if item:getAttachedSlot() == -1 and instanceof(item, "InventoryContainer") and instanceof(item:getItemContainer():getParent(), "IsoPlayer") then
                    item:getItemContainer():setParent(nil)
        end
    end

end
Events.OnRefreshInventoryWindowContainers.Add(CA_RefreshContainerParents)