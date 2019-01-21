if SERVER then

    ENT:AddHook("PostPlayerInitialize","WIN_Model-3",function(self)
        if self.metadata.ID == "win-model3" then
            local intdoor = TARDIS:GetPart(self,"door")
            if IsValid(intdoor) then
                intdoor:SetBodygroup(5, 1)
            end
        end
    end)

end