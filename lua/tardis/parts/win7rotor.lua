local PART={}
PART.ID = "win7rotor"
PART.Name = "win7rotor"
PART.Model = "models/wintardis/win7rotor.mdl"
PART.AutoSetup = true
PART.Collision = false
PART.UseTransparencyFix = true

if CLIENT then
	function PART:Initialize()
		self.posepos=0
		self.speed=0.6
	end
	
	function PART:Think()
		local ext=self.exterior
		if ext:GetData("flight") or ext:GetData("teleport") or ext:GetData("vortex") then
			local target=1
			self.posepos=math.Approach(self.posepos,target,FrameTime()*self.speed)
			if self.posepos==target then
				self.posepos=0
			end
			self:SetPoseParameter("switch",self.posepos)
			self:InvalidateBoneCache()
		else
			self.posepos=0
			self:SetPoseParameter("switch",self.posepos)
			self:InvalidateBoneCache()
		end
	end
end

TARDIS:AddPart(PART,e)