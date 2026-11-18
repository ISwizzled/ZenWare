-- Eko | Premium Roblox Menu | Single File
-- Menu key: RightShift (rebindable) | Mobile + PC | Delta compatible

local genv = (getgenv and getgenv()) or _G
if genv.EkoUnload then pcall(genv.EkoUnload) end

----------------------------------------------------------------------
-- SERVICES
----------------------------------------------------------------------
local function svc(n)
	local s = game:GetService(n)
	local ok, c = pcall(function() return cloneref and cloneref(s) end)
	return (ok and c) or s
end
local Players, RS, UIS, TS = svc("Players"), svc("RunService"), svc("UserInputService"), svc("TweenService")
local Lighting, HttpService, VU = svc("Lighting"), svc("HttpService"), svc("VirtualUser")
local MPS = svc("MarketplaceService")
local LP = Players.LocalPlayer
local Cam = workspace.CurrentCamera

----------------------------------------------------------------------
-- STATE / THEME
----------------------------------------------------------------------
local F, UI = {}, {}                 -- flags, ui setters
local conns, Accents, Rows = {}, {}, {}
local Pages, PageGlyph, PageOrder = {}, {}, {}
local Building, LOc = nil, 0
local alive = true

local T = {
	text = Color3.fromRGB(242, 242, 247),
	sub = Color3.fromRGB(150, 152, 165),
	accent = Color3.fromHSV(0.74, 0.45, 1),
	hue = 0.74,
}
local ESPCOL = Color3.fromRGB(80, 255, 120)

-- Optional: paste catalog rbxassetid icons here (e.g. Home = "rbxassetid://123"). Falls back to glyphs.
local ICONID = {}
local GLYPH = { Home = "⌂", Aimbot = "◎", Combat = "✕", ESP = "◉", Players = "☺", Player = "♟", Game = "★", Configs = "▤", Settings = "⚙" }

local function onAccent(fn) Accents[#Accents + 1] = fn; pcall(fn, T.accent) end
local function setAccent(c) T.accent = c; for _, f in ipairs(Accents) do pcall(f, c) end end
local function conn(sig, fn) local c = sig:Connect(fn); conns[#conns + 1] = c; return c end
local function lo() LOc += 1; return LOc end

----------------------------------------------------------------------
-- HELPERS
----------------------------------------------------------------------
local function new(class, props, kids)
	local o = Instance.new(class)
	for k, v in pairs(props or {}) do if k ~= "Parent" then o[k] = v end end
	for _, c in ipairs(kids or {}) do c.Parent = o end
	if props and props.Parent then o.Parent = props.Parent end
	return o
end
local function rd(p, r) return new("UICorner", { CornerRadius = UDim.new(0, r or 8), Parent = p }) end
local function stroke(p, col, tr, th)
	return new("UIStroke", { Color = col or Color3.new(1, 1, 1), Transparency = tr or 0.9, Thickness = th or 1, Parent = p })
end
local function tw(o, t, props, style, dir)
	local tween = TS:Create(o, TweenInfo.new(t, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out), props)
	tween:Play(); return tween
end
local function label(p, text, size, col, font, xa)
	return new("TextLabel", {
		BackgroundTransparency = 1, Text = text, TextSize = size or 13, TextColor3 = col or T.text,
		Font = font or Enum.Font.GothamMedium, TextXAlignment = xa or Enum.TextXAlignment.Left, Parent = p,
	})
end
local function line(fr, p1, p2, th)
	local d = p2 - p1
	fr.AnchorPoint = Vector2.new(0.5, 0.5)
	fr.Position = UDim2.fromOffset((p1.X + p2.X) / 2, (p1.Y + p2.Y) / 2)
	fr.Size = UDim2.fromOffset(d.Magnitude, th or 1.5)
	fr.Rotation = math.deg(math.atan2(d.Y, d.X))
end
local function fmt(v) return tostring(math.floor(v * 100 + 0.5) / 100) end

local function guiParent()
	local ok, h = pcall(function() return gethui and gethui() end)
	if ok and h then return h end
	local ok2, cg = pcall(function() return svc("CoreGui") end)
	if ok2 and cg then return cg end
	return LP:WaitForChild("PlayerGui")
end
local GuiParent = guiParent()

----------------------------------------------------------------------
-- ORIGINAL STATE (restored on unload)
----------------------------------------------------------------------
local origLight = {}
for _, k in ipairs({ "Brightness", "ClockTime", "FogEnd", "FogStart", "GlobalShadows", "Ambient", "OutdoorAmbient", "FogColor" }) do
	origLight[k] = Lighting[k]
end
local origGravity = workspace.Gravity
local origHum = setmetatable({}, { __mode = "k" })
local origSky = {}

----------------------------------------------------------------------
-- ROOT GUI + WINDOW
----------------------------------------------------------------------
local W0, H0, SB = 720, 440, 168
local Gui = new("ScreenGui", { Name = "Eko", ResetOnSpawn = false, IgnoreGuiInset = true, DisplayOrder = 100, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, Parent = GuiParent })
local Holder = new("Frame", { Name = "Holder", AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(W0, H0), BackgroundTransparency = 1, Parent = Gui })
local UIs = new("UIScale", { Scale = 1, Parent = Holder })

local Halo = new("ImageLabel", {
	BackgroundTransparency = 1, Image = "rbxassetid://5028857084", ScaleType = Enum.ScaleType.Slice,
	SliceCenter = Rect.new(24, 24, 276, 276), Position = UDim2.fromOffset(-26, -26), Size = UDim2.new(1, 52, 1, 52),
	ImageTransparency = 0.72, Parent = Holder,
})
onAccent(function(c) Halo.ImageColor3 = c end)

local Win = new("CanvasGroup", { Name = "Win", Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.fromRGB(9, 9, 12), BackgroundTransparency = 0.1, BorderSizePixel = 0, Parent = Holder })
rd(Win, 20)
local Edge = new("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Parent = Holder }); rd(Edge, 20)
local EdgeStroke = stroke(Edge, Color3.new(1, 1, 1), 0.82, 1)
local Sheen = new("Frame", { Size = UDim2.fromScale(1, 0.5), BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.94, BorderSizePixel = 0, ZIndex = 0, Parent = Win })
new("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(0, 1), Parent = Sheen })

local FXRoot = new("Frame", { Name = "FX", Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 1, Parent = Win })

local blur = new("BlurEffect", { Name = "EkoBlur", Size = 0, Parent = Lighting })

-- scale for mobile / small viewports
local baseScale = 1
local function autoScale()
	local vp = Cam.ViewportSize
	baseScale = math.clamp(math.min(vp.X / (W0 + 60), vp.Y / (H0 + 40)), 0.45, 1.1)
	UIs.Scale = baseScale
end
autoScale()
conn(Cam:GetPropertyChangedSignal("ViewportSize"), autoScale)

local function drag(handle, target)
	local dragging, start, startPos
	conn(handle.InputBegan, function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			dragging, start, startPos = true, i.Position, target.Position
		end
	end)
	conn(UIS.InputChanged, function(i)
		if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
			local d = i.Position - start
			target.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
		end
	end)
	conn(UIS.InputEnded, function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end
	end)
end

----------------------------------------------------------------------
-- BACKGROUND FX
----------------------------------------------------------------------
local FXModes, fxUpdate = {}, nil
local function clearFX() for _, c in ipairs(FXRoot:GetChildren()) do c:Destroy() end fxUpdate = nil end
local function dot(sz, tr)
	local f = new("Frame", { Size = UDim2.fromOffset(sz, sz), BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = tr or 0.5, BorderSizePixel = 0, Parent = FXRoot })
	rd(f, sz); return f
end

FXModes.Stars = function()
	local p = {}
	for i = 1, 70 do
		local d = dot(math.random(1, 3))
		p[i] = { d, math.random(), math.random(), math.random() * 0.01 + 0.003, math.random() * 6 }
	end
	return function(t, dt)
		for _, o in ipairs(p) do
			o[2] = (o[2] + o[4] * dt) % 1
			o[1].Position = UDim2.fromScale(o[2], o[3])
			o[1].BackgroundTransparency = 0.35 + 0.55 * math.abs(math.sin(t * 1.1 + o[5]))
		end
	end
end
FXModes.Snow = function()
	local p = {}
	for i = 1, 55 do p[i] = { dot(math.random(2, 4), 0.3), math.random(), math.random(), math.random() * 0.06 + 0.03, math.random() * 6 } end
	return function(t, dt)
		for _, o in ipairs(p) do
			o[3] = (o[3] + o[4] * dt) % 1
			o[1].Position = UDim2.fromScale((o[2] + math.sin(t * 0.6 + o[5]) * 0.015) % 1, o[3])
		end
	end
end
FXModes.Topographic = function()
	local rings = {}
	local centers = { { 0.3, 0.38 }, { 0.78, 0.72 }, { 0.62, 0.16 } }
	for ci, c in ipairs(centers) do
		for i = 1, 11 do
			local f = new("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, Parent = FXRoot }); rd(f, 9999)
			local s = new("UIStroke", { Thickness = 1, Color = T.accent, Transparency = 0.7, Parent = f })
			rings[#rings + 1] = { f, s, c, i, ci }
		end
	end
	return function(t)
		for _, r in ipairs(rings) do
			local f, s, c, i, ci = r[1], r[2], r[3], r[4], r[5]
			local k = i * 30 + math.sin(t * 0.4 + i * 0.7 + ci) * 9
			f.Size = UDim2.fromOffset(k * 1.9 + math.sin(t * 0.3 + i) * 20, k * 1.25 + math.cos(t * 0.33 + i) * 14)
			f.Position = UDim2.new(c[1], math.sin(t * 0.15 + ci) * 22, c[2], math.cos(t * 0.12 + ci) * 18)
			f.Rotation = 24 * ci + math.sin(t * 0.2 + i * 0.3) * 14
			s.Color = T.accent
			s.Transparency = 0.55 + 0.4 * (i / 11)
		end
	end
end
FXModes.Aurora = function()
	local bands = {}
	local seq = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.35, 0.5), NumberSequenceKeypoint.new(1, 1) })
	for i = 1, 22 do
		local f = new("Frame", { AnchorPoint = Vector2.new(0.5, 0), Size = UDim2.new(0, math.random(2, 5), 0.9, 0), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, Parent = FXRoot })
		new("UIGradient", { Rotation = 90, Transparency = seq, Parent = f })
		bands[i] = { f, i, math.random() * 6 }
	end
	local rib = {}
	for i = 1, 3 do
		local f = new("Frame", { AnchorPoint = Vector2.new(0.5, 0), Size = UDim2.new(0.35, 0, 0.7, 0), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, Parent = FXRoot })
		new("UIGradient", { Rotation = 90, Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.4, 0.88), NumberSequenceKeypoint.new(1, 1) }), Parent = f })
		rib[i] = f
	end
	return function(t)
		for _, b in ipairs(bands) do
			local f, i, ph = b[1], b[2], b[3]
			f.Position = UDim2.fromScale(i / 23 + math.sin(t * 0.22 + ph) * 0.04, 0.02 + 0.05 * math.sin(t * 0.3 + i))
			f.Rotation = math.sin(t * 0.3 + i * 0.5) * 12
			f.Size = UDim2.new(0, f.Size.X.Offset, 0.55 + 0.3 * math.sin(t * 0.4 + ph), 0)
			f.BackgroundColor3 = Color3.fromHSV(0.33 + 0.27 * (0.5 + 0.5 * math.sin(t * 0.2 + i * 0.35)), 0.7, 1)
		end
		for i, f in ipairs(rib) do
			f.Position = UDim2.fromScale(0.2 + 0.3 * i + math.sin(t * 0.12 + i) * 0.05, 0)
			f.BackgroundColor3 = Color3.fromHSV((0.4 + 0.2 * i + t * 0.03) % 1, 0.6, 1)
		end
	end
