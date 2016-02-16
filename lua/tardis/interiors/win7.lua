-- Win7's Console

local T={}
T.Base="base"
T.Name="Win7's Console"
T.ID="win7"
T.Interior={
	Model="models/wintardis/consoleroom.mdl",
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
		pos=Vector(-376,3.35,17.5),
		ang=Angle(0,0,0),
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
			model="models/wintardis/console.mdl"
		},
		door=true,
		win7details={
			pos=Vector(0,0,0)
		},
		win7top={
			pos=Vector(0,0,0)
		},
		win7throttle={
			pos=Vector(0,0,0)
		},
		win7lights={
			pos=Vector(0,0,0)
		},
		win7rotor={
			pos=Vector(0,0,0)
		},
		win7power={
			pos=Vector(0,0,0)
		},
	},
}

T.Exterior={
	Parts={
		door=true,
	},
}

TARDIS:AddInterior(T)