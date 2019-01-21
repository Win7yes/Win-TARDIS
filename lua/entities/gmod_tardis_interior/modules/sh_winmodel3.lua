if SERVER then

    ENT:AddHook("Initialize","WIN_Model-3",function(self)
        if self.metadata.ID == "win-model3" then
            local intdoor = TARDIS:GetPart(self,"door")
            timer.Simple(5, function()
                if IsValid(intdoor) then
                    intdoor:SetBodygroup(5, 1)
                end
            end)
        end
    end)

end