--[[
	  ______                                      __   _  __
	 /_  __/__  ____ ___  ____  ____  _________ _/ /  | |/ /
	  / / / _ \/ __ `__ \/ __ \/ __ \/ ___/ __ `/ /   |   / 
	 / / /  __/ / / / / / /_/ / /_/ / /  / /_/ / /   /   |  
	/_/  \___/_/ /_/ /_/ .___/\____/_/   \__,_/_/   /_/|_|  
                  /_/                                   
	Aimbot + ESP
	by ProtoType32
	ProtoType32#9772 on Discord
	discord.me/temporal - Join for updates!
	
	Shouldn't you be using the loadstring? Honestly, what exploit has a mouse movement function but NOT loadstring? Just use KRNL or something, dude.
	Unless you're looking at the source code for some other reason, like fixing bugs. If that's the case, please tell me if there's actually a bug that needs fixing.
	
	Have fun!
]]

local API_URL = "https://pastebin.com/raw/tKQBLkNJ"
local DATA = game:GetService("HttpService"):JSONDecode(game:HttpGet(API_URL))

local ver = "v2.0.3"
local deltaX = deltaX or 0.385
local deltaY = deltaX or 0.5
local configFilePath = "Temporal.cfg"

local gameIds = {
	[113491250] = "PhantomForces";
	[1168263273] = "BadBusiness";
	[532222553] = "IslandRoyale";
	[245662005] = "Jailbreak";
	[1008451066] = "DaHood";
}
local gameValues = {
	PhantomForces = {
		deltaX = 0.4;
		deltaY = 0.4;
		aimDeltaX = 0.1845;
		aimDeltaY = 0.1845;
		aimButton = Enum.UserInputType.MouseButton2;
		mouseOffsetX = 0;
		mouseOffsetY = 0;
	};
	IslandRoyale = {
		deltaX = 0.1283;
		deltaY = 0.1171;
		aimDeltaX = 0.0604;
		aimDeltaY = 0.0551;
		aimButton = Enum.UserInputType.MouseButton2;
		mouseOffsetX = 0;
		mouseOffsetY = 0;
	};
	BadBusiness = {
		deltaX = 0.2290;
		deltaY = 0.2290;
		aimDeltaX = 0.1204;
		aimDeltaY = 0.1204;
		aimButton = Enum.UserInputType.MouseButton2;
		mouseOffsetX = 0;
		mouseOffsetY = 0;
	};
	Jailbreak = {
		deltaX = 0.2699;
		deltaY = 0.3596;
		aimDeltaX = 0.2699;
		aimDeltaY = 0.3596;
		aimButton = Enum.UserInputType.MouseButton2;
		mouseOffsetX = 0;
		mouseOffsetY = 0;
	};
	DaHood = {
		deltaX = 0.27 * 2;
		deltaY = 0.36 * 2;
		aimDeltaX = 0.27;
		aimDeltaY = 0.36;
		aimButton = Enum.UserInputType.MouseButton2;
		mouseOffsetX = 0;
		mouseOffsetY = 0;
	};
}
local detectedGame = gameIds[game.GameId]
local values = gameValues[detectedGame or "nglsdjifnglskdjfngkjd"] or {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HTTP = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local isBB = detectedGame == "BadBusiness"
local tshell
if isBB then
	tshell = require(ReplicatedStorage:WaitForChild("TS")) -- thanks BB :3
end

local gui = game:GetObjects("rbxassetid://7573366697")[1]
gui.Parent = game.CoreGui
local intro = gui.Intro
local chamTemplate = gui.ChamTemplate
local chams = gui.Chams
local infos = gui.InfoBillboards

-- modules were being annoying so have these giant minified ones
local TransformGui = (function() local a=game:GetService("UserInputService")local b=game:GetService("Players").LocalPlayer:GetMouse()local c={["Y"]="rbxasset://textures/StudioUIEditor/icon_resize4.png",["X"]="rbxasset://textures/StudioUIEditor/icon_resize2.png",["CornerTLBR"]="rbxasset://textures/StudioUIEditor/icon_resize3.png",["CornerBLTR"]="rbxasset://textures/StudioUIEditor/icon_resize1.png"}local d={}d.__index=d;function isHovering(e)local f=e.AbsoluteSize;local g=e.AbsolutePosition;local h=a:GetMouseLocation()return h.X>=g.X and h.X<=g.X+f.X and h.Y>=g.Y and h.Y<=g.Y+f.Y end;function d.new(i,j,k)local self=setmetatable({},d)self.guiObject=i;self.isTopBarEnabled=k or true;self.resizing=false;self.dragging=false;self._onResizeBeginEvent=Instance.new("BindableEvent")self._onResizeChangedEvent=Instance.new("BindableEvent")self._onResizeEndedEvent=Instance.new("BindableEvent")self._onDragBeginEvent=Instance.new("BindableEvent")self._onDragChangedEvent=Instance.new("BindableEvent")self._onDragEndedEvent=Instance.new("BindableEvent")self.onResizeBegin=self._onResizeBeginEvent.Event;self.onResizeChanged=self._onResizeChangedEvent.Event;self.onResizeEnded=self._onResizeEndedEvent.Event;self.onDragBegin=self._onDragBeginEvent.Event;self.onDragChanged=self._onDragChangedEvent.Event;self.onDragEnded=self._onDragEndedEvent.Event;self:applyFrameProperties(j)return self end;function d:applyFrameProperties(l)if l=="Resize"then self:makeResizeable()elseif l=="Drag"then self:makeDraggable()elseif l=="ResizeDrag"then self:makeResizeable()self:makeDraggable()end end;local m={}function d:makeDraggable()local n=false;local o=nil;m[self]=self.guiObject;self.guiObject.InputBegan:Connect(function(p)if self.resizing then return end;local q=nil;for r,e in pairs(m)do if isHovering(e)and(not q or e.ZIndex>q.ZIndex)then q=e end end;if q~=self.guiObject then return end;if p.UserInputType==Enum.UserInputType.MouseButton1 or p.UserInputType==Enum.UserInputType.Touch then n=true;local s=a:GetMouseLocation()o=self.guiObject.Position-UDim2.new(0,s.X,0,s.Y)self.dragging=true;self._onDragBeginEvent:Fire()end end)a.InputChanged:Connect(function(p)if self.resizing then return end;if n and(p.UserInputType==Enum.UserInputType.MouseMovement or p.UserInputType==Enum.UserInputType.Touch)then local s=a:GetMouseLocation()self.guiObject.Position=UDim2.new(0,s.X,0,s.Y)+o;self._onDragChangedEvent:Fire()end end)self.guiObject.InputEnded:Connect(function(p)if(p.UserInputType==Enum.UserInputType.MouseButton1 or p.UserInputType==Enum.UserInputType.Touch)and self.dragging then n=false;o=nil;self.dragging=false;self._onDragEndedEvent:Fire()end end)end;function inRange(t,u,v)return t>u-v/2 and t<u+v/2 end;function d:makeResizeable()local n=false;local w=Vector2.new(0,0)local x={{false,false},{false,false}}local y=false;local z=false;local A=false;local B=false;local C=b.Icon;a.InputBegan:Connect(function(p)if p.UserInputType==Enum.UserInputType.MouseButton1 or p.UserInputType==Enum.UserInputType.Touch then local s=a:GetMouseLocation()if self.isTopBarEnabled then s=s-Vector2.new(0,36)end;local D=self.guiObject.AbsolutePosition;local E=self.guiObject.AbsoluteSize;local F=D+E;z=inRange(s.X,D.X+E.X,10)and inRange(s.Y,D.Y+E.Y/2,E.Y+10)y=not z and inRange(s.X,D.X,10)and inRange(s.Y,D.Y+E.Y/2,E.Y+10)B=inRange(s.Y,D.Y+E.Y,10)and inRange(s.X,D.X+E.X/2,E.X+10)A=inRange(s.Y,D.Y,10)and inRange(s.X,D.X+E.X/2,E.X+10)if B or A or z or y then b.Icon=(z or y)and not(B or A)and c.X or(B or A)and not(z or y)and c.Y or(A and y or B and z)and c.CornerTLBR or(B and y or A and z)and c.CornerBLTR;self.resizing=true;n=true;w=s;self._onResizeBeginEvent:Fire()end end end)a.InputChanged:Connect(function(p)if n and(p.UserInputType==Enum.UserInputType.MouseMovement or p.UserInputType==Enum.UserInputType.Touch)then local s=a:GetMouseLocation()if self.isTopBarEnabled then s=s-Vector2.new(0,36)end;if z then local o=s-w;self.guiObject.Size=self.guiObject.Size+UDim2.new(0,o.X,0,0)elseif y then local o=s-w;self.guiObject.Size=self.guiObject.Size-UDim2.new(0,o.X,0,0)self.guiObject.Position=self.guiObject.Position+UDim2.new(0,o.X,0,0)end;if A then local o=s-w;self.guiObject.Size=self.guiObject.Size-UDim2.new(0,0,0,o.Y)self.guiObject.Position=self.guiObject.Position+UDim2.new(0,0,0,o.Y)elseif B then local o=s-w;self.guiObject.Size=self.guiObject.Size+UDim2.new(0,0,0,o.Y)end;w=s;self._onResizeChangedEvent:Fire()end end)a.InputEnded:Connect(function(p)if(p.UserInputType==Enum.UserInputType.MouseButton1 or p.UserInputType==Enum.UserInputType.Touch)and self.resizing then n=false;y=false;z=false;A=false;B=false;self.resizing=false;b.Icon=C;self._onResizeEndedEvent:Fire()end end)end;return d end)()
local Base64 = (function () local a={}a.CharSet="6".."O".."w".."y".."B".."X".."A".."U".."D".."b".."Q".."q".."S".."M".."G".."g".."m".."a".."n".."P".."v".."4".."I".."8".."+".."z".."r".."d".."Y".."J".."9".."x".."i".."R".."Z".."j".."W".."F".."H".."t".."N".."5".."l".."1".."e".."7".."L".."s".."p".."V".."u".."c".."C".."K".."f".."k".."3".."2".."E".."o".."T".."0".."h".."/"function a.BitsToNum(b)assert(typeof(b)=="string","Arg1: Expected string, got "..typeof(b))local c=0;local d=1;for e=1,#b do local f=string.sub(b,-e,-e)if f=="1"then c=c+d end;d=d*2 end;return c end;function a.NumToBits(g,h)assert(typeof(g)=="number","Arg1: Expected number, got "..typeof(g))assert(typeof(h)=="number"or typeof(h)=="nil","Arg2: Expected number, got "..typeof(h))if not h then h=math.floor(math.log(g,2)+1)end;local c=""for e=h,1,-1 do c=c..tostring(bit32.extract(g,e-1,1))end;return c end;function a.CharToNum(i)assert(typeof(i)=="string","Arg1: Expected string, got "..typeof(i))assert(#i==1,"Arg1: String must be of length 1, got string of length "..#i)for e=1,64 do if string.sub(a.CharSet,e,e)==i then return e-1 end end;return nil end;function a.NumToChar(g)g=math.floor(g)assert(typeof(g)=="number","Arg1: Expected number, got "..typeof(g))assert(g>=0 and g<=63,"Arg1: Expected number between 0 and 63 (inclusive), got "..tostring(g))return string.sub(a.CharSet,g+1,g+1)end;function a.EncodeBytes(j,k)assert(typeof(j)=="table","Arg1: Expected table, got "..typeof(j))assert(typeof(k)=="boolean"or typeof(k)=="nil","Arg2: Expected boolean, got "..typeof(k))local c=""local b=""for e=1,#j do b=b..a.NumToBits(j[e],8)end;b=b..string.rep("0",6-#b%6)for e=1,#b,6 do c=c..a.NumToChar(a.BitsToNum(string.sub(b,e,e+5)))end;if k then c=c..string.rep("=",4-#c%4)end;return c end;function a.EncodeString(j,k)assert(typeof(j)=="string","Arg1: Expected string, got "..typeof(j))assert(typeof(k)=="boolean"or typeof(k)=="nil","Arg2: Expected boolean, got "..typeof(k))local l={}for e=1,#j do l[e]=string.byte(string.sub(j,e,e))end;return a.EncodeBytes(l,k)end;function a.Decode(j)assert(typeof(j)=="string","Arg1: Expected string, got "..typeof(j))local b=""local c={}for e=1,#j do local g=a.CharToNum(string.sub(j,e,e))if g then b=b..a.NumToBits(g,6)end end;for e=1,math.floor(#b/8)do c[e]=a.BitsToNum(string.sub(b,e*8-8+1,e*8))end;return c end;function a.BytesToString(l)assert(typeof(l)=="table","Arg1: Expected table, got "..typeof(l))return string.char(table.unpack(l))end;function a.DecodeToString(j)return a.BytesToString(a.Decode(j))end;return a end)()



-- deep copy a table
function DeepCopy (orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in next, orig, nil do
			copy[DeepCopy(orig_key)] = DeepCopy(orig_value)
		end
		setmetatable(copy, DeepCopy(getmetatable(orig)))
	else --// number, string, boolean, etc
		copy = orig
	end
	return copy
end

local defaultConfig = {
	keybinds = {
		aim1 = "MouseButton2";
		aim2 = "MouseButton3";
		toggleGui = "Home";
		toggleAimbot = "Unbound";
		toggleESP = "Unbound";
	};
	aimbot = {
		enabled = true;
		ignoreTeam = false;
		prediction = 3;
		showRange = true;
		range = 150;
		aimPart1 = "Head";
		aimPart2 = "HumanoidRootPart";
		mouseOffsetX = 0;
		mouseOffsetY = 0;
	};
	esp = {
		enabled = false;
		chamsEnabled = true;
		infoEnabled = true;
		ffa = false;
		showFriendlies = false;
		showTeamColor = false;
		chamsTransparency = 0.5;
	};
}
local config = DeepCopy(defaultConfig)
local guiVisible = true

local tips = {
	menuButtons = {
		Info = "Information about Temporal X.";
		Keybinds = "Change keybinds.";
		AimbotSettings = "Change settings for the aimbot.";
		ESPSettings = "Change settings for the ESP.";
		Exit = "Exit Temporal X and terminate the script."
	};
	keybinds = {
		aim1 = "Button to start targeting players with the aimbot.";
		aim2 = "Alternate button to start targeting players with the aimbot.";
		toggleGui = "Button to toggle the visiblity of the GUI.";
		toggleAimbot = "Button to toggle the aimbot. Equivalent to 'Enabled' in the aimbot settings.";
		toggleESP = "Button to toggle the ESP. Equivalent to 'Enabled' in the ESP settings."
	};
	aimbot = {
		enabled = "Whether or not the aimbot is enabled.";
		ignoreTeam = "If enabled, the aimbot will target everyone regardless of their team.";
		prediction = "The amount of frames ahead to predict a target's movement.";
		showRange = "Enables / disables the visiblity of the range circle.";
		range = "The maximum distance (in pixels) from the mouse for the aimbot to look in for targets.";
		aimPart1 = "The aimbot will search for parts inside a character with this name first.";
		aimPart2 = "If the primary aim part isn't found, then the aimbot will look for one with this name instead.";
		mouseOffsetX = "The X offset (in pixels) for the mouse position. The higher the number, the more towards the right the offset point is.";
		mouseOffsetY = "The Y offset (in pixels) for the mouse position. The higher the number, the lower the offset point is.";
	};
	esp = {
		enabled = "Whether or not the ESP is enabled.";
		chamsEnabled = "Displays bright colors on the surface of players' characters which can be seen through walls.";
		infoEnabled = "Displays text above players' heads that displays information like heath, distance, etc.";
		ffa = "Treat every player as an enemy, regardless of team.";
		showFriendlies = "Displays ESP on friendly players as well.";
		showTeamColor = "Displays players' ESP color as their team color instead of red or green.";
		chamsTransparency = "The transparency of chams. 0 = Fully visible, 1 = Fully invisible.";
	};
}

local gameSettings = UserSettings():GetService("UserGameSettings")
local camera = workspace.CurrentCamera
local playerGui = player.PlayerGui
local mouse = player:GetMouse()
local mouseX = mouse.X
local mouseY = mouse.Y + 36
local internalMousePos = nil
local internalOffsetX = 0
local internalOffsetY = 0
local windowZ = 1
local scriptTerminated = false
local aiming1 = false
local aiming2 = false
local aiming = false
local target = nil

local rad = math.rad
local deg = math.deg
local clamp = math.clamp
local abs = math.abs
local floor = math.floor

local keybindFuncs = {
	aim1 = function (isBegin)
		aiming1 = isBegin
	end;
	aim2 = function (isBegin)
		aiming2 = isBegin
	end;
	toggleGui = function (isBegin)
		if isBegin then
			guiVisible = not guiVisible
			ClickSound()
		end
	end;
	toggleAimbot = function (isBegin)
		if isBegin then
			config.aimbot.enabled = not config.aimbot.enabled
			ClickSound()
		end
	end;
	toggleESP = function (isBegin)
		if isBegin then
			config.esp.enabled = not config.esp.enabled
			ClickSound()
		end
	end;
}


function Tween (...)
	local tween = TweenService:Create(...)
	tween:Play()
	return tween
end

-- wrapper function for mousemoverel / Input.MoveMouse
function MoveMouse (x, y)
	if not mousemoverel then
		if Input then
			Input.MoveMouse(x, y)
		end
	else
		mousemoverel(x, y)
	end
end

-- returns the mouse sensitivity
function GetMouseSens ()
	return gameSettings.MouseSensitivity
end

-- rotates the camera by a given angle (in degrees)
function RotateCamera (x, y)
	local sens = GetMouseSens()

	local _deltaX = deltaX
	local _deltaY = deltaY

	if gameAiming then
		_deltaX = aimDeltaX
		_deltaY = aimDeltaY
	end

	local pixelX = x / sens / _deltaX / UserInputService.MouseDeltaSensitivity
	local pixelY = y / sens / _deltaY / UserInputService.MouseDeltaSensitivity

	MoveMouse(pixelY, pixelX)
end

-- automatically centers the mouse on a certain world position
function LookAt (pos)
	local ray = camera:ViewportPointToRay(mouseX, mouseY)
	local tX, tY, tZ = CFrame.new(camera.CFrame.Position, pos):ToOrientation()
	local cX, cY, cZ = CFrame.new(camera.CFrame.Position, camera.CFrame.Position + ray.Direction):ToOrientation()

	local xDiff = deg(cX) - deg(tX)
	local yDiff = deg(cY) - deg(tY)
	if yDiff > 180 then
		yDiff -= 360
	elseif yDiff < -180 then
		yDiff += 360
	end
	local dampening = 0.9
	RotateCamera(xDiff * dampening, yDiff * dampening)
end

-- updates variables
function UpdateValues (deltaTime)
	deltaTime = deltaTime or 1 / 60

	aiming = aiming1 or aiming2
	camera = workspace.CurrentCamera
	mouse = player:GetMouse()
	if not internalMousePos then
		mouseX = mouse.X +      config.aimbot.mouseOffsetX + internalOffsetX
		mouseY = mouse.Y + 36 + config.aimbot.mouseOffsetY + internalOffsetY
	else
		mouseX = internalMousePos.X
		mouseY = internalMousePos.Y
	end
end

function HoverSound ()
	gui.HoverSound:Play()
end

function ClickSound ()
	gui.ClickSound:Play()
end

function ReleaseSound ()
	gui.ReleaseSound:Play()
end

local draggables = {}
function MakeDraggable (gui)
	table.insert(draggables, gui)
	local tGui = TransformGui.new(gui, false)
	tGui:makeDraggable()
	tGui.onDragBegin:Connect(function()
		windowZ += 1
		gui.ZIndex = windowZ
		HoverSound()
	end)
	tGui.onDragEnded:Connect(function()
		ReleaseSound()
		FitGui(gui)
	end)
	FitGui(gui)
end

function MakeButton (button, callback)
	button.MouseEnter:Connect(function()
		HoverSound()
	end)
	button.Activated:Connect(function()
		ClickSound()
		if callback then
			callback()
		end
	end)
end

local elements = {}
function ShowWindow (window)
	elements[window] = elements[window] or {}
	local self = elements[window]
	self.size = self.size or window.Size

	if self.hidden == false then
		return
	end
	self.hidden = false

	if self.activeTween then
		self.activeTween:Cancel()
		self.activeTween = nil
	end

	window:SetAttribute("Visible", true)
	window.Size = UDim2.fromScale(0, 0)

	windowZ += 1
	window.ZIndex = windowZ

	local id = HTTP:GenerateGUID(false)
	self.id = id

	local t = Tween(window, TweenInfo.new(0.25), {Size = self.size})
	self.activeTween = t

	coroutine.wrap(function()
		t.Completed:Wait()

		if self.id == id then
			self.activeTween = nil
		end
	end)()
end

function HideWindow (window)
	elements[window] = elements[window] or {}
	local self = elements[window] or {}
	self.size = self.size or window.Size

	if self.hidden then
		return
	end
	self.hidden = true

	if self.activeTween then
		self.activeTween:Cancel()
		self.activeTween = nil
	end

	local id = HTTP:GenerateGUID(false)
	self.id = id

	local t = Tween(window, TweenInfo.new(0.25), {Size = UDim2.fromScale(0, 0)})
	self.activeTween = t

	coroutine.wrap(function()
		t.Completed:Wait()

		if self.id == id then
			self.activeTween = nil
			window:SetAttribute("Visible", false)
		end
	end)()
end

function MakeCloseable (window)
	MakeButton(window.Close, function()
		HideWindow(window)
	end)
end

function FitGui (window)
	local screenSize = gui.AbsoluteSize
	local wSize = window.AbsoluteSize
	local pos = window.AbsolutePosition + (wSize * 0.5)
	local uPos = window.Position

	if pos.X < 0 then
		window.Position = UDim2.new(uPos.X.Scale, -(screenSize.X * uPos.X.Scale), uPos.Y.Scale, uPos.Y.Offset)
	elseif pos.X >= screenSize.X then
		window.Position = UDim2.new(uPos.X.Scale, screenSize.X * uPos.X.Scale, uPos.Y.Scale, uPos.Y.Offset)
	end

	if pos.Y < 0 then
		window.Position = UDim2.new(uPos.X.Scale, uPos.X.Offset, uPos.Y.Scale, -(screenSize.Y * uPos.Y.Scale))
	elseif pos.Y >= screenSize.Y then
		window.Position = UDim2.new(uPos.X.Scale, uPos.X.Offset, uPos.Y.Scale, screenSize.Y * uPos.Y.Scale)
	end
end

function IsHovering (guiObj)
	local s = guiObj.AbsoluteSize
	local p = guiObj.AbsolutePosition
	local m = Vector2.new(mouse.X, mouse.Y)

	return
		m.X >= p.X and
		m.X <= p.X + s.X and
		m.Y >= p.Y and
		m.Y <= p.Y + s.Y
end

function Tips (tipTable, buttonContainer, tipLabel, default)
	tipLabel.Text = default or ""
	for i, button in pairs(buttonContainer:GetChildren()) do
		local tipText = tipTable[button.Name]
		if tipText then
			if IsHovering(button) then
				tipLabel.Text = tipText
			end
		end
	end
end

local bindButtons = {}
function CreateBindButton (frame)
	local new = {}
	local prototype = {}

	new._frame = frame
	new._guiButton = frame.Button
	new._isBinding = false
	new._lastTimeBound = 0

	new._bindChangedEvent = Instance.new("BindableEvent")
	new.OnBindChanged = new._bindChangedEvent.Event

	function prototype:_updateDisplay ()
		if self:IsBinding () then
			self._guiButton.Text = "[ Press Any Button ]"
		else
			self._guiButton.Text = tostring(self._bind)
		end
	end

	function prototype:IsBinding ()
		return self._isBinding
	end

	function prototype:SetBind (bindName)
		self._bind = bindName
		self:_updateDisplay()
	end

	function prototype:GetBind ()
		return self._bind
	end

	setmetatable(new, {__index = prototype})

	new:SetBind(frame.Button.Text)
	MakeButton(frame.Button, function()
		if not new._isBinding and tick() - new._lastTimeBound > 0.5 then
			new._isBinding = true
			new:_updateDisplay()
			local input = UserInputService.InputBegan:Wait()

			if input.UserInputType == Enum.UserInputType.Keyboard then
				new:SetBind(input.KeyCode.Name)
			elseif input.UserInputType.Name:sub(1, 11) == "MouseButton" then
				if IsHovering(frame.Button) and input.UserInputType == Enum.UserInputType.MouseButton1 then
					new:SetBind("Unbound")
					new._isBinding = false
					new:_updateDisplay()
					new._lastTimeBound = tick()
					new._bindChangedEvent:Fire(new:GetBind())
					return
				end
				new:SetBind(input.UserInputType.Name)
			else
				new._isBinding = false
				new:_updateDisplay()
				return
			end

			new._isBinding = false
			new:_updateDisplay()
			new._lastTimeBound = tick()
			new._bindChangedEvent:Fire(new:GetBind())
		end
	end)

	table.insert(bindButtons, new)
	return new
end

function CreateToggleButton (frame)
	local new = {}
	local prototype = {}

	new._frame = frame
	new._guiButton = frame.Button
	new._state = false

	new._stateChangedEvent = Instance.new("BindableEvent")
	new.OnStateChanged = new._stateChangedEvent.Event

	function prototype:_updateDisplay ()
		if self:GetState() then
			frame.Button.Text = "On"
			frame.Button.TextColor3 = Color3.fromRGB(103, 103, 103)
			frame.Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		else
			frame.Button.Text = "Off"
			frame.Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			frame.Button.BackgroundColor3 = Color3.fromRGB(103, 103, 103)
		end
	end

	function prototype:SetState (state)
		self._state = state
		self:_updateDisplay()
	end

	function prototype:GetState ()
		return self._state
	end

	setmetatable(new, {__index = prototype})
	MakeButton(frame.Button, function()
		new:SetState(not new:GetState())
		new._stateChangedEvent:Fire(new:GetState())
	end)

	return new
end

function CreateTextInput (frame, validateFunc)
	validateFunc = validateFunc or (function (...) return ... end)

	local new = {}
	local prototype = {}

	new._frame = frame
	new._textBox = frame.Input
	new._value = "N/A"
	new._validateFunc = validateFunc

	new._valueChangedEvent = Instance.new("BindableEvent")
	new.OnValueChanged = new._valueChangedEvent.Event

	function prototype:_updateDisplay ()
		frame.Input.Text = tostring(self:GetValue())
	end

	function prototype:SetValue (value)
		self._value = tostring(value)
		self:_updateDisplay()
	end

	function prototype:GetValue ()
		return self._value
	end

	setmetatable(new, {__index = prototype})

	frame.Input.FocusLost:Connect(function(enterPressed)
		local validated = validateFunc(frame.Input.Text)
		if validated then
			new:SetValue(tostring(validated))
		else
			frame.Input.Text = new:GetValue()
		end
		ClickSound()
		new._valueChangedEvent:Fire(new:GetValue())
	end)

	return new
end

function InitSettingsWindow (buttonContainer, settingsTable, defaultSettingsTable)
	for i, frame in pairs(buttonContainer:GetChildren()) do
		if frame:IsA("Frame") then
			local val = defaultSettingsTable[frame.Name]
			if typeof(val) == "boolean" then
				local toggleButton = CreateToggleButton(frame)
				toggleButton:SetState(settingsTable[frame.Name])
				toggleButton.OnStateChanged:Connect(function(state)
					settingsTable[frame.Name] = state
				end)
			elseif typeof(val) == "string" or typeof(val) == "number" then
				local f
				if typeof(val) == "number" then
					f = tonumber
				end
				local input = CreateTextInput(frame, f)
				input:SetValue(settingsTable[frame.Name])
				input.OnValueChanged:Connect(function(value)
					settingsTable[frame.Name] = tonumber(value) or 0
				end)
			end
		end
	end
end

function SaveSettings ()
	pcall(writefile, configFilePath, Base64.EncodeString(HTTP:JSONEncode(config)))
end

function LoadSettings ()
	local success, data = pcall(function()
		return readfile(configFilePath)
	end)
	if success then
		local loaded = HTTP:JSONDecode(Base64.DecodeToString(data))
		for i, v in pairs(loaded) do
			for ii, vv in pairs(v) do
				config[i] = config[i] or {}
				config[i][ii] = vv
			end
		end
	end
end

-- esp functions

function ChamsEnabled ()
	return config.esp.enabled and config.esp.chamsEnabled
end

function InfoEnabled ()
	return config.esp.enabled and config.esp.infoEnabled
end

function GetInfoString (plr)
	local char = GetChar(plr)
	if char then
		local health
		local maxHealth = 100
		if isBB then
			health = 150
			if char.Parent:FindFirstChild("Health") then
				health = char.Parent.Health.Value
			end
			maxHealth = 150
		else
			if char:FindFirstChild("Humanoid") then
				health = char.Humanoid.Health
				maxHealth = char.Humanoid.MaxHealth
			end
		end

		local pos = GetPlayerPos(plr) or camera.CFrame.Position
		local dist = floor((pos - camera.CFrame.Position).Magnitude)
		if health then
			return plr.Name .. "\n" .. dist .. " studs [" .. floor(health) .. "/" .. floor(maxHealth) .. "]"
		else
			return plr.Name .. "\n" .. dist .. " studs"
		end
	else
		return plr.Name .. "\n(NO CHARACTER DETECTED)"
	end
end

function IsEnemyESP (plr)
	if not isBB then
		return plr.Team ~= player.Team or config.esp.ffa
	else
		return tshell.Teams:GetPlayerTeam(plr) ~= tshell.Teams:GetPlayerTeam(player) or config.esp.ffa
	end
end

function IsVisibleESP (plr)
	return (config.esp.showFriendlies or IsEnemyESP(plr)) and not IsDead(plr)
end

function GetColor (plr)
	if config.esp.showTeamColor then
		return plr.TeamColor.Color
	elseif IsEnemyESP(plr) then
		return Color3.new(1, 0, 0) -- enemy color
	else
		return Color3.new(0, 1, 0) -- friendly color
	end
end

local infoTable = {}

function UpdateInfos ()
	if InfoEnabled() then
		for i, plr in pairs(Players:GetPlayers()) do
			if not infoTable[plr.UserId] and GetChar(plr) and IsVisibleESP(plr) then
				ApplyInfo(plr)
			end
		end
		for id, billboard in pairs(infoTable) do
			local plr = Players:GetPlayerByUserId(id)
			if not plr or not IsVisibleESP(plr) or not billboard.Parent then
				billboard:Destroy()
				infoTable[id] = nil
				continue
			end

			local char = GetChar(plr)
			local part = billboard.Adornee
			if not part or not part.Parent or (part.Name ~= config.aimbot.aimPart1 and part.Name ~= config.aimbot.aimPart2) or (char and not part:IsDescendantOf(char)) then
				part = GetPlayerPosPart(plr)
			end
			local color = GetColor(plr)
			billboard.Label.TextColor3 = color or Color3.new(1, 0, 1)
			billboard.Label.Text = tostring(GetInfoString(plr))

			if part then
				billboard.Enabled = true
				billboard.Adornee = part
			else
				billboard.Enabled = false
			end
			RunService.RenderStepped:Wait()
			RunService.RenderStepped:Wait()
		end
	else
		infos:ClearAllChildren()
		infoTable = {}
	end
end

function ApplyInfo (plr)
	if plr == player then return end
	infoTable[plr.UserId] = infoTable[plr.UserId] or gui.InfoTemplate:Clone()
	local billboard = infoTable[plr.UserId]
	billboard.Parent = infos
	billboard.Name = plr.Name
end

local chamTable = {}

function UpdateChams ()
	if ChamsEnabled() then
		for i, plr in pairs(Players:GetPlayers()) do
			if not chamTable[plr.UserId] and GetChar(plr) and IsVisibleESP(plr) then
				ApplyChams(plr)
			end
		end
		for id, arr in pairs(chamTable) do
			local plr = Players:GetPlayerByUserId(id)
			local char = GetChar(plr)
			if not plr or not IsVisibleESP(plr) or (arr.__CHAR and char ~= arr.__CHAR) then
				for part, cham in pairs(arr) do
					if part == "__CHAR" then continue end
					cham:Destroy()
				end
				chamTable[id] = nil
				continue
			end

			local color = GetColor(plr)
			for part, cham in pairs(arr) do
				if part == "__CHAR" then continue end
				for i, surface in pairs(cham:GetChildren()) do
					surface.Frame.BackgroundTransparency = config.esp.chamsTransparency
					surface.Frame.BackgroundColor3 = color
				end
			end
			RunService.RenderStepped:Wait()
			RunService.RenderStepped:Wait()
		end
	else
		chams:ClearAllChildren()
		chamTable = {}
	end
end

function ApplyChamsToPart (part)
	local c = gui.ChamTemplate:Clone()
	c.Parent = chams
	c.Name = part:GetFullName()
	for i, surface in pairs(c:GetChildren()) do
		surface.Adornee = part
	end
	part.AncestryChanged:Connect(function()
		if part.Parent == nil then
			c:Destroy()
		end
	end)
	return c
end

function ApplyChams (plr)
	if plr == player then return end
	chamTable[plr.UserId] = chamTable[plr.UserId] or {}
	local arr = chamTable[plr.UserId]
	local char = GetChar(plr)
	if char then
		arr.__CHAR = char	
		for i, part in pairs(char:GetChildren()) do
			if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" and not arr[part] then
				arr[part] = ApplyChamsToPart(part)
			end
		end
	end
end

-- aimbot functions

function IsEnemyAimbot (plr)
	if config.aimbot.ignoreTeam then
		return true
	end
	if not isBB then
		return plr.Team ~= player.Team
	else
		return tshell.Teams:GetPlayerTeam(plr) ~= tshell.Teams:GetPlayerTeam(player)
	end
end

function GetPlayerPosPart (plr)
	local aimbot = config.aimbot
	local names = {aimbot.aimPart1, aimbot.aimPart2}
	local char = GetChar(plr)
	if char then
		if not IsDead(plr) then
			local baseParts = {}
			for i, part in pairs(char:GetDescendants()) do
				if part:IsA("BasePart") and not baseParts[part.Name] then
					baseParts[part.Name] = part
				end
			end
			for i, name in pairs(names) do
				if baseParts[name] then
					return baseParts[name]
				end
			end
		end
	end
end

function GetPlayerPos (plr)
	return (GetPlayerPosPart(plr) or {}).Position
end

-- misc

function IsDead (plr)
	local char = GetChar(plr)
	return not (
		char and char.Parent and (
			(char.Parent:FindFirstChild("Health") and char.Parent.Health:IsA("NumberValue") and char.Parent.Health.Value <= 0) or
				(not char:FindFirstChild("Humanoid") or char.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead)
		)
	)
end

function GetChar (plr)
	if not plr then
		return
	end

	if not isBB then
		return plr.Character
	else
		local char = tshell.Characters:GetCharacter(plr)
		return char and char:FindFirstChild("Body")
	end
end

-- intro sequence

do
	gui.IntroAudio:Play()
	Tween(intro.LogoFrame, TweenInfo.new(1), {Size = UDim2.fromScale(1, 1)})
	Tween(intro.LogoFrame.LogoText.UIGradient, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Rotation = 360})
	wait(1)
	local iconFrame = intro.IconFrame
	Tween(iconFrame.White, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {ImageTransparency = 0})
	Tween(iconFrame.Glow, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {ImageTransparency = 0})
	wait(0.5)
	iconFrame.Main.Visible = true
	Tween(iconFrame.White, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageTransparency = 1})
	Tween(iconFrame.Glow, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageTransparency = 1})
	wait(0.5)
	Tween(intro.LogoFrame.Credit, TweenInfo.new(0.25), {Position = UDim2.fromScale(0.47, 1)})

	wait(0.65)
	gui.IntroEnd:Play()
	wait(1.5 - 0.65)

	Tween(intro.LogoFrame.Credit, TweenInfo.new(0.125, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.fromScale(0.47, 1.2)})
	wait(0.125)
	Tween(intro.LogoFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.fromScale(0, 1)})
	Tween(intro.LogoFrame.LogoText.UIGradient, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Rotation = 0})

	local iconFrame = intro.IconFrame
	Tween(iconFrame.White, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageTransparency = 0})
	Tween(iconFrame.Glow, TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageTransparency = 0})
	wait(0.25)
	iconFrame.Main.Visible = false
	Tween(iconFrame.White, TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {ImageTransparency = 1})
	Tween(iconFrame.Glow, TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {ImageTransparency = 1})
