

TARDIS:AddScreen("Web Browser", {menu=true}, function(self,ext,int,frame,screen)
	if not screen.is3D2D then
		local html = vgui.Create("DHTML",frame)
		html.hpage = [[
		<html>
		<head>
		<style>
			body {
				font-family: arial;
			}
			h1 {
				color: gray;
				text-align: center;
			}
			p {
				text-align: center;
			}
		</style>
		</head>
		<body style="background-color:lightgray">
			<h1>TARDIS Web Browser</h1>
			<p>With this basic browser, you can browse all the internets!</p>
			<p>Still WIP</p>
		</body>
		</html>
		]] 
		html:SetHTML(html.hpage)
		
		
		local ctrls = vgui.Create( "DPanel", frame ) -- Navigation controls
		html:SetSize(frame:GetWide()-10,frame:GetTall()-ctrls:GetTall()-5)
		html:SetPos((frame:GetWide()*0.5)-(html:GetWide()*0.5),(frame:GetTall()*0.52)-(html:GetTall()*0.5))
		ctrls:SetWide( html:GetWide() )
		ctrls:SetPos( (frame:GetWide()*0.5)-(ctrls:GetWide()*0.5),(frame:GetTall()*0.03)-(ctrls:GetTall()*0.5) )
		
		
		local back = vgui.Create("DButton", ctrls)
		back:SetPos(5,1)
		back:SetText("Back")
		back.DoClick = function()
			html:GoBack()
		end
		local fw = vgui.Create("DButton", ctrls)
		fw:SetPos(75,1)
		fw:SetText("Forwards")
		fw.DoClick = function()
			html:GoForward()
		end
		local urlb = vgui.Create("DTextEntry", ctrls)
		urlb:SetPos(145,2)
		urlb:SetWide(400)
		urlb:SetText("")
		urlb.OnEnter = function()
			if urlb:GetText() ~= "" then
				html:OpenURL(urlb:GetText())
			else
				html:SetHTML(html.hpage)
			end
		end
		local go = vgui.Create("DButton", ctrls)
		go:SetPos(550,1)
		go:SetText("Go")
		go.DoClick = function()
			if urlb:GetText() ~= "" then
				html:OpenURL(urlb:GetText())
			else
				html:SetHTML(html.hpage)
			end
		end
		
		
		-- Model panel for GMod Logo
		local mdl = vgui.Create( "DModelPanel", ctrls )
		mdl:SetPos( 550+70, 0 )
		mdl:SetSize( ctrls:GetTall(), ctrls:GetTall() )
		mdl:SetModel( "models/drmatt/tardis/exterior.mdl" )
		mdl:SetCamPos( Vector( 190, 0, 50 ) )
		mdl:SetLookAt( Vector( 0, 0, 50 ) )
		mdl:SetFOV( 40 )

		-- Spin faster
		function mdl:LayoutEntity( ent )
			ent:SetAngles( Angle( 0, RealTime()*100, 0 ) )
		end
		mdl.Think = function()
			if html:IsLoading() then
				mdl:SetColor(Color(255,255,255,255))
			end
			if not html:IsLoading() then
				mdl:SetColor(Color(255,255,255,0))
			end
		end
		
		local cbmarks = {
			{name="Google UK", url="www.google.co.uk"},
			{name="GMod Loading Screen", url="asset://garrysmod/html/loading.html"},
		}
		local bmarks = vgui.Create("DButton", ctrls)
		bmarks:SetPos(550+100,1)
		bmarks:SetText("Bookmarks")
		bmarks.DoClick = function()
			local Menu = vgui.Create("DMenu",bmarks)
			Menu:AddOption( "The Abyss - Home", function() html:OpenURL("abyss.mattjeanes.com") end )
			Menu:AddOption( "Google", function() html:OpenURL("www.google.com") end )
			Menu:AddSpacer()
			for k,v in pairs(cbmarks) do
				if v == "spacer" then
					Menu:AddSpacer()
				else
					Menu:AddOption(v.name,function() 
						html:OpenURL(v.url) urlb:SetText(v.url) 
					end)
				end
			end
			Menu:Open()
		end

		html:MoveBelow( ctrls )
	else
		local no3dlabel = vgui.Create("DLabel",frame)
		no3dlabel:SetText("Cannot use browser in 3D screens")
		no3dlabel:SetFont("TARDIS-Large")
		no3dlabel:SizeToContents()
		no3dlabel:SetPos((frame:GetWide()*0.5)-(no3dlabel:GetWide()*0.5),(frame:GetTall()*0.4)-(no3dlabel:GetTall()*0.5))
		no3dlabel:SetTextColor(Color(100,100,100,255))
		
		local no3dbtn = vgui.Create("DButton",frame)
		no3dbtn:SetText("Pop Screen")
		no3dbtn:SetFont("TARDIS-Med")
		no3dbtn:SetSize(200,80)
		no3dbtn:SetPos((frame:GetWide()*0.5)-(no3dbtn:GetWide()*0.5),(frame:GetTall()*0.55)-(no3dbtn:GetTall()*0.5))
		no3dbtn.DoClick = function(no3dbtn)
			TARDIS:HUDScreen()
		end
		
	end

end )