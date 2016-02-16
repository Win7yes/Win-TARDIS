/*
tpdpos = Vector(0,0,0)
tpdang = Angle(0,0,0)

TARDIS:AddControl("toplayerdemat",{
	tpdpos2 = tpdpos,
	tpdang2 = tpdang,
	func=function(self,ply)
		print(tpdpos2)
		print(tpdang2)
		self:Demat(tpdpos2,tpdang2)
		timer.Simple(9, function()
			if self:GetData("vortex") then
				self:Mat()
			end
		end)
	end,
	exterior=true,
	serveronly=true
})


TARDIS:AddScreen("Demat To Player", {menu=false}, function(self,ext,int,frame,screen)

	local label = vgui.Create("DLabel",frame)
	label:SetTextColor(Color(0,0,0))
	label:SetFont("TARDIS-Med")
	label.DoLayout = function(self)
		label:SizeToContents()
		label:SetPos((frame:GetWide()*0.5)-(label:GetWide()*0.5),(frame:GetTall()*0.3)-(label:GetTall()*0.5))
	end
	label:SetText("Enter Player to Demat to")
	label:DoLayout()
	
	local playername = vgui.Create("DTextEntry3D2D", frame)
	playername.is3D2D = screen.is3D2D
	playername.sub3D2D = label:GetText()
	playername:SetFont("TARDIS-Default")
	playername:SetSize( frame:GetWide()*0.5, frame:GetTall()*0.1 )
	playername:SetPos(frame:GetWide()*0.5 - playername:GetWide()*0.5,frame:GetTall()*0.5 - playername:GetTall()*0.5)
	playername.DematToPlayer = function(playername,name)
		for k,v in pairs( player.GetAll() ) do
			local plytd = Player(v:UserID(k))
			//print(plytd:Nick())
			if string.lower( plytd:Nick()) == string.lower(name) then
				print(plytd:Nick())
				tpdpos = plytd:GetPos()
				tpdang = plytd:GetAngles()
				print(tpdpos)
				print(tpdang)
				TARDIS:Control("toplayerdemat")
			break
			else print("nope") end
		end
	end
	playername.OnEnter = function()
		playername:DematToPlayer(playername:GetText())
	end

	
end)*/