-- TARDIS Status

if SERVER then return end
TARDIS:AddScreen("TARDIS Status", {menu=false}, function(self,ext,int,frame,screen)
	
	local tpstatus = vgui.Create("DLabel",frame)
	tpstatus:SetTextColor(Color(0,0,0))
	tpstatus:SetText("Placeholder (Shouldn't be seen)")
	tpstatus:SetFont("TARDIS-Large")
	tpstatus.DoLayout = function(self)
		tpstatus:SizeToContents()
		tpstatus:SetPos((frame:GetWide()*0.5)-(tpstatus:GetWide()*0.5),(frame:GetTall()*0.2)-(tpstatus:GetTall()*0.5))
	end
	tpstatus:DoLayout()
	tpstatus.ChangeSt = function(tpstatus,status)
		tpstatus:SetText("Travel: "..status)
		tpstatus:DoLayout()
	end
	
	tpstatus.Think = function(tpstatus)
		if ext:GetData("vortex") then
			tpstatus:ChangeSt("In Vortex")
		elseif ext:GetData("demat") then
			tpstatus:ChangeSt("Dematerialising...")
		elseif ext:GetData("mat") then
			tpstatus:ChangeSt("Materialising...")
		else
			tpstatus:ChangeSt("Landed")
		end
	end
	
	local flight = vgui.Create("DLabel",frame)
	flight:SetTextColor(Color(0,0,0))
	flight:SetText("Placeholder (Shouldn't be seen)")
	flight:SetFont("TARDIS-Med")
	flight.DoLayout = function(self)
		flight:SizeToContents()
		flight:SetPos((frame:GetWide()*0.5)-(flight:GetWide()*0.3),(frame:GetTall()*0.3)-(flight:GetTall()*0.5))
	end
	flight:DoLayout()
	
	flight.Think = function(flight)
		if ext:GetData("flight") then
			flight:SetText("Flight: On")
		else
			flight:SetText("Flight: Off")
		end
	end
	
	local float = vgui.Create("DLabel",frame)
	float:SetTextColor(Color(0,0,0))
	float:SetText("Placeholder (Shouldn't be seen)")
	float:SetFont("TARDIS-Med")
	float.DoLayout = function(self)
		float:SizeToContents()
		float:SetPos((frame:GetWide()*0.5)-(float:GetWide()*0.3),(frame:GetTall()*0.4)-(float:GetTall()*0.5))
	end
	float:DoLayout()
	
	float.Think = function(float)
		if ext:GetData("float") then
			float:SetText("Float: On")
		else
			float:SetText("Float: Off")
		end
	end
	
	local door = vgui.Create("DLabel",frame)
	door:SetTextColor(Color(0,0,0))
	door:SetText("Placeholder (Shouldn't be seen)")
	door:SetFont("TARDIS-Med")
	door.DoLayout = function(self)
		door:SizeToContents()
		door:SetPos((frame:GetWide()*0.5)-(flight:GetWide()*0.3),(frame:GetTall()*0.5)-(flight:GetTall()*0.5))
	end
	door:DoLayout()
	
	door.Think = function(door)
		if ext:DoorOpen() then
			door:SetText("Door: Open")
		elseif not ext:DoorOpen() then
			door:SetText("Door: Closed")
		elseif ext:CallHook("CanToggleDoor",doorstatus) == false then
			print("cock")
			door:SetText("Door: Locked")
		end
	end
	
	/*local th = vgui.Create("DLabel",frame)
	th:SetTextColor(Color(0,0,0))
	th:SetText("Placeholder (Shouldn't be seen)")
	th:SetFont("TARDIS-Med")
	th.DoLayout = function(self)
		th:SizeToContents()
		th:SetPos((frame:GetWide()*0.5)-(th:GetWide()*0.3),(frame:GetTall()*0.6)-(th:GetTall()*0.5))
	end
	th:DoLayout()
	
	th.Think = function(th)
		th:SetText("Health: "..tostring(int:Health()))
	end*/
	
end )