-- Win7's Console

local T={}
T.Base="base"
T.Name="Win - Model 3"
T.ID="win-model3"
T.Interior={
	Model="models/win/tardis/console_shell.mdl",
	IdleSound={
		{
			path="drmatt/tardis/interior_idle_loop.wav",
			volume=1	
		},
	},
	Light={
		color=Color(255, 222, 89),
		pos=Vector(0,0,150),
		brightness=5
	},
	Portal={
		pos=Vector(450,0,37),
		ang=Angle(0,180,0),
		width=60,
		height=91
	},
	Fallback={
		pos=Vector(-345,3.35,0),
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
		door=true,
		["win-rotor"]=true,
	},
}

T.Exterior={
	Parts={
		door=true,
	},
}

TARDIS:AddInterior(T)