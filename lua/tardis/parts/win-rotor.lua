local PART={}
PART.ID = "win7rotor"
PART.Name = "win7rotor"
PART.Model = "models/win/tardis/rotor.mdl"
PART.AutoSetup = true
PART.Collision = false
PART.UseTransparencyFix = true

if CLIENT then
	function PART:Initialize()
		self.posepos=0
		self.speed=0.5
		self.target = 0
	end
	
	function PART:Think()
		local ext=self.exterior
		self.posepos=math.Approach(self.posepos,self.target,FrameTime()*self.speed)
		self:SetPoseParameter("switch",self.posepos)
		self:InvalidateBoneCache()
		if ext:GetData("flight") or ext:GetData("teleport") or ext:GetData("vortex") then
			self.target = 1
			if self.posepos==self.target then
				self.posepos=0
			end
		else
			if self.posepos==self.target then
				self.target = 1
			end
		end
	end
end

TARDIS:AddPart(PART,e)