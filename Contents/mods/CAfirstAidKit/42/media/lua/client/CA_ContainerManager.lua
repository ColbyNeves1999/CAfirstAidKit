local _CA_Perform_local = ISDetachItemHotbar.perform

function ISDetachItemHotbar:perform()

    _CA_Perform_local(self)

    if self and instanceof(self.item, "InventoryContainer") then
        self.item:getItemContainer():setParent(nil)
    end

end