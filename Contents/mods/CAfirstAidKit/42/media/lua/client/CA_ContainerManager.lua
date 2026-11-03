--Following code is commented out as it is now deemed redundant due to CA_RefreshContainerParents()
--Creates a local copy of the vanilla Perform function
--local _CA_Perform_local = ISDetachItemHotbar.perform

--Function designed to remove the parent of any container that is not attached to a slot on the player
--function ISDetachItemHotbar:perform()

--Performs the original function
--    _CA_Perform_local(self)

--Checks to see if the item is a container and if it is not attached to a slot on the player, then removes its parent
--    if self and instanceof(self.item, "InventoryContainer") then
--        self.item:getItemContainer():setParent(nil)
--    end

-- end

--Function looks at all containers in the player's inventory and removes their parent if they are not attached to a slot on the player.
local function CA_RefreshContainerParents()
    
    --Grabs the player and their inventory
    local player = getPlayer()
    local playerInv = player:getInventory():getItems()

    --Iterates through the player's inventory and checks each item to see if it is a container and if it is not attached to a slot on the player, then removes its parent
    for i=0, playerInv:size()-1 do
        local item = playerInv:get(i)
        if item:getAttachedSlot() == -1 and instanceof(item, "InventoryContainer") and instanceof(item:getItemContainer():getParent(), "IsoPlayer") then
                    item:getItemContainer():setParent(nil)
        end
    end

end
Events.OnRefreshInventoryWindowContainers.Add(CA_RefreshContainerParents)