end

--

local gameAimButton = gameAimButton or values.aimButton or Enum.UserInputType.MouseButton2
local gameAiming = false

local function onPressOrRelease (input, isBegin)
	for i, bindButton in pairs (bindButtons) do
		if bindButton:IsBinding() or tick() - bindButton._lastTimeBound < 0.25 then
			return
		end
	end
	for name, bind in pairs(config.keybinds) do
		if (input.KeyCode and input.KeyCode.Name == bind) or (input.UserInputType and input.UserInputType.Name == bind) then
			keybindFuncs[name](isBegin)
		end
	end

	if input.KeyCode == gameAimButton or input.UserInputType == gameAimButton then
		gameAiming = isBegin
	end
end
local inputBeganSignal = UserInputService.InputBegan:Connect(function(input, gpc)
	if not gpc then
		onPressOrRelease(input, true)
	end
end)
local inputEndedSignal = UserInputService.InputEnded:Connect(function(input, gpc)
	if not gpc then
		onPressOrRelease(input, false)
	end
end)

LoadSettings()

deltaX = values.deltaX or deltaX
deltaY = values.deltaY or deltaY
local aimDeltaX = aimDeltaX or values.aimDeltaX or deltaX
local aimDeltaY = aimDeltaY or values.aimDeltaY or deltaY
if values.mouseOffsetX then
	internalOffsetX = values.mouseOffsetX
