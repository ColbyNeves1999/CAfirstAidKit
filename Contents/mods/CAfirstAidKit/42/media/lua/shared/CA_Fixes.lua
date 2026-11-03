-- Function designed to assign a new attachment type to all containers marked as first aid kits so they can be attached to the bottom of the travle backpacks
local function CA_OnModBoot()

    -- Grabs the most recent instance of the game at time of mod loading
    local instance = ScriptManager.instance

    -- Adds "AttachmentType" to containers so they can fit on traveler backpack
    instance:getItem("Base.FirstAidKit"):DoParam("AttachmentType", "Bedroll")
    instance:getItem("Base.FirstAidKit"):DoParam("StaticModel", "LunchBoxMedic_bedroll")
    instance:getItem("Base.FirstAidKit_New"):DoParam("AttachmentType", "Bedroll")
    instance:getItem("Base.FirstAidKit_New"):DoParam("StaticModel", "LunchBoxMedic_bedroll")
    instance:getItem("Base.FirstAidKit_NewPro"):DoParam("AttachmentType", "Bedroll")
    instance:getItem("Base.FirstAidKit_newPro"):DoParam("StaticModel", "LunchBoxMedic_bedroll")
    instance:getItem("Base.FirstAidKit_Camping"):DoParam("AttachmentType", "Bedroll")
    instance:getItem("Base.FirstAidKit"):DoParam("StaticModel", "LunchBoxMedic_bedroll")
    instance:getItem("Base.FirstAidKit_Camping"):DoParam("AttachmentType", "Bedroll")
    instance:getItem("Base.FirstAidKit_Camping"):DoParam("StaticModel", "FirstAidCamping_bedroll")
    instance:getItem("Base.FirstAidKit_Camping_New"):DoParam("AttachmentType", "Bedroll")
    instance:getItem("Base.FirstAidKit_Camping_New"):DoParam("StaticModel", "FirstAidCamping_bedroll")
    instance:getItem("Base.FirstAidKit_Military"):DoParam("AttachmentType", "Bedroll")
    instance:getItem("Base.FirstAidKit_Military"):DoParam("StaticModel", "FirstAidMilitary_bedroll")

end

Events.OnGameBoot.Add(CA_OnModBoot)