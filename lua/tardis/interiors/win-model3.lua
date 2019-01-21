-- Win7's Console

local T={}
T.Base="base"
T.Name="WIN's Model-3"
T.ID="win-model3"
T.Interior={
	Model="models/win/tardis/console_shell.mdl",
	IdleSound={
		{
			path="drmatt/tardis/interior_idle_loop.wav",
			volume=1	
		},
	},
	Sounds={
		Power={
			On="wintardis/tardis_powerup.wav",
			Off="wintardis/tardis_powerdown.wav"
		}
	},
	Light={
		color=Color(255, 222, 89),
		pos=Vector(0,0,150),
		brightness=5
	},
	Portal={
		pos=Vector(450,0,40),
		ang=Angle(0,180,0),
		width=60,
		height=91
	},
	Fallback={
		pos=Vector(400,0,37),
		ang=Angle(0,0,0)
	},
	Screens={
		{
			pos=Vector(19.6,34.5,104.5),
			ang=Angle(0,180,90),
			width=485+80,
			height=250+125
		},
	},
	Parts={
		console={
			model="models/win/tardis/console.mdl"
		},
		door={
			model="models/brun/extension/doors_int.mdl"
		},
		["win-rotor"]=true,
	},
}

T.Exterior={
	Model="models/brun/extension/tardis.mdl",
	Parts={
		door={
			model="models/brun/extension/doors_ext.mdl",
		},
		vortex={
			model="models/doctorwho1200/mcgann/1996timevortex.mdl",
		},
	},
}

TARDIS:AddInterior(T)