end
if values.mouseOffsetY then
	internalOffsetY = values.mouseOffsetY
end

local main = gui.MainWindow
main.TopLogo.LogoFrame.VersionNum.Text = ver
main.MOTDTitle.Text = DATA.motd.title
main.MOTDBody.Text = DATA.motd.body
ShowWindow(main)
MakeDraggable(main)

for i, button in pairs(main.Buttons:GetChildren()) do
	if button:IsA("GuiButton") then
		local window = gui[button.Name]
		MakeDraggable(window)
		MakeCloseable(window)
		MakeButton(button, function()
			if elements[window] and elements[window].hidden == false then
				HideWindow(window)
			else
				ShowWindow(window)
			end
		end)
	end
end

MakeButton(gui.Exit.Confirm, function()
	SaveSettings()
	for i, guiObj in pairs(gui:GetChildren()) do
		if guiObj:IsA("Frame") and guiObj.Name ~= "Intro" then
			HideWindow(guiObj)
		end
	end
	wait(0.25)
	scriptTerminated = true
	inputBeganSignal:Disconnect()
	inputEndedSignal:Disconnect()
	gui:Destroy()
	script:Destroy()
end)

gui.Info.InfoText.Text = "Temporal X Aimbot + ESP " .. ver .. "\nCreated by ProtoType32\n\nDiscord Server:\ndiscord.me/temporal\n\nDiscord Username:\nProtoType32#9772"

