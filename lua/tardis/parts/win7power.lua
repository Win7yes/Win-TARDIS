//win7flight

local PART={}
PART.ID = "win7power"
PART.Name = "win7power"
PART.Model = "models/wintardis/power.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true
PART.AnimateSpeed = 2.0

if SERVER then
	function PART:Initialize()
		self.power = true
	end
	function PART:Use(ply)
		if ply:IsPlayer() and not (self.exterior:GetData("teleport") or self.exterior:GetData("vortex")) then
			if self.power then
				self.power = false
				self.interior:EmitSound("wintardis/tardis_powerdown.wav",160)
			elseif not self.power then
				self.power = true
				self.interior:EmitSound("wintardis/tardis_powerup.wav",160)
			end
		else
			return
		end
	end
end

TARDIS:AddPart(PART,e)