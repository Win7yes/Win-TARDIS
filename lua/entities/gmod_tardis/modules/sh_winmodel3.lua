if SERVER then

    ENT:AddHook("Initialize","WIN_Model-3",function(self)
        if self.metadata.ID == "win-model3" then
            self:SetBodygroup(5, 1)
            self:SetSkin(1)
        end
    end)

end