gui.Changed:Connect(function(prop)
	if prop == "AbsoluteSize" then
		for i, window in pairs(draggables) do
			FitGui(window)
		end
	end
end)

------ button setups ------

-- keybinds window
for i, frame in pairs(gui.Keybinds.Buttons:GetChildren()) do
	if frame:IsA("Frame") then
		local bindButton = CreateBindButton(frame)
		bindButton:SetBind(config.keybinds[frame.Name])
		bindButton.OnBindChanged:Connect(function(newBind)
			config.keybinds[frame.Name] = newBind
		end)
	end
end

-- aimbot + esp settings windows
InitSettingsWindow(gui.AimbotSettings.Buttons, config.aimbot, defaultConfig.aimbot)
InitSettingsWindow(gui.ESPSettings.Buttons, config.esp, defaultConfig.esp)

UpdateValues()
local prevTargetDiff = nil
local prevCamRotation = nil

if detectedGame == "PhantomForces" then
	-- PF Character Patcher Script by el3tric
	-- Thanks lmao i was pulling my hair out trying to figure it out
	local client = {}; do
		for i,v in pairs(getgc(true)) do
			if (type(v) == "table") then
				if rawget(v, "getbodyparts") then
					client.chartable = debug.getupvalue(v.getbodyparts, 1)
				end
			end
		end
	end

	game:GetService("RunService").RenderStepped:Connect(function()
		for i,v in pairs(game.Players:GetPlayers()) do
			if (v and client.chartable[v]) then
				local char = client.chartable[v]
				char.head.Parent.Name = v.Name
				v.Character = char.head.Parent
			end
		end
	end)
