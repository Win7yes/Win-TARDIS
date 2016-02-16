local PART={}
PART.ID = "win7rtube"
PART.Name = "win7rtube"
PART.Model = "models/wintardis/consoletube.mdl"
PART.AutoSetup = true
PART.Collision = false

if SERVER then
	function PART:Initialize()
		self:SetMaterial("models/drmatt/tardis/timerotorglass")
		self:SetColor(Color(255,255,255,0))
	end
end


TARDIS:AddPart(PART,e)