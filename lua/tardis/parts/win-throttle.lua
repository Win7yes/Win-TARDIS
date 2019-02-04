local PART={}
PART.ID = "win-throttle"
PART.Name = "win-throttle"
PART.Model = "models/wintardis/tardisthrottle.mdl"
PART.AutoSetup = true
PART.Collision = false
PART.Animate = true
PART.AnimateSpeed = 2.0
	

if SERVER then
	function PART:Use(ply)
		if ply:IsPlayer() then
			self:EmitSound("win/tardis/tardis_throttle.wav")
			if not self.exterior:GetData("vortex") and not self.exterior:GetData("teleport") then
				timer.Create("w7tdmat",0.27,1,function()
					self.exterior:Demat()
				end)
			elseif not self.exterior:GetData("teleport") and self.exterior:GetData("vortex") then
				self.exterior:Mat()
			else return
			end
		else return false end
	end
	function PART:Think()
		if self.exterior:GetData("teleport") or self.exterior:GetData("vortex") then
			self:SetSkin(1)
		else
			self:SetSkin(0)
		end
	end
end

TARDIS:AddPart(PART,e)