end

RunService:BindToRenderStep("TemporalMainLoop", 1, function(deltaTime)
	UpdateValues()
	local function f (num)
		return math.floor(num * 1000) / 1000
	end

	if scriptTerminated then
		RunService:UnbindFromRenderStep("TemporalMainLoop")
		return
	end

	if detectedGame == "IslandRoyale" then
		if player.PlayerGui:FindFirstChild("Core_UI") then
			local core = player.PlayerGui.Core_UI
			if core.Center_Dot.Visible then
				internalMousePos = core.Center_Dot.Dot.AbsolutePosition + core.Center_Dot.Dot.AbsoluteSize / 2 + Vector2.new(0, 36)
			else
				internalMousePos = core.Crosshairs.Center.AbsolutePosition + core.Crosshairs.Center.AbsoluteSize / 2 + Vector2.new(0, 36)
			end
		else
			internalMousePos = nil
		end
	end



	-- aimbot aiming
	local aimbot = config.aimbot
	local char = GetChar(player)
	if aimbot.enabled and char then
		if aiming and target then
			local pos = GetPlayerPos(target)
			if pos then
				local diffDiff = Vector3.new()
				local targetDiff = char:GetPivot().Position - pos
				if prevTargetDiff then
					diffDiff = targetDiff - prevTargetDiff
				end
				LookAt(pos - diffDiff * aimbot.prediction)
				prevTargetDiff = targetDiff
			else

			end
		else
			prevTargetDiff = nil
		end
	else

	end

	-- esp update

	local esp = config.esp

	-- update gui visibility
	for i, window in pairs(draggables) do
		window.Visible = window:GetAttribute("Visible") and guiVisible
	end

	-- display tips
	Tips(tips.menuButtons, main.Buttons, main.Tip)
	Tips(tips.keybinds, gui.Keybinds.Buttons, gui.Keybinds.Tip, "To remove a bind, click the button a second time instead of pressing a key.")
	Tips(tips.aimbot, gui.AimbotSettings.Buttons, gui.AimbotSettings.Tip, "A lower mouse sensitivity (preferably 1 bar) is recommended for maximum accuracy.")
	Tips(tips.esp, gui.ESPSettings.Buttons, gui.ESPSettings.Tip)

	-- range circle update
	gui.RangeCircle.Visible = config.aimbot.enabled and config.aimbot.showRange
	gui.RangeCircle.Size = UDim2.fromOffset(config.aimbot.range * 2, config.aimbot.range * 2)
	gui.RangeCircle.Position = UDim2.fromOffset(mouseX, mouseY)
end)