end
FXModes.Waves = function()
	local segs, N = {}, 34
	for l = 1, 3 do
		for i = 1, N do
			local f = new("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(W0 / N + 4, 2), BackgroundColor3 = T.accent, BackgroundTransparency = 0.45 + l * 0.12, BorderSizePixel = 0, Parent = FXRoot })
			segs[#segs + 1] = { f, l, i }
		end
	end
	return function(t)
		for _, s in ipairs(segs) do
			local f, l, i = s[1], s[2], s[3]
			local x = i / N
			local y = 0.55 + l * 0.11 + math.sin(x * 7 + t * (0.6 + l * 0.2)) * 0.045
			local slope = math.cos(x * 7 + t * (0.6 + l * 0.2)) * 0.045 * 7 * H0 / W0
			f.Position = UDim2.fromScale(x, y)
			f.Rotation = math.deg(math.atan(slope))
			f.BackgroundColor3 = T.accent
		end
	end
end
FXModes.Grid = function()
	local v, h = {}, {}
	for i = 1, 14 do v[i] = new("Frame", { Size = UDim2.new(0, 1, 1, 0), BackgroundColor3 = T.accent, BackgroundTransparency = 0.88, BorderSizePixel = 0, Parent = FXRoot }) end
	for i = 1, 9 do h[i] = new("Frame", { Size = UDim2.new(1, 0, 0, 1), BackgroundColor3 = T.accent, BackgroundTransparency = 0.88, BorderSizePixel = 0, Parent = FXRoot }) end
	return function(t)
		for i, f in ipairs(v) do f.Position = UDim2.fromScale(((i / 14) + t * 0.01) % 1, 0); f.BackgroundColor3 = T.accent end
		for i, f in ipairs(h) do f.Position = UDim2.fromScale(0, ((i / 9) + t * 0.02) % 1); f.BackgroundColor3 = T.accent end
	end
end
FXModes.Pulse = function()
	local r = {}
	for i = 1, 4 do
		local f = new("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.62, 0.5), BackgroundTransparency = 1, Parent = FXRoot }); rd(f, 9999)
		r[i] = { f, stroke(f, T.accent, 0.5, 2) }
	end
	return function(t)
		for i, o in ipairs(r) do
			local k = ((t * 0.18) + i / 4) % 1
			o[1].Size = UDim2.fromOffset(k * 640, k * 640)
			o[2].Transparency = 0.45 + 0.55 * k
			o[2].Color = T.accent
		end
	end
end
local FXList = { "Off", "Stars", "Snow", "Topographic", "Aurora", "Waves", "Grid", "Pulse" }
local function setFX(name)
	clearFX()
	if FXModes[name] then local ok, u = pcall(FXModes[name]); if ok then fxUpdate = u end end
end

----------------------------------------------------------------------
-- SIDEBAR / MAIN
----------------------------------------------------------------------
local Side = new("Frame", { Name = "Side", Size = UDim2.new(0, SB, 1, 0), BackgroundColor3 = Color3.new(0, 0, 0), BackgroundTransparency = 0.55, BorderSizePixel = 0, Parent = Win })
new("Frame", { Position = UDim2.new(1, -1, 0, 0), Size = UDim2.new(0, 1, 1, 0), BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.93, BorderSizePixel = 0, Parent = Side })

local Logo = label(Side, "eko", 22, T.text, Enum.Font.GothamBold)
Logo.Position = UDim2.fromOffset(18, 14); Logo.Size = UDim2.fromOffset(100, 28)
local LogoDot = new("Frame", { Position = UDim2.fromOffset(62, 31), Size = UDim2.fromOffset(6, 6), BackgroundColor3 = T.accent, Parent = Side }); rd(LogoDot, 3)
onAccent(function(c) LogoDot.BackgroundColor3 = c end)
local SideDrag = new("Frame", { Size = UDim2.new(1, 0, 0, 46), BackgroundTransparency = 1, Parent = Side })
drag(SideDrag, Holder)

local SSearch = new("TextBox", {
	PlaceholderText = "Search", Text = "", ClearTextOnFocus = false, TextSize = 12, Font = Enum.Font.GothamMedium,
	TextColor3 = T.text, PlaceholderColor3 = T.sub, BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.94,
	Position = UDim2.fromOffset(12, 50), Size = UDim2.new(1, -24, 0, 30), TextXAlignment = Enum.TextXAlignment.Left, Parent = Side,
}); rd(SSearch, 9); stroke(SSearch, Color3.new(1, 1, 1), 0.92); new("UIPadding", { PaddingLeft = UDim.new(0, 10), Parent = SSearch })

local TabList = new("Frame", { Position = UDim2.fromOffset(10, 90), Size = UDim2.new(1, -20, 1, -150), BackgroundTransparency = 1, Parent = Side })
local Pill = new("Frame", { Size = UDim2.new(1, 0, 0, 34), BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.9, Parent = TabList }); rd(Pill, 10)
local PillBar = new("Frame", { Position = UDim2.fromOffset(0, 8), Size = UDim2.fromOffset(3, 18), BackgroundColor3 = T.accent, Parent = Pill }); rd(PillBar, 2)
onAccent(function(c) PillBar.BackgroundColor3 = c end)

local Account = new("Frame", { Position = UDim2.new(0, 10, 1, -52), Size = UDim2.new(1, -20, 0, 42), BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.94, Parent = Side }); rd(Account, 12); stroke(Account, Color3.new(1, 1, 1), 0.93)
local Avatar = new("ImageLabel", { Position = UDim2.fromOffset(6, 6), Size = UDim2.fromOffset(30, 30), BackgroundColor3 = Color3.fromRGB(30, 30, 36), Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150"):format(LP.UserId), Parent = Account }); rd(Avatar, 15)
local AccName = label(Account, "Account", 12, T.text, Enum.Font.GothamMedium); AccName.Position = UDim2.fromOffset(44, 5); AccName.Size = UDim2.new(1, -50, 0, 16)
local AccSub = label(Account, "@" .. LP.Name, 10, T.sub, Enum.Font.Gotham); AccSub.Position = UDim2.fromOffset(44, 21); AccSub.Size = UDim2.new(1, -50, 0, 14); AccSub.TextTruncate = Enum.TextTruncate.AtEnd

local Main = new("Frame", { Name = "Main", Position = UDim2.fromOffset(SB, 0), Size = UDim2.new(1, -SB, 1, 0), BackgroundTransparency = 1, Parent = Win })
local Title = label(Main, "Home", 20, T.text, Enum.Font.GothamBold); Title.Position = UDim2.fromOffset(18, 14); Title.Size = UDim2.new(0.4, 0, 0, 30)
local FSearch = new("TextBox", {
	PlaceholderText = "Search features…", Text = "", ClearTextOnFocus = false, TextSize = 12, Font = Enum.Font.GothamMedium,
	TextColor3 = T.text, PlaceholderColor3 = T.sub, BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.94,
	AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -92, 0, 14), Size = UDim2.fromOffset(150, 30), TextXAlignment = Enum.TextXAlignment.Left, Parent = Main,
}); rd(FSearch, 9); stroke(FSearch, Color3.new(1, 1, 1), 0.92); new("UIPadding", { PaddingLeft = UDim.new(0, 10), Parent = FSearch })
local DragBar = new("Frame", { Size = UDim2.new(1, 0, 0, 56), BackgroundTransparency = 1, ZIndex = 0, Parent = Main })
drag(DragBar, Holder)

local function winBtn(txt, xoff, cb)
	local b = new("TextButton", { Text = txt, TextSize = 14, Font = Enum.Font.GothamBold, TextColor3 = T.sub, BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.94, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, xoff, 0, 14), Size = UDim2.fromOffset(30, 30), AutoButtonColor = false, Parent = Main })
	rd(b, 15)
	conn(b.MouseEnter, function() tw(b, 0.15, { BackgroundTransparency = 0.85 }) end)
	conn(b.MouseLeave, function() tw(b, 0.15, { BackgroundTransparency = 0.94 }) end)
	conn(b.Activated, cb)
	return b
end

----------------------------------------------------------------------
-- OPEN / CLOSE + FLOATING BUTTON
----------------------------------------------------------------------
local isOpen = false
local Float = new("TextButton", { Text = "eko", TextSize = 13, Font = Enum.Font.GothamBold, TextColor3 = T.text, BackgroundColor3 = Color3.fromRGB(12, 12, 16), BackgroundTransparency = 0.1, Position = UDim2.new(0, 16, 0.5, 0), Size = UDim2.fromOffset(48, 48), AutoButtonColor = false, Visible = false, Parent = Gui }); rd(Float, 24)
local FloatStroke = stroke(Float, T.accent, 0.3, 1.5); onAccent(function(c) FloatStroke.Color = c end)

local function setOpen(v)
	isOpen = v
	if v then
		Holder.Visible = true; Float.Visible = false
		UIs.Scale = baseScale * 0.9; Win.GroupTransparency = 1; Halo.ImageTransparency = 1
		tw(UIs, 0.5, { Scale = baseScale }, Enum.EasingStyle.Back)
		tw(Win, 0.35, { GroupTransparency = 0 }); tw(Halo, 0.5, { ImageTransparency = 0.72 })
		if F.blur then tw(blur, 0.4, { Size = F.blur_amt or 8 }) end
	else
		tw(UIs, 0.3, { Scale = baseScale * 0.94 }, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
		tw(Win, 0.25, { GroupTransparency = 1 }); tw(Halo, 0.25, { ImageTransparency = 1 }); tw(blur, 0.3, { Size = 0 })
		task.delay(0.3, function() if not isOpen then Holder.Visible = false; Float.Visible = true end end)
	end
end
winBtn("–", -52, function() setOpen(false) end)
winBtn("×", -14, function() if genv.EkoUnload then genv.EkoUnload() end end)

do -- floating button drag vs click
	local moved, sp, st
	conn(Float.InputBegan, function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then moved, sp, st = false, i.Position, Float.Position end
	end)
	conn(UIS.InputChanged, function(i)
		if sp and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
			local d = i.Position - sp
			if d.Magnitude > 6 then moved = true end
			if moved then Float.Position = UDim2.new(st.X.Scale, st.X.Offset + d.X, st.Y.Scale, st.Y.Offset + d.Y) end
		end
	end)
	conn(UIS.InputEnded, function(i)
		if sp and (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) then
			if not moved then setOpen(true) end
			sp = nil
		end
	end)
end

----------------------------------------------------------------------
-- UI COMPONENT LIBRARY (row, sec, tog, sld, btn, opt, bind)
----------------------------------------------------------------------
local function newPage(name)
	local sf = new("ScrollingFrame", {
		Name = name, BackgroundTransparency = 1, BorderSizePixel = 0, Size = UDim2.new(1, -24, 1, -64), Position = UDim2.fromOffset(12, 56),
		CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollBarThickness = 2, ScrollBarImageColor3 = Color3.new(1, 1, 1), Visible = false, Parent = Main,
	})
	new("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder, Parent = sf })
	new("UIPadding", { PaddingBottom = UDim.new(0, 14), PaddingRight = UDim.new(0, 6), Parent = sf })
	Pages[name], Rows[name] = sf, {}
	PageOrder[#PageOrder + 1] = name
	Building = name
	return sf
end

local function row(parent, name, h)
	local r = new("Frame", { Size = UDim2.new(1, 0, 0, h or 38), BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.95, BorderSizePixel = 0, LayoutOrder = lo(), Parent = parent })
	rd(r, 10); stroke(r, Color3.new(1, 1, 1), 0.93)
	local l = label(r, name, 13, T.text); l.Position = UDim2.fromOffset(12, 0); l.Size = UDim2.new(0.6, 0, 0, 38)
	conn(r.MouseEnter, function() tw(r, 0.15, { BackgroundTransparency = 0.91 }) end)
	conn(r.MouseLeave, function() tw(r, 0.15, { BackgroundTransparency = 0.95 }) end)
	if Building then table.insert(Rows[Building], { r, name:lower() }) end
	return r
end

local function sec(parent, title)
	local holder = new("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = lo(), Parent = parent })
	new("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder, Parent = holder })
	local head = new("TextButton", { Text = "", BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 22), LayoutOrder = 0, Parent = holder })
	local t = label(head, title:upper(), 10, T.sub, Enum.Font.GothamBold); t.Position = UDim2.fromOffset(4, 0); t.Size = UDim2.new(1, -30, 1, 0)
	local ar = label(head, "▾", 12, T.sub, Enum.Font.GothamBold, Enum.TextXAlignment.Right); ar.Size = UDim2.new(1, -4, 1, 0)
	local body = new("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = 1, Parent = holder })
	new("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder, Parent = body })
	local open = true
	conn(head.Activated, function() open = not open; body.Visible = open; ar.Text = open and "▾" or "▸" end)
	return body
end

local refreshPreview -- forward

local function tog(parent, name, flag, default, cb)
	F[flag] = default and true or false
	local r = row(parent, name)
	local pill = new("TextButton", { Text = "", AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0), Size = UDim2.fromOffset(40, 22), BackgroundColor3 = Color3.fromRGB(72, 72, 80), AutoButtonColor = false, Parent = r }); rd(pill, 11)
	local knob = new("Frame", { Size = UDim2.fromOffset(18, 18), Position = UDim2.fromOffset(2, 2), BackgroundColor3 = Color3.new(1, 1, 1), Parent = pill }); rd(knob, 9)
	local function paint(anim)
		local on = F[flag]
		local col = on and T.accent or Color3.fromRGB(72, 72, 80)
		local pos = on and UDim2.fromOffset(20, 2) or UDim2.fromOffset(2, 2)
		if anim then tw(pill, 0.25, { BackgroundColor3 = col }); tw(knob, 0.4, { Position = pos }, Enum.EasingStyle.Back)
		else pill.BackgroundColor3 = col; knob.Position = pos end
	end
	paint(false); onAccent(function() paint(false) end)
	UI[flag] = function(v) F[flag] = v and true or false; paint(true); if cb then pcall(cb, F[flag]) end; if refreshPreview then refreshPreview() end end
	conn(pill.Activated, function() UI[flag](not F[flag]) end)
	if default and cb then task.defer(function() pcall(cb, true) end) end
	return r
end

local function sld(parent, name, flag, min, max, default, step, cb)
	F[flag] = default
	local r = row(parent, name, 54)
	local val = label(r, fmt(default), 12, T.sub, Enum.Font.GothamMedium, Enum.TextXAlignment.Right); val.AnchorPoint = Vector2.new(1, 0); val.Position = UDim2.new(1, -12, 0, 0); val.Size = UDim2.fromOffset(80, 30)
	local track = new("Frame", { Position = UDim2.new(0, 12, 0, 36), Size = UDim2.new(1, -24, 0, 5), BackgroundColor3 = Color3.fromRGB(70, 70, 78), BorderSizePixel = 0, Parent = r }); rd(track, 3)
	local fill = new("Frame", { Size = UDim2.fromScale(0, 1), BackgroundColor3 = T.accent, BorderSizePixel = 0, Parent = track }); rd(fill, 3)
	local knob = new("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0, 0.5), Size = UDim2.fromOffset(14, 14), BackgroundColor3 = Color3.new(1, 1, 1), Parent = track }); rd(knob, 7)
	onAccent(function(c) fill.BackgroundColor3 = c end)
	local function show(v)
		local a = (v - min) / (max - min)
		fill.Size = UDim2.fromScale(a, 1); knob.Position = UDim2.fromScale(a, 0.5); val.Text = fmt(v)
	end
	show(default)
	local function set(v)
		v = math.clamp(math.floor(v / step + 0.5) * step, min, max)
		F[flag] = v; show(v); if cb then pcall(cb, v) end
	end
	UI[flag] = set
	local dragging = false
	local scroller = parent:FindFirstAncestorOfClass("ScrollingFrame")
	local function fromX(x) set(min + (max - min) * math.clamp((x - track.AbsolutePosition.X) / math.max(track.AbsoluteSize.X, 1), 0, 1)) end
	conn(track.InputBegan, function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			dragging = true; if scroller then scroller.ScrollingEnabled = false end; fromX(i.Position.X)
		end
	end)
	conn(UIS.InputChanged, function(i)
		if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then fromX(i.Position.X) end
	end)
	conn(UIS.InputEnded, function(i)
		if dragging and (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) then
			dragging = false; if scroller then scroller.ScrollingEnabled = true end
		end
	end)
	return r
end

local function btn(parent, name, cb, text)
	local r = row(parent, name)
	local b = new("TextButton", { Text = text or "Run", TextSize = 12, Font = Enum.Font.GothamMedium, TextColor3 = T.text, BackgroundColor3 = T.accent, BackgroundTransparency = 0.7, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0), Size = UDim2.fromOffset(78, 26), AutoButtonColor = false, Parent = r }); rd(b, 8)
	onAccent(function(c) b.BackgroundColor3 = c end)
	conn(b.MouseEnter, function() tw(b, 0.15, { BackgroundTransparency = 0.55 }) end)
	conn(b.MouseLeave, function() tw(b, 0.15, { BackgroundTransparency = 0.7 }) end)
	conn(b.Activated, function() pcall(cb) end)
	return r, b
end

local function opt(parent, name, flag, options, default, cb)
	F[flag] = default
	local r = row(parent, name)
	local b = new("TextButton", { Text = default, TextSize = 12, Font = Enum.Font.GothamMedium, TextColor3 = T.text, BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.9, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0), Size = UDim2.fromOffset(112, 26), AutoButtonColor = false, Parent = r }); rd(b, 8)
	UI[flag] = function(v) F[flag] = v; b.Text = v; if cb then pcall(cb, v) end; if refreshPreview then refreshPreview() end end
	conn(b.Activated, function()
		local idx = table.find(options, F[flag]) or 0
		UI[flag](options[idx % #options + 1])
	end)
	return r
end

local listening
local function bind(parent, name, flag, default, cb)
	F[flag] = default
	local r = row(parent, name)
	local b = new("TextButton", { Text = default, TextSize = 12, Font = Enum.Font.GothamMedium, TextColor3 = T.text, BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.9, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0), Size = UDim2.fromOffset(112, 26), AutoButtonColor = false, Parent = r }); rd(b, 8)
	UI[flag] = function(v) F[flag] = v; b.Text = v; if cb then pcall(cb, v) end end
	conn(b.Activated, function() b.Text = "press a key…"; listening = function(k) UI[flag](k) end end)
	return r
end

local function info(parent, text, h)
	local r = new("Frame", { Size = UDim2.new(1, 0, 0, h or 38), BackgroundTransparency = 1, LayoutOrder = lo(), Parent = parent })
	local l = label(r, text, 12, T.sub, Enum.Font.Gotham); l.Size = UDim2.fromScale(1, 1); l.TextWrapped = true; l.TextYAlignment = Enum.TextYAlignment.Top; l.Position = UDim2.fromOffset(4, 0)
	return l
end

----------------------------------------------------------------------
-- FEATURE PREVIEW PANEL
----------------------------------------------------------------------
local PV = new("Frame", { AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -12, 0, 56), Size = UDim2.new(0, 198, 1, -68), BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.95, Visible = false, Parent = Main }); rd(PV, 16); stroke(PV, Color3.new(1, 1, 1), 0.92)
local PVTitle = label(PV, "LIVE PREVIEW", 10, T.sub, Enum.Font.GothamBold); PVTitle.Position = UDim2.fromOffset(14, 10); PVTitle.Size = UDim2.new(1, -28, 0, 14)
local Stage = new("Frame", { Position = UDim2.fromOffset(8, 30), Size = UDim2.new(1, -16, 1, -72), BackgroundColor3 = Color3.fromRGB(6, 6, 9), BackgroundTransparency = 0.2, ClipsDescendants = true, Parent = PV }); rd(Stage, 12)
local PVInfo = label(PV, "", 11, T.text, Enum.Font.GothamMedium, Enum.TextXAlignment.Center); PVInfo.AnchorPoint = Vector2.new(0, 1); PVInfo.Position = UDim2.new(0, 8, 1, -8); PVInfo.Size = UDim2.new(1, -16, 0, 30); PVInfo.TextWrapped = true

local PGlow = new("ImageLabel", { BackgroundTransparency = 1, Image = "rbxassetid://5028857084", ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(24, 24, 276, 276), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(0.95, 0.95), ImageTransparency = 0.45, Parent = Stage })
onAccent(function(c) PGlow.ImageColor3 = c end)
local PFall = new("ImageLabel", { BackgroundTransparency = 1, Image = ("rbxthumb://type=Avatar&id=%d&w=352&h=352"):format(LP.UserId), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(0.9, 0.9), ScaleType = Enum.ScaleType.Fit, Parent = Stage })
local VP = new("ViewportFrame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Ambient = Color3.fromRGB(190, 190, 205), LightColor = Color3.new(1, 1, 1), Parent = Stage })
local VCam = new("Camera", { FieldOfView = 35, Parent = VP }); VP.CurrentCamera = VCam
local avatar, avCenter, avDist
local PHighlight = new("Highlight", { FillColor = T.accent, OutlineColor = Color3.new(1, 1, 1), FillTransparency = 0.45, OutlineTransparency = 0.1, DepthMode = Enum.HighlightDepthMode.AlwaysOnTop, Enabled = false, Parent = VP })
onAccent(function(c) PHighlight.FillColor = c end)

task.spawn(function()
	local ok, m = pcall(function() return Players:CreateHumanoidModelFromUserId(LP.UserId) end)
	if not (ok and m) or not alive then return end
	for _, d in ipairs(m:GetDescendants()) do if d:IsA("BasePart") then d.Anchored = true end end
	m.Parent = VP; avatar = m
	pcall(function() m:PivotTo(CFrame.new(0, 0, 0)) end)
	local ok2, cf, size = pcall(function() return m:GetBoundingBox() end)
	if ok2 then
		avCenter = cf.Position
		avDist = size.Y / (2 * math.tan(math.rad(17.5))) * 1.12
		PHighlight.Adornee = m
		PFall.Visible = false
	end
end)

-- overlays
local PBox = new("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.52), Size = UDim2.fromScale(0.46, 0.78), BackgroundTransparency = 1, Visible = false, Parent = Stage }); stroke(PBox, ESPCOL, 0, 1.5)
local PName = label(PBox, LP.DisplayName, 10, Color3.new(1, 1, 1), Enum.Font.GothamBold, Enum.TextXAlignment.Center); PName.AnchorPoint = Vector2.new(0.5, 1); PName.Position = UDim2.fromScale(0.5, 0); PName.Size = UDim2.new(1, 20, 0, 14)
local PHPBg = new("Frame", { Position = UDim2.new(0, -7, 0, 0), Size = UDim2.new(0, 3, 1, 0), BackgroundColor3 = Color3.fromRGB(20, 20, 20), BorderSizePixel = 0, Visible = false, Parent = PBox })
local PHP = new("Frame", { AnchorPoint = Vector2.new(0, 1), Position = UDim2.fromScale(0, 1), Size = UDim2.fromScale(1, 0.85), BackgroundColor3 = ESPCOL, BorderSizePixel = 0, Parent = PHPBg })
local PTracer = new("Frame", { BackgroundColor3 = ESPCOL, BorderSizePixel = 0, Visible = false, Parent = Stage })
local PRing1 = new("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.2), BackgroundTransparency = 1, Visible = false, Parent = Stage }); rd(PRing1, 9999)
local PRing1S = stroke(PRing1, T.accent, 0.2, 2)
local PRing2 = new("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.2), BackgroundTransparency = 1, Visible = false, Parent = Stage }); rd(PRing2, 9999)
local PRing2S = stroke(PRing2, T.accent, 0.4, 1.5)
local PCross = label(Stage, "⌖", 26, T.accent, Enum.Font.GothamBold, Enum.TextXAlignment.Center); PCross.AnchorPoint = Vector2.new(0.5, 0.5); PCross.Position = UDim2.fromScale(0.5, 0.2); PCross.Size = UDim2.fromOffset(40, 40); PCross.Visible = false
if ICONID.Crosshair then PCross.Text = "" ; new("ImageLabel", { BackgroundTransparency = 1, Image = ICONID.Crosshair, Size = UDim2.fromScale(1, 1), Parent = PCross }) end
onAccent(function(c) PRing1S.Color = c; PRing2S.Color = c; PCross.TextColor3 = c end)

local pvOn = false
refreshPreview = function()
	local esp = F.esp_on
	local a, b, c, d, e = F.aim_on, esp and F.esp_box, esp and F.esp_tracers, esp and F.esp_chams, F.crosshair
	local show = (a or b or c or d or e) and true or false
	PBox.Visible = (b or c) and true or false
	PName.Visible = esp and F.esp_name or false
	PHPBg.Visible = esp and F.esp_hp or false
	PTracer.Visible = c and true or false
	PRing1.Visible, PRing2.Visible, PCross.Visible = a and true or false, a and true or false, (a or e) and true or false
	PHighlight.Enabled = d and true or false
	PFall.ImageColor3 = d and Color3.new(1, 1, 1):Lerp(T.accent, 0.45) or Color3.new(1, 1, 1)
	local names = {}
	if a then names[#names + 1] = "Aimbot" end
	if b then names[#names + 1] = "Box" end
	if c then names[#names + 1] = "Tracers" end
	if d then names[#names + 1] = "Chams" end
	if e then names[#names + 1] = "Crosshair" end
	PVInfo.Text = table.concat(names, "  ·  ")
	if show ~= pvOn then
		pvOn = show
		PV.Visible = show
		if show then PV.Position = UDim2.new(1, 30, 0, 56); tw(PV, 0.5, { Position = UDim2.new(1, -12, 0, 56) }, Enum.EasingStyle.Quint) end
		for _, sf in pairs(Pages) do tw(sf, 0.4, { Size = UDim2.new(1, show and -232 or -24, 1, -64) }) end
		FSearch.Visible = true
	end
end

----------------------------------------------------------------------
-- GAME PROFILES
----------------------------------------------------------------------
local Profiles = {
	{ key = "rivals", name = "Rivals", note = "Fast duels: low smoothing, head lock, wall check on.", preset = { aim_part = "Head", aim_smooth = 18, aim_wall = true, aim_pred = 0.04, aim_fov = 140 } },
	{ key = "arsenal", name = "Arsenal", note = "Quick rounds: head lock, team check, tracers.", preset = { aim_part = "Head", aim_smooth = 25, aim_team = true, esp_tracers = true, aim_fov = 160 } },
	{ key = "da hood", name = "Da Hood", note = "Torso lock with prediction for fast movers.", preset = { aim_part = "Torso", aim_smooth = 12, aim_pred = 0.13, aim_wall = false, aim_fov = 200 } },
	{ key = "murder mystery", name = "MM2", note = "Role-colored ESP (murderer red / sheriff blue).", preset = { esp_on = true, esp_name = true, esp_box = true, mm2_roles = true } },
	{ key = "doors", name = "Doors", note = "Fullbright, speed boost and anti-AFK.", preset = { fullbright = true, speed_on = true, speed = 22, antiafk = true } },
	{ key = "blox fruits", name = "Blox Fruits", note = "Farm-friendly: anti-AFK, noclip toggle, mild speed.", preset = { antiafk = true, speed_on = true, speed = 24 } },
	{ key = "prison life", name = "Prison Life", note = "Team-aware aimbot with chams.", preset = { aim_team = true, esp_chams = true, aim_part = "Torso", aim_smooth = 22 } },
}
local Profile = { name = "Universal", note = "No game-specific tweaks detected. Core tools are ready.", preset = {} }
do
	local gname = ""
	pcall(function() gname = (MPS:GetProductInfo(game.PlaceId).Name or ""):lower() end)
	for _, p in ipairs(Profiles) do
		if gname:find(p.key, 1, true) then Profile = p; break end
	end
end
local function applyPreset(p)
	for k, v in pairs(p.preset) do if UI[k] then UI[k](v) end end
end

----------------------------------------------------------------------
-- PAGES
----------------------------------------------------------------------
local gameName = Profile.name
local executor = "Unknown"
pcall(function() executor = identifyexecutor() end)

-- HOME ---------------------------------------------------------------
do
	local P = newPage("Home")
	local card = new("Frame", { Size = UDim2.new(1, 0, 0, 92), BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.94, LayoutOrder = lo(), Parent = P }); rd(card, 14); stroke(card, Color3.new(1, 1, 1), 0.92)
	local hs = new("ImageLabel", { Position = UDim2.fromOffset(14, 14), Size = UDim2.fromOffset(64, 64), BackgroundColor3 = Color3.fromRGB(28, 28, 34), Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150"):format(LP.UserId), Parent = card }); rd(hs, 32)
	local hst = stroke(hs, T.accent, 0.2, 2); onAccent(function(c) hst.Color = c end)
	local a = label(card, "Welcome, " .. LP.DisplayName, 16, T.text, Enum.Font.GothamBold); a.Position = UDim2.fromOffset(92, 16); a.Size = UDim2.new(1, -100, 0, 22)
	local b = label(card, ("Profile: %s  ·  %s"):format(gameName, executor), 12, T.sub, Enum.Font.Gotham); b.Position = UDim2.fromOffset(92, 40); b.Size = UDim2.new(1, -100, 0, 16)
	local c = label(card, Profile.note, 11, T.sub, Enum.Font.Gotham); c.Position = UDim2.fromOffset(92, 58); c.Size = UDim2.new(1, -100, 0, 28); c.TextWrapped = true; c.TextYAlignment = Enum.TextYAlignment.Top
	local s = sec(P, "Quick toggles")
	tog(s, "Aimbot", "aim_on_q", false, function(v) if UI.aim_on then UI.aim_on(v) end end)
	tog(s, "ESP", "esp_on_q", false, function(v) if UI.esp_on then UI.esp_on(v) end end)
	tog(s, "Fly", "fly_on_q", false, function(v) if UI.fly_on then UI.fly_on(v) end end)
	btn(s, "Apply " .. gameName .. " preset", function() applyPreset(Profile) end, "Apply")
	local s2 = sec(P, "Status")
	local fpsRow = row(s2, "Performance"); local fpsL = label(fpsRow, "", 12, T.sub, Enum.Font.GothamMedium, Enum.TextXAlignment.Right); fpsL.AnchorPoint = Vector2.new(1, 0); fpsL.Position = UDim2.new(1, -12, 0, 0); fpsL.Size = UDim2.fromOffset(160, 38)
	genv.__EkoFpsLabel = fpsL
end

-- AIMBOT -------------------------------------------------------------
do
	local P = newPage("Aimbot")
	local s = sec(P, "Aimbot")
	tog(s, "Enabled", "aim_on", false, function(v) if UI.aim_on_q then F.aim_on_q = v end end)
	tog(s, "Hold right mouse (PC)", "aim_rmb", true)
	tog(s, "Sticky lock", "aim_sticky", false)
	tog(s, "Team check", "aim_team", true)
	tog(s, "Wall check", "aim_wall", true)
	opt(s, "Target part", "aim_part", { "Head", "Torso", "Root" }, "Head")
	opt(s, "Priority", "aim_prio", { "Cursor", "Distance", "Lowest HP" }, "Cursor")
	local s2 = sec(P, "Tuning")
	sld(s2, "FOV", "aim_fov", 30, 500, 150, 5)
	sld(s2, "Smoothness", "aim_smooth", 0, 95, 25, 1)
	sld(s2, "Prediction", "aim_pred", 0, 0.3, 0, 0.01)
	local s3 = sec(P, "Visuals")
	tog(s3, "FOV circle", "aim_circle", true)
	tog(s3, "Crosshair", "crosshair", false)
	tog(s3, "Highlight locked target", "aim_hl", true)
	tog(s3, "Target HUD", "aim_hud", true)
end

-- COMBAT -------------------------------------------------------------
do
	local P = newPage("Combat")
	local s = sec(P, "Combat")
	tog(s, "Triggerbot", "trig_on", false)
	sld(s, "Trigger delay (s)", "trig_delay", 0, 0.5, 0.05, 0.01)
	tog(s, "Hitbox expander", "hb_on", false)
	sld(s, "Hitbox size", "hb_size", 2, 25, 6, 1)
	info(s, "Hitbox and triggerbot behave differently per game; some anti-cheats detect them.", 36)
end

-- ESP ----------------------------------------------------------------
do
	local P = newPage("ESP")
	local s = sec(P, "ESP")
	tog(s, "Enabled", "esp_on", false, function(v) if UI.esp_on_q then F.esp_on_q = v end end)
	tog(s, "Names", "esp_name", true)
	tog(s, "Distance", "esp_dist", true)
	tog(s, "Health bar", "esp_hp", true)
	tog(s, "Boxes", "esp_box", true)
	tog(s, "Tracers", "esp_tracers", false)
	tog(s, "Chams", "esp_chams", false)
	tog(s, "Hide teammates", "esp_team", false)
	if Profile.name == "MM2" then tog(s, "Role colors (MM2)", "mm2_roles", true) else F.mm2_roles = false end
	sld(s, "Max distance", "esp_max", 100, 3000, 1500, 50)
end

-- PLAYERS ------------------------------------------------------------
local PlayersBody
do
	local P = newPage("Players")
	local s = sec(P, "Players")
	btn(s, "Refresh list", function() if genv.__EkoRefreshPlayers then genv.__EkoRefreshPlayers() end end, "Refresh")
	PlayersBody = sec(P, "In server")
end

-- PLAYER / MISC ------------------------------------------------------
do
	local P = newPage("Player")
	local s = sec(P, "Movement")
	tog(s, "Speed", "speed_on", false); sld(s, "Walk speed", "speed", 16, 200, 32, 1)
	tog(s, "Jump power", "jump_on", false); sld(s, "Jump", "jump", 50, 300, 90, 1)
	tog(s, "Fly", "fly_on", false, function(v) if not v then genv.__EkoClean() end end); sld(s, "Fly speed", "fly_speed", 10, 200, 60, 1)
	tog(s, "Noclip", "noclip", false)
	tog(s, "Bunny hop", "bhop", false)
	tog(s, "Shiftlock (mobile)", "shiftlock", false)
	sld(s, "Gravity", "gravity", 20, 300, workspace.Gravity, 1, function(v) workspace.Gravity = v end)
	local s2 = sec(P, "World")
	tog(s2, "Fullbright", "fullbright", false, function(v)
		if v then Lighting.Brightness = 2; Lighting.ClockTime = 14; Lighting.GlobalShadows = false; Lighting.Ambient = Color3.new(1, 1, 1); Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
		else for _, k in ipairs({ "Brightness", "ClockTime", "GlobalShadows", "Ambient", "OutdoorAmbient" }) do Lighting[k] = origLight[k] end end
	end)
	tog(s2, "Remove fog", "nofog", false, function(v) if v then Lighting.FogEnd = 1e6 else Lighting.FogEnd = origLight.FogEnd end end)
	sld(s2, "Time of day", "tod", 0, 24, origLight.ClockTime, 0.25, function(v) Lighting.ClockTime = v end)
	local s3 = sec(P, "Utility")
	tog(s3, "Anti-AFK", "antiafk", true)
	tog(s3, "Radar minimap", "radar", false)
	tog(s3, "Watermark", "wm", true)
	tog(s3, "FPS chip", "fps", true)
	tog(s3, "Touch quick pad", "touchpad", UIS.TouchEnabled)
end

-- GAME ---------------------------------------------------------------
do
	local P = newPage("Game")
	local s = sec(P, Profile.name .. " profile")
	info(s, Profile.note, 36)
	btn(s, "Apply preset", function() applyPreset(Profile) end, "Apply")
	local s2 = sec(P, "Detected")
	local r = row(s2, "Game"); local l = label(r, gameName, 12, T.sub, Enum.Font.GothamMedium, Enum.TextXAlignment.Right); l.AnchorPoint = Vector2.new(1, 0); l.Position = UDim2.new(1, -12, 0, 0); l.Size = UDim2.fromOffset(160, 38)
	local r2 = row(s2, "PlaceId"); local l2 = label(r2, tostring(game.PlaceId), 12, T.sub, Enum.Font.GothamMedium, Enum.TextXAlignment.Right); l2.AnchorPoint = Vector2.new(1, 0); l2.Position = UDim2.new(1, -12, 0, 0); l2.Size = UDim2.fromOffset(160, 38)
end

-- CONFIGS ------------------------------------------------------------
local Slots = { "Default", "PvP", "Farm", "Stealth", "Stream" }
genv.EkoConfigs = genv.EkoConfigs or {}
local function saveCfg(slot)
	local data = {}
	for k, v in pairs(F) do if type(v) ~= "table" then data[k] = v end end
	local json = HttpService:JSONEncode(data)
	genv.EkoConfigs[slot] = json
	pcall(function() if makefolder and not isfolder("Eko") then makefolder("Eko") end; if writefile then writefile("Eko/" .. slot .. ".json", json) end end)
end
local function loadCfg(slot)
	local json = genv.EkoConfigs[slot]
	pcall(function() if isfile and isfile("Eko/" .. slot .. ".json") then json = readfile("Eko/" .. slot .. ".json") end end)
	if not json then return end
	local ok, data = pcall(function() return HttpService:JSONDecode(json) end)
	if ok then for k, v in pairs(data) do if UI[k] then pcall(UI[k], v) end end end
end
do
	local P = newPage("Configs")
	local s = sec(P, "Slots")
	for _, slot in ipairs(Slots) do
		local r = row(s, slot)
		local function mini(txt, x, cb)
			local b = new("TextButton", { Text = txt, TextSize = 12, Font = Enum.Font.GothamMedium, TextColor3 = T.text, BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.9, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, x, 0.5, 0), Size = UDim2.fromOffset(56, 26), AutoButtonColor = false, Parent = r }); rd(b, 8)
			conn(b.Activated, function() pcall(cb) end)
		end
		mini("Save", -10, function() saveCfg(slot) end)
		mini("Load", -72, function() loadCfg(slot) end)
	end
end

-- SETTINGS -----------------------------------------------------------
local SkyBody, WPBody
local Skies = {
	Nebula = { faces = { 171410628, 171410649, 171410620, 171410666, 171410657, 171410636 } },
	["Purple Nebula"] = { faces = { 159454299, 159454296, 159454293, 159454286, 159454300, 159454288 } },
	["Orange Nebula"] = { faces = { 171410628, 171410649, 171410620, 171410666, 171410657, 171410636 }, tint = Color3.fromRGB(255, 170, 110) },
	Night = { faces = { 171410628, 171410649, 171410620, 171410666, 171410657, 171410636 }, tint = Color3.fromRGB(150, 170, 255), clock = 0 },
	Space = { faces = { 159454299, 159454296, 159454293, 159454286, 159454300, 159454288 }, tint = Color3.fromRGB(210, 225, 255), clock = 0 },
	Sunset = { faces = { 600830446, 600831635, 600832720, 600886090, 600833862, 600835177 }, tint = Color3.fromRGB(255, 190, 150), clock = 18 },
	Clouds = { faces = { 600830446, 600831635, 600832720, 600886090, 600833862, 600835177 }, clock = 14 },
}
local SkyOrder = { "Nebula", "Purple Nebula", "Orange Nebula", "Night", "Space", "Sunset", "Clouds" }
local function applySky(name)
	pcall(function()
		for _, o in ipairs(Lighting:GetChildren()) do
			if o:IsA("Sky") and o.Name ~= "EkoSky" then origSky[o] = true; o.Parent = nil end
		end
		for _, n in ipairs({ "EkoSky", "EkoTint" }) do local o = Lighting:FindFirstChild(n); if o then o:Destroy() end end
		local d = Skies[name]; if not d then return end
		local f = d.faces
		new("Sky", { Name = "EkoSky", SkyboxBk = "rbxassetid://" .. f[1], SkyboxDn = "rbxassetid://" .. f[2], SkyboxFt = "rbxassetid://" .. f[3], SkyboxLf = "rbxassetid://" .. f[4], SkyboxRt = "rbxassetid://" .. f[5], SkyboxUp = "rbxassetid://" .. f[6], StarCount = 0, Parent = Lighting })
		if d.tint then new("ColorCorrectionEffect", { Name = "EkoTint", TintColor = d.tint, Parent = Lighting }) end
		if d.clock then Lighting.ClockTime = d.clock end
	end)
end
local function resetSky()
	for _, n in ipairs({ "EkoSky", "EkoTint" }) do local o = Lighting:FindFirstChild(n); if o then o:Destroy() end end
	for o in pairs(origSky) do pcall(function() o.Parent = Lighting end) end
	origSky = {}
end

local wps = {}
local function rebuildWP()
	if not WPBody then return end
	for _, c in ipairs(WPBody:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end
	Building = nil
	for i, w in ipairs(wps) do
		local r = row(WPBody, w.name)
		local function mini(txt, x, cb)
			local b = new("TextButton", { Text = txt, TextSize = 12, Font = Enum.Font.GothamMedium, TextColor3 = T.text, BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.9, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, x, 0.5, 0), Size = UDim2.fromOffset(46, 26), AutoButtonColor = false, Parent = r }); rd(b, 8)
			conn(b.Activated, cb)
		end
		mini("Del", -10, function() table.remove(wps, i); rebuildWP() end)
		mini("TP", -62, function() pcall(function() LP.Character:PivotTo(w.cf) end) end)
	end
end

local ThemeHues = { Amethyst = 0.74, Ocean = 0.56, Rose = 0.93, Emerald = 0.4, Ember = 0.06, Mono = -1 }
local function hueAccent(h) return h < 0 and Color3.fromRGB(235, 235, 240) or Color3.fromHSV(h, 0.5, 1) end

do
	local P = newPage("Settings")
	local s = sec(P, "Menu")
	bind(s, "Menu key", "menukey", "RightShift")
	tog(s, "Background blur", "blur", true, function(v) if isOpen then tw(blur, 0.3, { Size = v and (F.blur_amt or 8) or 0 }) end end)
	sld(s, "Blur amount", "blur_amt", 0, 24, 8, 1, function(v) if isOpen and F.blur then blur.Size = v end end)
	sld(s, "Glass opacity", "glass", 0, 0.6, 0.1, 0.01, function(v) Win.BackgroundTransparency = v end)
	sld(s, "UI scale", "uiscale", 0.5, 1.2, 1, 0.05, function(v) baseScale = math.clamp(math.min(Cam.ViewportSize.X / (W0 + 60), Cam.ViewportSize.Y / (H0 + 40)), 0.45, 1.1) * v; UIs.Scale = baseScale end)
	local s2 = sec(P, "Theme")
	opt(s2, "Theme", "theme", { "Amethyst", "Ocean", "Rose", "Emerald", "Ember", "Mono" }, "Amethyst", function(v)
		local h = ThemeHues[v]; if h and h >= 0 then T.hue = h end; setAccent(hueAccent(h))
		if h and h >= 0 and UI.hue then F.hue = h * 360 end
	end)
	sld(s2, "Accent hue", "hue", 0, 360, 266, 1, function(v) setAccent(Color3.fromHSV(v / 360, 0.5, 1)) end)
	opt(s2, "Background FX", "fx", FXList, "Stars", function(v) setFX(v) end)
	local s3 = sec(P, "Skybox")
	opt(s3, "Preset", "sky", SkyOrder, "Nebula")
	btn(s3, "Apply skybox", function() applySky(F.sky) end, "Apply")
	btn(s3, "Reset sky", resetSky, "Reset")
	local s4 = sec(P, "Lighting presets")
	local presets = {
		Default = function() for _, k in ipairs({ "Brightness", "ClockTime", "GlobalShadows", "Ambient", "OutdoorAmbient", "FogEnd" }) do Lighting[k] = origLight[k] end end,
		Bright = function() Lighting.Brightness = 3; Lighting.ClockTime = 13; Lighting.GlobalShadows = false end,
		Dusk = function() Lighting.ClockTime = 18.4; Lighting.Brightness = 1.6; Lighting.OutdoorAmbient = Color3.fromRGB(120, 90, 110) end,
		Midnight = function() Lighting.ClockTime = 0; Lighting.Brightness = 0.8; Lighting.OutdoorAmbient = Color3.fromRGB(40, 45, 80) end,
	}
	opt(s4, "Lighting", "lightpreset", { "Default", "Bright", "Dusk", "Midnight" }, "Default", function(v) pcall(presets[v]) end)
	local s5 = sec(P, "Waypoints")
	btn(s5, "Save current position", function()
		local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
		if hrp then wps[#wps + 1] = { name = "Waypoint " .. (#wps + 1), cf = hrp.CFrame }; rebuildWP() end
	end, "Save")
	WPBody = new("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = lo(), Parent = P })
	new("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder, Parent = WPBody })
	local s6 = sec(P, "Danger zone")
	btn(s6, "Unload Eko", function() genv.EkoUnload() end, "Unload")
end

----------------------------------------------------------------------
-- TABS (sidebar) + page switching + search
----------------------------------------------------------------------
local TabBtns, current = {}, nil
local function relayout()
	local i = 0
	for _, name in ipairs(PageOrder) do
		local b = TabBtns[name].Btn
		if b.Visible then b.Position = UDim2.fromOffset(0, i * 38); i += 1 end
	end
end
local function select(name)
	if not Pages[name] then return end
	local first = current == nil
	current = name
	Title.Text = name
	for n, sf in pairs(Pages) do sf.Visible = (n == name) end
	local pg = Pages[name]
	pg.CanvasPosition = Vector2.new(0, 0)
	local show = pvOn
	pg.Size = UDim2.new(1, show and -232 or -24, 1, -64)
	if not first then
		pg.Position = UDim2.fromOffset(12, 70); tw(pg, 0.4, { Position = UDim2.fromOffset(12, 56) })
	end
	local b = TabBtns[name]
	if b then tw(Pill, first and 0 or 0.35, { Position = b.Btn.Position }, Enum.EasingStyle.Quint) end
	for n, tb in pairs(TabBtns) do
		local on = n == name
		tw(tb.Lbl, 0.2, { TextColor3 = on and T.text or T.sub }); if tb.Ico:IsA("TextLabel") then tw(tb.Ico, 0.2, { TextColor3 = on and T.accent or T.sub }) end
		tw(tb.Arrow, 0.2, { TextTransparency = on and 0 or 1 })
	end
	FSearch.Text = ""
end

for idx, name in ipairs(PageOrder) do
	local b = new("TextButton", { Text = "", BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 34), Position = UDim2.fromOffset(0, (idx - 1) * 38), AutoButtonColor = false, ZIndex = 2, Parent = TabList })
	local ico
	if ICONID[name] then ico = new("ImageLabel", { BackgroundTransparency = 1, Image = ICONID[name], Position = UDim2.fromOffset(12, 8), Size = UDim2.fromOffset(18, 18), ImageColor3 = T.sub, Parent = b })
	else ico = label(b, GLYPH[name] or "•", 15, T.sub, Enum.Font.GothamBold, Enum.TextXAlignment.Center); ico.Position = UDim2.fromOffset(10, 0); ico.Size = UDim2.fromOffset(22, 34) end
	local lbl = label(b, name, 13, T.sub, Enum.Font.GothamMedium); lbl.Position = UDim2.fromOffset(40, 0); lbl.Size = UDim2.new(1, -70, 1, 0)
	local arrow = label(b, "›", 18, T.text, Enum.Font.GothamBold, Enum.TextXAlignment.Right); arrow.Size = UDim2.new(1, -10, 1, 0); arrow.TextTransparency = 1
	TabBtns[name] = { Lbl = lbl, Ico = ico, Arrow = arrow, Btn = b }
	conn(b.Activated, function() select(name) end)
	conn(b.MouseEnter, function() if current ~= name then tw(lbl, 0.15, { TextColor3 = T.text }) end end)
	conn(b.MouseLeave, function() if current ~= name then tw(lbl, 0.15, { TextColor3 = T.sub }) end end)
end
conn(SSearch:GetPropertyChangedSignal("Text"), function()
	local q = SSearch.Text:lower()
	for name, t in pairs(TabBtns) do t.Btn.Visible = (q == "" or name:lower():find(q, 1, true) ~= nil) end
	relayout()
	if current and TabBtns[current] and TabBtns[current].Btn.Visible then Pill.Position = TabBtns[current].Btn.Position end
end)
conn(FSearch:GetPropertyChangedSignal("Text"), function()
	local q = FSearch.Text:lower()
	for _, r in ipairs(Rows[current] or {}) do r[1].Visible = (q == "" or r[2]:find(q, 1, true) ~= nil) end
end)

----------------------------------------------------------------------
-- PLAYERS LIST
----------------------------------------------------------------------
local spectating
genv.__EkoRefreshPlayers = function()
	for _, c in ipairs(PlayersBody:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end
	local prev = Building; Building = nil
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP then
			local r = row(PlayersBody, p.DisplayName .. "  @" .. p.Name)
			r:FindFirstChildOfClass("TextLabel").Size = UDim2.new(0.5, 0, 0, 38); r:FindFirstChildOfClass("TextLabel").TextTruncate = Enum.TextTruncate.AtEnd
			local function mini(txt, x, cb)
				local b = new("TextButton", { Text = txt, TextSize = 12, Font = Enum.Font.GothamMedium, TextColor3 = T.text, BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.9, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, x, 0.5, 0), Size = UDim2.fromOffset(52, 26), AutoButtonColor = false, Parent = r }); rd(b, 8)
				conn(b.Activated, function() pcall(cb) end)
			end
			mini("TP", -10, function() LP.Character:PivotTo(p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)) end)
			mini("View", -68, function()
				if spectating == p then spectating = nil; Cam.CameraSubject = LP.Character.Humanoid
				else spectating = p; Cam.CameraSubject = p.Character.Humanoid end
			end)
		end
	end
	Building = prev
end
conn(Players.PlayerAdded, function() task.wait(0.5); pcall(genv.__EkoRefreshPlayers) end)
conn(Players.PlayerRemoving, function() task.wait(0.2); pcall(genv.__EkoRefreshPlayers) end)
pcall(genv.__EkoRefreshPlayers)

----------------------------------------------------------------------
-- IN-WORLD OVERLAYS (ESP / aimbot / HUD)
----------------------------------------------------------------------
local OV = new("ScreenGui", { Name = "EkoOverlay", ResetOnSpawn = false, IgnoreGuiInset = true, DisplayOrder = 50, Parent = GuiParent })
local ESP = {}
local function espMake(plr)
	local o = {}
	o.box = new("Frame", { BackgroundTransparency = 1, Visible = false, Parent = OV }); o.stroke = new("UIStroke", { Color = ESPCOL, Thickness = 1.5, Parent = o.box })
	o.name = new("TextLabel", { BackgroundTransparency = 1, TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamMedium, TextSize = 12, TextStrokeTransparency = 0.5, Size = UDim2.fromOffset(160, 14), AnchorPoint = Vector2.new(0.5, 1), Visible = false, Parent = OV })
	o.hpbg = new("Frame", { BackgroundColor3 = Color3.fromRGB(15, 15, 15), BorderSizePixel = 0, Visible = false, Parent = OV })
	o.hp = new("Frame", { AnchorPoint = Vector2.new(0, 1), Position = UDim2.fromScale(0, 1), BackgroundColor3 = ESPCOL, BorderSizePixel = 0, Parent = o.hpbg })
	o.line = new("Frame", { BackgroundColor3 = ESPCOL, BorderSizePixel = 0, Visible = false, Parent = OV })
	o.hl = new("Highlight", { FillTransparency = 0.5, OutlineTransparency = 0, DepthMode = Enum.HighlightDepthMode.AlwaysOnTop, Enabled = false, Parent = OV })
	ESP[plr] = o; return o
end
local function espKill(plr)
	local o = ESP[plr]; if not o then return end
	for _, v in pairs(o) do if typeof(v) == "Instance" then v:Destroy() end end
	ESP[plr] = nil
end
conn(Players.PlayerRemoving, espKill)

local function roleColor(plr)
	if not (F.mm2_roles and Profile.name == "MM2") then return ESPCOL end
	local function has(n)
		return (plr.Character and plr.Character:FindFirstChild(n)) or (plr:FindFirstChild("Backpack") and plr.Backpack:FindFirstChild(n))
	end
	if has("Knife") then return Color3.fromRGB(255, 70, 70) end
	if has("Gun") then return Color3.fromRGB(80, 150, 255) end
	return ESPCOL
end

local function validChar(plr)
	local ch = plr.Character; if not ch then return end
	local hum, hrp = ch:FindFirstChildOfClass("Humanoid"), ch:FindFirstChild("HumanoidRootPart")
	if hum and hrp and hum.Health > 0 then return ch, hum, hrp end
end
local function sameTeam(plr) return plr.Team ~= nil and plr.Team == LP.Team end

-- aimbot visuals
local FOVC = new("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, Visible = false, Parent = OV }); rd(FOVC, 9999)
local FOVS = stroke(FOVC, T.accent, 0.35, 1.5); onAccent(function(c) FOVS.Color = c end)
local LockHL = new("Highlight", { FillTransparency = 0.55, OutlineTransparency = 0, DepthMode = Enum.HighlightDepthMode.AlwaysOnTop, Enabled = false, Parent = OV }); onAccent(function(c) LockHL.FillColor = c; LockHL.OutlineColor = c end)
local XH = new("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(24, 24), BackgroundTransparency = 1, Visible = false, Parent = OV })
local xhParts = {}
for _, d in ipairs({ { 0.5, 0, 2, 8 }, { 0.5, 1, 2, 8 }, { 0, 0.5, 8, 2 }, { 1, 0.5, 8, 2 } }) do
	local f = new("Frame", { AnchorPoint = Vector2.new(d[1], d[2]), Position = UDim2.fromScale(d[1], d[2]), Size = UDim2.fromOffset(d[3], d[4]), BorderSizePixel = 0, BackgroundColor3 = T.accent, Parent = XH })
	xhParts[#xhParts + 1] = f
end
onAccent(function(c) for _, f in ipairs(xhParts) do f.BackgroundColor3 = c end end)

local HUD = new("Frame", { AnchorPoint = Vector2.new(0.5, 1), Position = UDim2.new(0.5, 0, 1, -90), Size = UDim2.fromOffset(230, 58), BackgroundColor3 = Color3.fromRGB(9, 9, 12), BackgroundTransparency = 0.2, Visible = false, Parent = OV }); rd(HUD, 12); stroke(HUD, Color3.new(1, 1, 1), 0.85)
local HUDImg = new("ImageLabel", { Position = UDim2.fromOffset(8, 8), Size = UDim2.fromOffset(42, 42), BackgroundColor3 = Color3.fromRGB(28, 28, 34), Parent = HUD }); rd(HUDImg, 21)
local HUDName = label(HUD, "", 13, T.text, Enum.Font.GothamBold); HUDName.Position = UDim2.fromOffset(58, 8); HUDName.Size = UDim2.new(1, -66, 0, 16)
local HUDSub = label(HUD, "", 11, T.sub, Enum.Font.Gotham); HUDSub.Position = UDim2.fromOffset(58, 24); HUDSub.Size = UDim2.new(1, -66, 0, 14)
local HUDBg = new("Frame", { Position = UDim2.fromOffset(58, 42), Size = UDim2.new(1, -68, 0, 5), BackgroundColor3 = Color3.fromRGB(50, 50, 58), BorderSizePixel = 0, Parent = HUD }); rd(HUDBg, 3)
local HUDHp = new("Frame", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = ESPCOL, BorderSizePixel = 0, Parent = HUDBg }); rd(HUDHp, 3)

-- chips: fps + watermark
local Chip = new("Frame", { AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 10), Size = UDim2.fromOffset(200, 26), BackgroundColor3 = Color3.fromRGB(9, 9, 12), BackgroundTransparency = 0.2, Parent = OV }); rd(Chip, 13); stroke(Chip, Color3.new(1, 1, 1), 0.88)
local ChipL = label(Chip, "eko", 12, T.text, Enum.Font.GothamMedium, Enum.TextXAlignment.Center); ChipL.Size = UDim2.fromScale(1, 1)

-- radar
local Radar = new("Frame", { Position = UDim2.new(0, 14, 1, -150), Size = UDim2.fromOffset(120, 120), BackgroundColor3 = Color3.fromRGB(9, 9, 12), BackgroundTransparency = 0.25, Visible = false, ClipsDescendants = true, Parent = OV }); rd(Radar, 60); stroke(Radar, T.accent, 0.4, 1.5)
local RadarMe = new("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(6, 6), BackgroundColor3 = Color3.new(1, 1, 1), Parent = Radar }); rd(RadarMe, 3)
local RadarDots = {}

-- touch quick pad
local Pad = new("Frame", { AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -12, 0.5, 0), Size = UDim2.fromOffset(46, 160), BackgroundTransparency = 1, Visible = false, Parent = OV })
new("UIListLayout", { Padding = UDim.new(0, 8), Parent = Pad })
for _, q in ipairs({ { "AIM", "aim_on" }, { "ESP", "esp_on" }, { "FLY", "fly_on" } }) do
	local b = new("TextButton", { Text = q[1], TextSize = 11, Font = Enum.Font.GothamBold, TextColor3 = T.text, Size = UDim2.fromOffset(46, 46), BackgroundColor3 = Color3.fromRGB(12, 12, 16), BackgroundTransparency = 0.15, AutoButtonColor = false, Parent = Pad }); rd(b, 23)
	local st = stroke(b, T.accent, 0.4, 1.5); onAccent(function(c) st.Color = c end)
	conn(b.Activated, function() if UI[q[2]] then UI[q[2]](not F[q[2]]) end end)
end

----------------------------------------------------------------------
-- MAIN LOOPS
----------------------------------------------------------------------
local locked, flyBV, flyBG = nil, nil, nil
local hbOrig = {}
local lastTrig, fpsAcc, fpsN, fpsShown = 0, 0, 0, 60

genv.__EkoClean = function()
	if flyBV then flyBV:Destroy(); flyBV = nil end
	if flyBG then flyBG:Destroy(); flyBG = nil end
end

local function aimPart(ch)
	local n = F.aim_part
	if n == "Head" then return ch:FindFirstChild("Head") end
	if n == "Torso" then return ch:FindFirstChild("UpperTorso") or ch:FindFirstChild("Torso") or ch:FindFirstChild("HumanoidRootPart") end
	return ch:FindFirstChild("HumanoidRootPart")
end
local function visibleTo(part, ch)
	local rp = RaycastParams.new(); rp.FilterType = Enum.RaycastFilterType.Exclude; rp.FilterDescendantsInstances = { LP.Character, ch, Cam }
	local o = Cam.CFrame.Position
	return workspace:Raycast(o, part.Position - o, rp) == nil
end
local function originPt() return UIS.MouseEnabled and UIS:GetMouseLocation() or (Cam.ViewportSize / 2) end

local function aimStep()
	local vs = Cam.ViewportSize
	local org = originPt()
	local active = F.aim_on and (not F.aim_rmb or not UIS.MouseEnabled or UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2))
	FOVC.Visible = F.aim_on and F.aim_circle
	FOVC.Size = UDim2.fromOffset(F.aim_fov * 2, F.aim_fov * 2); FOVC.Position = UDim2.fromOffset(org.X, org.Y)
	XH.Visible = F.crosshair; XH.Position = UDim2.fromOffset(vs.X / 2, vs.Y / 2)
	if not active then
		locked = nil
	else
		local keep = false
		if locked and F.aim_sticky then
			local ch, hum = validChar(locked)
			keep = ch ~= nil
		end
		if not keep then
			local best, bs = nil, math.huge
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr ~= LP and not (F.aim_team and sameTeam(plr)) then
					local ch, hum, hrp = validChar(plr)
					if ch then
						local part = aimPart(ch)
						if part then
							local sp, on = Cam:WorldToViewportPoint(part.Position)
							local d2 = (Vector2.new(sp.X, sp.Y) - org).Magnitude
							if on and d2 <= F.aim_fov and (not F.aim_wall or visibleTo(part, ch)) then
								local score = d2
								if F.aim_prio == "Distance" then score = (part.Position - Cam.CFrame.Position).Magnitude
								elseif F.aim_prio == "Lowest HP" then score = hum.Health end
								if score < bs then best, bs = plr, score end
							end
						end
					end
				end
			end
			locked = best
		end
		if locked then
			local ch, hum, hrp = validChar(locked)
			local part = ch and aimPart(ch)
			if part then
				local pos = part.Position + part.AssemblyLinearVelocity * F.aim_pred
				local alpha = math.clamp((100 - F.aim_smooth) / 100, 0.04, 1)
				Cam.CFrame = Cam.CFrame:Lerp(CFrame.lookAt(Cam.CFrame.Position, pos), alpha)
			end
		end
	end
	-- lock visuals + HUD
	local ch, hum, hrp
	if locked then ch, hum, hrp = validChar(locked) end
	LockHL.Enabled = ch ~= nil and F.aim_hl
	if ch then LockHL.Adornee = ch end
	HUD.Visible = ch ~= nil and F.aim_hud
	if ch then
		HUDName.Text = locked.DisplayName
		HUDImg.Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150"):format(locked.UserId)
		HUDSub.Text = ("%d studs  ·  %s"):format(math.floor((hrp.Position - Cam.CFrame.Position).Magnitude), F.aim_part == "Head" and "Headshot" or F.aim_part)
		local a = math.clamp(hum.Health / math.max(hum.MaxHealth, 1), 0, 1)
		HUDHp.Size = UDim2.fromScale(a, 1); HUDHp.BackgroundColor3 = Color3.fromRGB(255, 70, 70):Lerp(ESPCOL, a)
	end
end

local function espStep()
	local vs = Cam.ViewportSize
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LP then
			local o = ESP[plr] or espMake(plr)
			local ch, hum, hrp = validChar(plr)
			local show = F.esp_on and ch ~= nil and not (F.esp_team and sameTeam(plr))
			local top, bot, on
			if show then
				local dist = (hrp.Position - Cam.CFrame.Position).Magnitude
				if dist > F.esp_max then show = false
				else
					top = Cam:WorldToViewportPoint(hrp.Position + Vector3.new(0, 2.8, 0))
					bot = Cam:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3.2, 0))
					on = top.Z > 0
					show = on
					if show then
						local col = roleColor(plr)
						local h = math.abs(bot.Y - top.Y); local w = h * 0.55
						o.box.Visible = F.esp_box; o.box.Position = UDim2.fromOffset(top.X - w / 2, top.Y); o.box.Size = UDim2.fromOffset(w, h); o.stroke.Color = col
						o.name.Visible = F.esp_name or F.esp_dist
						o.name.Text = (F.esp_name and plr.DisplayName or "") .. ((F.esp_name and F.esp_dist) and "  " or "") .. (F.esp_dist and ("[" .. math.floor(dist) .. "]") or "")
						o.name.Position = UDim2.fromOffset(top.X, top.Y - 2)
						o.hpbg.Visible = F.esp_hp; o.hpbg.Position = UDim2.fromOffset(top.X - w / 2 - 6, top.Y); o.hpbg.Size = UDim2.fromOffset(3, h)
						o.hp.Size = UDim2.fromScale(1, math.clamp(hum.Health / math.max(hum.MaxHealth, 1), 0, 1))
						o.line.Visible = F.esp_tracers; o.line.BackgroundColor3 = col
						if F.esp_tracers then line(o.line, Vector2.new(vs.X / 2, vs.Y), Vector2.new(top.X, bot.Y), 1.2) end
						o.hl.Enabled = F.esp_chams; o.hl.Adornee = ch; o.hl.FillColor = col; o.hl.OutlineColor = Color3.new(1, 1, 1)
					end
				end
			end
			if not show then
				o.box.Visible, o.name.Visible, o.hpbg.Visible, o.line.Visible, o.hl.Enabled = false, false, false, false, false
			end
		end
	end
end

local function moveStep(dt)
	local ch = LP.Character; if not ch then return end
	local hum, hrp = ch:FindFirstChildOfClass("Humanoid"), ch:FindFirstChild("HumanoidRootPart")
	if not (hum and hrp) then return end
	local o = origHum[hum]
	if not o then o = { ws = hum.WalkSpeed, jp = hum.JumpPower, ujp = hum.UseJumpPower, ar = hum.AutoRotate }; origHum[hum] = o end
	if F.speed_on then hum.WalkSpeed = F.speed elseif hum.WalkSpeed ~= o.ws and o.modWS then hum.WalkSpeed = o.ws end
	o.modWS = F.speed_on
	if F.jump_on then hum.UseJumpPower = true; hum.JumpPower = F.jump elseif o.modJP then hum.UseJumpPower = o.ujp; hum.JumpPower = o.jp end
	o.modJP = F.jump_on
	if F.bhop and UIS:IsKeyDown(Enum.KeyCode.Space) and hum.FloorMaterial ~= Enum.Material.Air then hum.Jump = true end
	if F.shiftlock then
		hum.AutoRotate = false
		local look = Cam.CFrame.LookVector
		hrp.CFrame = CFrame.new(hrp.Position) * CFrame.Angles(0, math.atan2(-look.X, -look.Z), 0)
	elseif o.modSL then hum.AutoRotate = o.ar end
	o.modSL = F.shiftlock
	if F.fly_on then
		if not flyBV or flyBV.Parent ~= hrp then
			genv.__EkoClean()
			flyBV = new("BodyVelocity", { MaxForce = Vector3.new(1e9, 1e9, 1e9), Velocity = Vector3.zero, Parent = hrp })
			flyBG = new("BodyGyro", { MaxTorque = Vector3.new(1e9, 1e9, 1e9), P = 1e4, Parent = hrp })
		end
		local md, look = hum.MoveDirection, Cam.CFrame.LookVector
		local vel = md * F.fly_speed
		local flat = Vector3.new(look.X, 0, look.Z)
		if md.Magnitude > 0 and flat.Magnitude > 0 then vel += Vector3.new(0, look.Y, 0) * F.fly_speed * math.clamp(md:Dot(flat.Unit), 0, 1) end
		if UIS:IsKeyDown(Enum.KeyCode.Space) or (UIS.TouchEnabled and hum.Jump) then vel += Vector3.new(0, F.fly_speed, 0) end
		if UIS:IsKeyDown(Enum.KeyCode.LeftControl) or UIS:IsKeyDown(Enum.KeyCode.Q) then vel -= Vector3.new(0, F.fly_speed, 0) end
		flyBV.Velocity = vel; flyBG.CFrame = Cam.CFrame
	end
	-- hitbox expander
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LP then
			local c2, h2, r2 = validChar(plr)
			if r2 then
				if F.hb_on and not (F.aim_team and sameTeam(plr)) then
					if not hbOrig[r2] then hbOrig[r2] = { r2.Size, r2.Transparency, r2.CanCollide } end
					r2.Size = Vector3.new(F.hb_size, F.hb_size, F.hb_size); r2.Transparency = 0.75; r2.CanCollide = false
				elseif hbOrig[r2] then
					r2.Size, r2.Transparency, r2.CanCollide = hbOrig[r2][1], hbOrig[r2][2], hbOrig[r2][3]; hbOrig[r2] = nil
				end
			end
		end
	end
	-- triggerbot
	if F.trig_on and os.clock() - lastTrig > F.trig_delay then
		local tgt = LP:GetMouse().Target
		local m = tgt and tgt:FindFirstAncestorOfClass("Model")
		local plr = m and Players:GetPlayerFromCharacter(m)
		if plr and plr ~= LP and not (F.aim_team and sameTeam(plr)) then
			lastTrig = os.clock(); pcall(function() mouse1click() end)
		end
	end
end

local function radarStep()
	Radar.Visible = F.radar
	if not F.radar then return end
	local ch, _, hrp = validChar(LP)
	if not hrp then return end
	local yaw = math.atan2(-Cam.CFrame.LookVector.X, -Cam.CFrame.LookVector.Z)
	local i = 0
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LP then
			local c2, _, r2 = validChar(plr)
			if r2 then
				i += 1
				local d = RadarDots[i] or new("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(5, 5), Parent = Radar })
				if not RadarDots[i] then rd(d, 3); RadarDots[i] = d end
				local rel = r2.Position - hrp.Position
				local x = rel.X * math.cos(yaw) - rel.Z * math.sin(yaw)
				local z = rel.X * math.sin(yaw) + rel.Z * math.cos(yaw)
				local sx, sy = math.clamp(x / 150, -1, 1) * 54, math.clamp(z / 150, -1, 1) * 54
				d.Position = UDim2.new(0.5, sx, 0.5, sy); d.Visible = true
				d.BackgroundColor3 = sameTeam(plr) and Color3.fromRGB(90, 160, 255) or Color3.fromRGB(255, 80, 80)
			end
		end
	end
	for j = i + 1, #RadarDots do RadarDots[j].Visible = false end
end

-- preview animation
local spin = 0
local function previewStep(t, dt)
	if not pvOn then return end
	spin += dt * 0.9
	if avatar and avCenter and avDist then
		pcall(function() avatar:PivotTo(CFrame.new(0, 0, 0) * CFrame.Angles(0, spin, 0)) end)
		VCam.CFrame = CFrame.lookAt(avCenter + Vector3.new(0, 0.2, -avDist), avCenter)
	end
	local pulse = (t * 0.8) % 1
	PRing1.Size = UDim2.fromOffset(34 + pulse * 40, 34 + pulse * 40); PRing1S.Transparency = 0.2 + pulse * 0.8
	local p2 = (t * 0.8 + 0.5) % 1
	PRing2.Size = UDim2.fromOffset(34 + p2 * 40, 34 + p2 * 40); PRing2S.Transparency = 0.2 + p2 * 0.8
	PGlow.ImageTransparency = 0.5 + 0.12 * math.sin(t * 1.6)
	if PTracer.Visible then
		local sz = Stage.AbsoluteSize / UIs.Scale
		line(PTracer, Vector2.new(sz.X * 0.5, sz.Y), Vector2.new(sz.X * 0.5, sz.Y * 0.52 + sz.Y * 0.39), 1.5)
		line(PTracer, Vector2.new(sz.X * 0.08, sz.Y), Vector2.new(sz.X * 0.5, sz.Y * 0.9), 1.5)
	end
end

conn(RS.RenderStepped, function(dt)
	local t = os.clock()
	pcall(function() if fxUpdate and Holder.Visible then fxUpdate(t, dt) end end)
	pcall(previewStep, t, dt)
	pcall(espStep); pcall(radarStep)
	pcall(function()
		fpsAcc += dt; fpsN += 1
		if fpsAcc >= 0.5 then fpsShown = math.floor(fpsN / fpsAcc + 0.5); fpsAcc, fpsN = 0, 0 end
		local parts = {}
		if F.wm then parts[#parts + 1] = "eko" end
		if F.fps then parts[#parts + 1] = fpsShown .. " fps" end
		Chip.Visible = #parts > 0
		ChipL.Text = table.concat(parts, "  ·  ")
		Chip.Size = UDim2.fromOffset(math.max(70, #ChipL.Text * 7 + 24), 26)
		Pad.Visible = F.touchpad and UIS.TouchEnabled
		if genv.__EkoFpsLabel then genv.__EkoFpsLabel.Text = fpsShown .. " fps" end
	end)
end)
pcall(function() RS:BindToRenderStep("EkoAim", Enum.RenderPriority.Camera.Value + 1, function() pcall(aimStep) end) end)
conn(RS.Heartbeat, function(dt) pcall(moveStep, dt) end)
conn(RS.Stepped, function()
	if F.noclip and LP.Character then
		for _, p in ipairs(LP.Character:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end
	end
end)
conn(LP.Idled, function() if F.antiafk then pcall(function() VU:CaptureController(); VU:ClickButton2(Vector2.new()) end) end end)

----------------------------------------------------------------------
-- INPUT
----------------------------------------------------------------------
conn(UIS.InputBegan, function(i, gp)
	if listening and i.UserInputType == Enum.UserInputType.Keyboard then
		local f = listening; listening = nil; f(i.KeyCode.Name); return
	end
	if UIS:GetFocusedTextBox() then return end
	if i.UserInputType == Enum.UserInputType.Keyboard and i.KeyCode.Name == F.menukey then setOpen(not isOpen) end
end)

----------------------------------------------------------------------
-- UNLOAD
----------------------------------------------------------------------
genv.EkoUnload = function()
	alive = false
	pcall(function() RS:UnbindFromRenderStep("EkoAim") end)
	for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
	pcall(genv.__EkoClean)
	pcall(function()
		local ch = LP.Character
		local hum = ch and ch:FindFirstChildOfClass("Humanoid")
		local o = hum and origHum[hum]
		if o then hum.WalkSpeed = o.ws; hum.UseJumpPower = o.ujp; hum.JumpPower = o.jp; hum.AutoRotate = o.ar end
		for _, p in ipairs(ch and ch:GetDescendants() or {}) do if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then p.CanCollide = p.CanCollide end end
		Cam.CameraSubject = hum
	end)
	for part, v in pairs(hbOrig) do pcall(function() part.Size, part.Transparency, part.CanCollide = v[1], v[2], v[3] end) end
	pcall(function() workspace.Gravity = origGravity end)
	pcall(function() for k, v in pairs(origLight) do Lighting[k] = v end end)
	pcall(resetSky)
	pcall(function() blur:Destroy() end)
	pcall(function() OV:Destroy() end)
	pcall(function() Gui:Destroy() end)
	genv.EkoUnload, genv.__EkoClean, genv.__EkoRefreshPlayers, genv.__EkoFpsLabel = nil, nil, nil, nil
end

----------------------------------------------------------------------
-- BOOT (no startup card: straight into the detected profile)
----------------------------------------------------------------------
UI.hue(266)
UI.theme("Amethyst")
UI.fx("Stars")
select("Home")
Holder.Visible = true
setOpen(true)
refreshPreview()