-- settings autosave
spawn(function()
	while true do
		if scriptTerminated then
			break
		end

		SaveSettings()

		wait(10)
	end
end)

spawn(function()
	while not scriptTerminated do
		UpdateChams()
		wait(0.25)
		--RunService.RenderStepped:Wait()
	end
end)

spawn(function()
	while not scriptTerminated do
		UpdateInfos()
		RunService.RenderStepped:Wait()
	end
end)

-- aimbot targetting loop
while true do
	if scriptTerminated then
		break
	end

	local aimbot = config.aimbot
	if aimbot.enabled and aiming then
		if target then
			if not IsDead(target) then

			else
				target = nil
			end
		else
			local closest = {
				player = nil;
				distance = math.huge;
			}

			for i, plr in pairs(Players:GetPlayers()) do
				if plr ~= player and IsEnemyAimbot(plr) and not IsDead(plr) then
					local pos = GetPlayerPos(plr)
					if pos then
						local point = camera:WorldToViewportPoint(pos)
						local dist = (Vector2.new(mouseX, mouseY) - Vector2.new(point.X, point.Y)).Magnitude
						if point.Z > 0 and dist <= aimbot.range then
							local dist3 = (pos - camera.CFrame.Position).Magnitude
							if dist3 < closest.distance then
								closest.player = plr
								closest.distance = dist3
							end
						end
					end
				end
			end
			target = closest.player
		end
	else
		target = nil
	end

	wait(0.1)
end
