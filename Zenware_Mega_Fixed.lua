--[[ EKO MEGA | PART 1 of 3 (paste Part 1, Part 2, Part 3 into ONE script) ]]
local P,RS,UIS,TS,HS,Lt,MP=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("TweenService"),game:GetService("HttpService"),game:GetService("Lighting"),game:GetService("MarketplaceService")
local TXS,VIM,AES=game:GetService("TextService"),game:GetService("VirtualInputManager"),game:GetService("AvatarEditorService")
local LP,G=P.LocalPlayer,(getgenv and getgenv()) or _G
local function gp() local r=LP:WaitForChild("PlayerGui") pcall(function() r=(gethui and gethui()) or game:GetService("CoreGui") end) return r end
pcall(function() game:GetService("StarterGui"):SetCore("SendNotification",{Title="Eko",Text="Loading Eko..."}) end)
local function boot(force)
local ok,e=pcall(function()
if G.Eko then pcall(G.Eko) end
local par=gp()
for _,g in ipairs(par:GetChildren()) do if g.Name=="EkoGui" then g:Destroy() end end
local rgb=Color3.fromRGB
local WH,BLK=rgb(254,254,254),Color3.new(0,0,0)
local XL,XR,TE=Enum.TextXAlignment.Left,Enum.TextXAlignment.Right,Enum.TextTruncate.AtEnd
local function kp(t,c) return ColorSequenceKeypoint.new(t,c) end
local function AV(id) return "rbxthumb://type=AvatarHeadShot&id="..tostring(id).."&w=150&h=150" end
local T,TH,PK,Th,X,PG,REP,ST,U={}, {}, {}, {names={},pnames={},fxn={}}, {}, {}, {}, {theme="Black",pack="Clean",corner="Soft",shape="Wide",fx="Stars",hue=.55,opac=.97},{}
X.holds,X.meta,X.wp,X.accR={}, {}, {}, {}
-- ===== THEMES / FONTS =====
local function mk(bg,ac,lt)
	local m=lt and BLK or WH
	local lum=ac.R*.299+ac.G*.587+ac.B*.114
	return {BG=bg,RW=bg:Lerp(m,lt and .05 or .06),RB=bg:Lerp(m,lt and .12 or .14),OF=bg:Lerp(m,.22),TR=bg:Lerp(m,lt and .17 or .18),
		TX=lt and rgb(20,20,24) or rgb(240,240,240),DIM=lt and rgb(110,110,120) or rgb(150,150,160),AC=ac,OA=lum>.55 and BLK or WH}
end
local function c3(s) local r,g,b=s:match("(%d+),(%d+),(%d+)") return rgb(tonumber(r),tonumber(g),tonumber(b)) end
for l in ([[Black 6,6,8 235,235,245
White 246,246,248 40,40,48 L
Rainbow 8,8,8 255,70,70
Midnight 8,10,24 80,140,255
Crimson 16,6,8 235,50,70
Emerald 5,16,10 40,215,120
Amethyst 14,8,22 170,100,255
Ocean 5,14,20 40,200,230
Sunset 20,8,10 255,130,60
Rose 20,8,14 255,100,170
Gold 14,12,6 240,195,60
Slate 24,26,32 120,160,200
Cyber 10,6,20 255,40,170
Mint 6,18,16 110,240,200
Lava 22,6,4 255,80,30
Matrix 2,10,4 40,255,90
Dracula 24,20,32 189,147,249
Nord 36,41,51 136,192,208
Coffee 24,16,12 210,160,110
Sakura 248,238,242 235,110,150 L
Sky 230,242,252 50,130,230 L
Aurora 6,14,22 90,255,190
NeonBlue 4,6,18 20,120,255
NeonPink 18,4,14 255,30,150
Toxic 8,14,4 170,255,30
Ice 10,18,26 170,230,255
Royal 12,8,26 120,80,255
Peach 24,14,12 255,160,130
Graphite 18,18,20 160,160,170
Forest 6,16,8 90,180,90
Candy 22,10,22 255,120,220
Void 2,2,4 120,60,255
Ember 20,8,2 255,150,30
Lavender 244,240,252 140,100,230 L
Steel 20,24,28 100,200,255
Mocha 28,20,18 200,140,100]]):gmatch("[^\n]+") do
	local n,bg,ac,lt=l:match("^(%S+)%s+(%S+)%s+(%S+)%s*(%a*)")
	TH[n]=mk(c3(bg),c3(ac),lt=="L") Th.names[#Th.names+1]=n
end
Th.names[#Th.names+1]="Custom"
for l in ([[Zen Michroma GothamMedium
Clean GothamBlack Gotham
Terminal Code RobotoMono
SciFi SciFi Jura
Arcade Arcade SourceSans
Fantasy Fantasy Merriweather
Bold Bangers Oswald
Soft Nunito Ubuntu
Fredoka FredokaOne Nunito
Marker PermanentMarker PatrickHand
Retro SpecialElite Code
Tech Sarpanch TitilliumWeb
Elegant Bodoni Garamond
Comic LuckiestGuy IndieFlower
Gothic Creepster Kalam
Condensed RobotoCondensed Roboto
Amatic AmaticSC JosefinSans
Denk DenkOne Nunito
Handwrite Kalam PatrickHand
Antique Antique Garamond
Cartoon Cartoon Nunito
Highway Highway SourceSans
Unkempt Unkempt Ubuntu
Fondamento Fondamento Merriweather
Roboto Roboto Roboto
Arial ArialBold Arial
Source SourceSansBold SourceSans
Mono RobotoMono Code]]):gmatch("[^\n]+") do local n,a,b=l:match("(%S+) (%S+) (%S+)") PK[n]={a,b} Th.pnames[#Th.pnames+1]=n end
Th.csc={Sharp=0,Boxy=.3,Soft=.5,Round=1,Squircle=1.6,Pill=2.2}
Th.cnames={"Sharp","Boxy","Soft","Round","Squircle","Pill"}
Th.RBSEQ=ColorSequence.new({kp(0,rgb(255,60,60)),kp(.17,rgb(255,200,50)),kp(.34,rgb(80,255,100)),kp(.5,rgb(60,220,255)),kp(.67,rgb(90,110,255)),kp(.84,rgb(230,80,255)),kp(1,rgb(255,60,60))})
function Th.custom() TH.Custom=mk(rgb(10,10,12),Color3.fromHSV(math.clamp(tonumber(ST.hue) or .6,0,1),.75,1)) end
function Th.cr(r) if r>=50 then return r end return math.floor(r*(Th.csc[ST.corner] or 1)+.5) end
function Th.fnt(n) local o,v=pcall(function() return Enum.Font[n] end) return o and v or Enum.Font.GothamMedium end
function Th.use(n)
	local t=TH[n] or TH.Black
	for k,v in pairs(t) do T[k]=v end
	if type(ST.acc)=="table" and #ST.acc==3 and n~="Rainbow" then
		local c=rgb(ST.acc[1],ST.acc[2],ST.acc[3])
		T.AC=c T.OA=(c.R*.299+c.G*.587+c.B*.114)>.55 and BLK or WH
	end
	if n=="Rainbow" then T.OA=BLK end
end
function Th.usepack(n) T.HF=Th.fnt(PK[n][1]) T.BF=Th.fnt(PK[n][2]) end
function Th.glow() return ColorSequence.new({kp(0,T.AC),kp(.5,T.AC:Lerp(T.BG,.75)),kp(1,T.AC)}) end
do local o,d=pcall(function() return HS:JSONDecode(readfile("Eko_Style.json")) end) if o and type(d)=="table" then for k,v in pairs(d) do ST[k]=v end end end
if type(ST.hue)~="number" then ST.hue=.6 end
if type(ST.opac)~="number" then ST.opac=1 end
Th.custom()
if not TH[ST.theme] then ST.theme="Black" end if not PK[ST.pack] then ST.pack="Zen" end if not Th.csc[ST.corner] then ST.corner="Round" end
local SHP={Classic={640,410},Wide={740,400},Compact={560,370},Tall={600,490},Square={540,540},Mini={500,340},Ultra={840,380}}
Th.shapes={"Classic","Wide","Compact","Tall","Square","Mini","Ultra"}
if not SHP[ST.shape] then ST.shape="Classic" end
Th.use(ST.theme) Th.usepack(ST.pack)
Th.rainbow=(ST.theme=="Rainbow")
-- ===== STATE =====
local C,TG,SL,oc={}, {}, {},0
local F={glow=true,blur=true,part=true,splash=true,asave=true,uiS=1,hue=ST.hue,opac=ST.opac}
local NS,NOCFG,STYLEK={hue=1,opac=1},{hue=1,opac=1},{uiS=1,glow=1,blur=1,part=1,splash=1,asave=1,hue=1,opac=1}
local nop=function() end
local main,ms,gui
local lock,fp,GST=nil,nil,nop
-- ===== CORE HELPERS =====
local function cn(c) C[#C+1]=c return c end
local ACP={"BackgroundColor3","TextColor3","Color","ImageColor3"}
local function new(c,p,pr)
	local o=Instance.new(c)
	if o:IsA("GuiObject") then oc=oc+1 o.BorderSizePixel=0 o.LayoutOrder=oc o.BackgroundColor3=T.RW end
	if c=="TextLabel" or c=="TextButton" or c=="TextBox" then o.Font=T.BF o.TextSize=13 o.TextColor3=T.TX end
	if c=="TextLabel" then o.BackgroundTransparency=1 end
	for k,v in pairs(p) do o[k]=v end
	for _,k in ipairs(ACP) do if p[k]==T.AC then X.accR[#X.accR+1]={o,k} end end
	o.Parent=pr return o
end
local function acc(o,k,fn) X.accR[#X.accR+1]={o,k,fn} return o end
function X.repaint() local l=X.accR for i=#l,1,-1 do local r=l[i] if r[1].Parent then if not r[3] or r[3]() then r[1][r[2]]=T.AC end else table.remove(l,i) end end end
local function rd(o,r) r=r or 8 local c=new("UICorner",{CornerRadius=UDim.new(0,Th.cr(r))},o) c:SetAttribute("R",r) end
local function tw(o,t,p,s,d) TS:Create(o,TweenInfo.new(t,s or Enum.EasingStyle.Quint,d or Enum.EasingDirection.Out),p):Play() end
local function press(b)
	local u=new("UIScale",{},b)
	b.ClipsDescendants=true
	b.InputBegan:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
			tw(u,.08,{Scale=.96})
			pcall(function()
				local sc=1 if ms and main and b:IsDescendantOf(main) then sc=ms.Scale end if sc<=0 then sc=1 end
				local ab,as=b.AbsolutePosition,b.AbsoluteSize
				local rp=new("Frame",{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromOffset((i.Position.X-ab.X)/sc,(i.Position.Y-ab.Y)/sc),Size=UDim2.fromOffset(0,0),BackgroundColor3=T.TX,BackgroundTransparency=.78,ZIndex=5},b)
				rd(rp,99)
				local m=math.max(as.X,as.Y)/sc*2.3
				tw(rp,.55,{Size=UDim2.fromOffset(m,m),BackgroundTransparency=1})
				task.delay(.6,function() rp:Destroy() end)
			end)
		end
	end)
	b.InputEnded:Connect(function() tw(u,.25,{Scale=1},Enum.EasingStyle.Back) end)
	return u
end
local function drag(h,f)
	local d,s,p0
	h.InputBegan:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
			d,s,p0=true,i.Position,f.Position
			i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then d=false end end)
		end
	end)
	cn(UIS.InputChanged:Connect(function(i)
		if d and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
			local v=i.Position-s f.Position=UDim2.new(p0.X.Scale,p0.X.Offset+v.X,p0.Y.Scale,p0.Y.Offset+v.Y)
		end
	end))
end
local function hum() local c=LP.Character return c and c:FindFirstChildOfClass("Humanoid") end
local function root() local c=LP.Character return c and c:FindFirstChild("HumanoidRootPart") end
gui=new("ScreenGui",{Name="EkoGui",ResetOnSpawn=false,IgnoreGuiInset=true},par)
local EL=new("Frame",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1},gui)
local function EN(n) local o,v=pcall(function() return Enum.AvatarAssetType[n] end) return o and v or nil end
-- ===== GAME DATABASE (key|category|name|placeId|viral|trend|profile|desc) =====
local PF={
shoot="Aimbot + triggerbot + hitbox expander\nBox ESP, health bars, tracers\nBunny hop + movement tools\nPlayers tab with avatars",
brawl="Melee aura + aimbot\nHitbox expander + ESP\nCombat movement tools\nPlayers tab with avatars",
sim="Auto swing / dig + auto collect\nAuto sell + auto rebirth\nEgg / chest / shop teleports\nPlayers tab with avatars",
tyc="Auto collect cash\nAuto buy pads + buttons\nBuy pad ESP + teleports\nPlayers tab with avatars",
surv="Prompt ESP + auto interact\nMonster ESP + warnings\nPlayer ESP + teleports\nPlayers tab with avatars",
fruit="Fruit + chest ESP / teleport\nAuto collect fruit + chests\nSpawn notifier\nPlayers tab with avatars",
soc="Aimbot + ESP\nPlayers tab with avatars + view\nFollow + teleport players\nWaypoints + fly / noclip / speed",
obby="Teleport to finish\nFinish ESP\nFly, noclip, speed\nPlayers tab with avatars",
rpg="NPC auto farm (kills mobs)\nAuto interact + auto collect\nNPC ESP + teleports\nPlayers tab with avatars",
drive="Vehicle boost + auto drive\nVehicle flip + fly\nTeleports + waypoints\nPlayers tab with avatars",
uni="Aimbot + triggerbot + hitboxes\nFly, noclip, speed\nPlayers tab with avatars\nWaypoints + fullbright",
los="Auto farm orbs (steps / gems)\nCollect in all cities\nAuto hoops, races, rebirth\nCrystal opener + hoop teleports",
lls="NPC auto farm + auto buy\nAuto buy damage (fire station)\nAuto lift + NPC ESP\nTeleports + players tab",
ml="Auto farm + auto rebirth\nCrystal opener + gem cost\nKill aura (any range option)\nPlayers tab + ESP",
pet="Auto fly to eggs (noclip)\nRarity + egg filters\nBlacklist + return to base\nEgg + player ESP",
egg="Autofarm: runs to egg, runs back\nEgg ESP with area + rarity\nArea / rarity filters + blacklist\nRuns instead of flying",
mm2="Role ESP + murderer warning\nAuto coins + auto grab gun\nSafe spot + role cards\nAimbot that targets the murderer",
flee="Beast ESP + nearby warning\nComputer / exit / pod ESP\nTeleport to computers\nPlayers tab with avatars",
doors="Item / door prompt ESP\nAuto interact (skips hiding)\nTeleport to latest door\nEntity alerts",
nds="Sky platform safe spot\nAdjustable height\nFly, noclip, speed\nInfinite jump",
evade="Bot ESP (labels nextbots)\nBot nearby warning\nFly, noclip, speed\nPlayers tab with avatars",
ball="Auto parry (ETA based)\nSpam parry\nBall ESP + speed readout\nSpeed, jump",
crim="Aimbot + triggerbot + hitboxes\nLoot ESP + loot teleports\nPlayer ESP + tracers\nPlayers tab with avatars"}
local GM={}
for l in ([[riv|Shooter|Rivals|17625359962|99|98|shoot|Fast duels with aimbot and ESP.
ars|Shooter|Arsenal|286090429|93|60|shoot|Classic gun-game shooter tools.
pf|Shooter|Phantom Forces|292439477|90|52|shoot|Tactical FPS aimbot and ESP.
cb|Shooter|Counter Blox|301549746|86|55|shoot|CS-style aimbot and ESP.
dh|Shooter|Da Hood|2788229376|94|72|shoot|Street shooter aim and ESP.
bb|Shooter|Bad Business|3233893879|74|44|shoot|Class-based FPS tools.
bpb|Shooter|Big Paintball|3527629287|78|58|shoot|Paintball aimbot and ESP.
fl|Shooter|Frontlines|5938036553|72|50|shoot|Military FPS tools.
aim|Shooter|Aimblox|0|66|48|shoot|PvP aim trainer tools.
mvs|Shooter|Murderers VS Sheriffs Duels|12355337193|70|66|shoot|Duels aimbot and ESP.
str|Shooter|Strucid|2377868951|58|30|shoot|Build-battle shooter tools.
crim|Shooter|Criminality|4588604953|88|78|crim|Aimbot, ESP and loot finder.
tc2|Shooter|Typical Colors 2|0|52|30|shoot|Team shooter tools.
ea|Shooter|Energy Assault|0|55|28|shoot|Sci-fi FPS tools.
ep|Shooter|Entry Point|0|62|40|shoot|Stealth heist shooter tools.
ar2|Shooter|Apocalypse Rising 2|0|60|34|shoot|Survival shooter tools.
pd|Shooter|Project Delta|0|68|74|shoot|Extraction shooter ESP.
zu|Shooter|Zombie Uprising|0|50|26|shoot|Zombie shooter tools.
gfa|Shooter|Gun Fight Arena|0|48|35|shoot|Arena shooter tools.
ir|Shooter|Island Royale|0|54|28|shoot|Battle royale tools.
cw|Fighting|Combat Warriors|4282985734|82|60|brawl|Melee aura and aimbot.
tsb|Fighting|The Strongest Battlegrounds|10449761463|96|90|brawl|Anime battleground tools.
slap|Fighting|Slap Battles|9431156611|89|50|brawl|Slap aura and ESP.
bw|Fighting|BedWars|6872265039|91|70|brawl|PvP aura and ESP.
jjs|Fighting|Jujutsu Shenanigans|0|80|76|brawl|Jujutsu PvP tools.
ubg|Fighting|Untitled Boxing Game|0|84|82|brawl|Boxing aura and ESP.
dbz|Fighting|Dragon Ball Z Final Stand|536102540|76|40|brawl|DBZ fighting tools.
dw|Fighting|Deepwoken|4111023553|83|60|brawl|Deepwoken combat tools.
ts|Fighting|Type Soul|14067600077|81|62|brawl|Bleach-style combat tools.
rl|Fighting|Rogue Lineage|3016661674|75|36|brawl|Rogue Lineage combat tools.
hb|Fighting|Heroes Battlegrounds|0|70|38|brawl|Hero battleground tools.
fbg|Fighting|Fruit Battlegrounds|0|66|35|brawl|Fruit PvP tools.
psl|Fighting|Project Slayers|0|78|48|rpg|Demon slayer NPC farm.
bl|Fighting|Boxing League|0|50|30|brawl|Boxing league tools.
sf|Fighting|Sword Fights on the Heights|0|46|20|brawl|Sword duel tools.
los|Simulator|Legends of Speed|3101667897|85|40|los|Orbs, hoops, races and rebirth.
lls|Simulator|Lift Legends Simulator|0|60|85|lls|NPC farm and auto buy.
nl|Simulator|Ninja Legends|3956818381|83|35|sim|Swing, collect, sell, rebirth.
nl2|Simulator|Ninja Legends 2|0|62|55|sim|Swing, collect, sell, rebirth.
ml|Simulator|Muscle Legends|3623096087|90|50|ml|Farm, crystals and combat.
ps99|Simulator|Pet Simulator 99|8737899170|97|80|sim|Egg and chest toolkit.
psx|Simulator|Pet Simulator X|6284583030|92|45|sim|Egg and chest toolkit.
bee|Simulator|Bee Swarm Simulator|1537690962|91|55|sim|Dig and collect toolkit.
sab|Simulator|Saber Simulator|3823781113|79|30|sim|Sword swinging toolkit.
bgs|Simulator|Bubble Gum Simulator|2512643572|78|32|sim|Collect and egg toolkit.
anf|Simulator|Anime Fighters Simulator|6299805723|82|36|sim|Fight and egg toolkit.
ad|Simulator|Anime Defenders|0|88|70|sim|Anime tower defense tools.
ms2|Simulator|Mining Simulator 2|0|70|40|sim|Mining toolkit.
wls|Simulator|Weight Lifting Simulator 3|0|74|34|sim|Lifting toolkit.
ss|Simulator|Strongman Simulator|0|66|36|sim|Strength toolkit.
aws|Simulator|Arm Wrestle Simulator|0|64|32|sim|Arm wrestling toolkit.
pc|Simulator|Pet Catchers|0|68|44|sim|Pet catching toolkit.
spf|Simulator|Super Power Fighting Simulator|0|67|30|sim|Power training toolkit.
av|Simulator|Anime Vanguards|0|90|85|sim|Anime tower defense tools.
fisch|Simulator|Fisch|16732694052|93|92|sim|Fishing helper toolkit.
pet|Pets|Ride a Pet|0|74|60|pet|Egg farming with auto fly.
egg|Pets|Steal an Egg|107778070777162|76|70|egg|Autofarm eggs by running.
adm|Pets|Adopt Me|920587237|99|55|soc|Teleports and utilities.
dragon|Pets|Dragon Adventures|3475397644|72|30|sim|Egg and collect toolkit.
gag|Pets|Grow a Garden|126884695634066|99|95|sim|Garden collect and sell toolkit.
sab2|Pets|Steal a Brainrot|109983668079237|98|99|sim|Brainrot collect and teleport.
wh|Pets|Wild Horse Islands|0|50|30|soc|Horse world utilities.
mm2|Survival|Murder Mystery 2|142823291|97|70|mm2|Role ESP and coin tools.
flee|Survival|Flee the Facility|893973440|84|40|flee|Beast and map ESP.
doors|Survival|Doors|6839171747|96|70|doors|Prompt ESP and auto interact.
nds|Survival|Natural Disaster Survival|189707|90|45|nds|Safe spot platform.
evade|Survival|Evade|9872472334|82|55|evade|Nextbot ESP and warnings.
piggy|Survival|Piggy|4623386862|88|40|surv|Prompt ESP and monster warning.
breakin|Survival|Break In|4620170611|80|35|surv|Prompt ESP and monster warning.
dead|Survival|Dead Rails|0|90|96|surv|Prompt ESP and monster warning.
pres|Survival|Pressure|0|78|80|surv|Prompt ESP and monster warning.
n99|Survival|99 Nights in the Forest|126509999114328|95|97|surv|Forest survival tools.
mimic|Survival|The Mimic|0|70|36|surv|Horror prompt tools.
apei|Survival|Apeirophobia|0|65|30|surv|Backrooms prompt tools.
bear|Survival|Bear|0|60|28|surv|Horror survival tools.
stk|Survival|Survive the Killer|0|60|30|surv|Killer survival tools.
hide|Survival|Hide and Seek Extreme|0|58|26|surv|Hide and seek tools.
tpt2|Tycoon|Theme Park Tycoon 2|69184822|80|30|tyc|Auto collect and auto buy.
rt2|Tycoon|Restaurant Tycoon 2|0|78|34|tyc|Auto collect and auto buy.
ret|Tycoon|Retail Tycoon 2|0|70|36|tyc|Auto collect and auto buy.
cdt|Tycoon|Car Dealership Tycoon|0|74|35|tyc|Auto collect and auto buy.
lt2|Tycoon|Lumber Tycoon 2|13822889|85|30|tyc|Auto collect and auto buy.
met|Tycoon|Millionaire Empire Tycoon|0|55|24|tyc|Auto collect and auto buy.
toh|Obby|Tower of Hell|1962086868|88|35|obby|Finish teleport and movement.
sr4|Obby|Speed Run 4|183364845|80|28|obby|Course finish tools.
meo|Obby|Mega Easy Obby|0|66|30|obby|Obby finish tools.
dco|Obby|Difficulty Chart Obby|0|62|28|obby|Obby finish tools.
tom|Obby|Tower of Misery|0|64|40|obby|Tower finish tools.
erh|Obby|Escape Running Head|0|60|45|obby|Escape finish tools.
bf|World|Blox Fruits|2753915549|99|70|fruit|Fruit and chest tools.
kl|World|King Legacy|4520749081|84|40|fruit|Fruit and chest tools.
gpo|World|Grand Piece Online|1730877806|83|38|fruit|Fruit and chest tools.
yba|World|Your Bizarre Adventure|0|80|42|rpg|Stand game NPC farm.
aut|World|A Universal Time|0|82|44|rpg|Stand game NPC farm.
brk|World|Brookhaven|4924922222|100|75|soc|Teleports and utilities.
prl|World|Prison Life|155615604|84|28|soc|Teleports and ESP.
jail|World|Jailbreak|606849621|95|50|soc|Teleports and ESP.
blox|World|Welcome to Bloxburg|185655149|92|45|soc|Social utilities.
roy|World|Royale High|735030788|88|40|soc|Social utilities.
meep|World|MeepCity|370731277|80|22|soc|Social utilities.
mad|World|Mad City|1224212277|70|24|soc|Social utilities.
dq|World|Dungeon Quest|2414851778|76|34|rpg|Dungeon NPC farm.
sp|World|Sailor Piece|0|78|88|rpg|Pirate NPC farm.
ball|Other|Blade Ball|13772394625|96|60|ball|Auto parry helper.
tds|Other|Tower Defense Simulator|3260590327|85|40|sim|Tower defense tools.
ttd|Other|Toilet Tower Defense|13775256536|90|60|sim|Tower defense tools.
de|Other|Driving Empire|0|78|45|drive|Vehicle boost tools.
cc2|Other|Car Crushers 2|0|68|30|drive|Vehicle tools.
vl|Other|Vehicle Legends|0|62|28|drive|Vehicle tools.
uni|Other|Universal|0|50|50|uni|Works in any game.]]):gmatch("[^\n]+") do
	local k,c,n,p,v,t,pr,d=l:match("^(.-)|(.-)|(.-)|(.-)|(.-)|(.-)|(.-)|(.*)$")
	if k then GM[#GM+1]={k=k,c=c,n=n,p=tonumber(p) or 0,v=tonumber(v) or 50,t=tonumber(t) or 50,pr=pr,d=d,i=#GM+1,f=PF[k] or PF[pr] or PF.uni} end
end
local CATS={"Shooter","Fighting","Simulator","Pets","Survival","Tycoon","Obby","World","Other"}
-- ===== ZENHUB =====
local choice,det
do
	local pn="" pcall(function() pn=MP:GetProductInfo(game.PlaceId).Name:lower() end)
	local UIDS={[10035204815]="pet",[10563114921]="egg",[6035872082]="riv"}
	local ALT={[6516141723]="doors",[4442272183]="bf",[7449423635]="bf"}
	local fk=UIDS[game.GameId] or ALT[game.PlaceId]
	for _,g in ipairs(GM) do if (g.p>0 and game.PlaceId==g.p) or g.k==fk then det=g end end
	if not det and pn~="" then for _,g in ipairs(GM) do if g.k~="uni" and pn:find(g.n:lower(),1,true) then det=g end end end
	local function rf(f) local o,v=pcall(readfile,f) return o and v or nil end
	local lastK,autoOn=rf("Eko_Last.txt"),rf("Eko_Auto.txt")=="1"
	if autoOn and not force then for _,g in ipairs(GM) do if g.k==lastK then choice=g.k end end end
	if not choice then
		local HW,HH=580,430
		local hub=new("CanvasGroup",{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(HW,HH),BackgroundColor3=T.BG,GroupTransparency=1},gui) rd(hub,18)
		local hs=new("UIScale",{Scale=.8},hub)
		local cam0=workspace.CurrentCamera
		local hfit=cam0 and math.min(1,(cam0.ViewportSize.X-16)/HW,(cam0.ViewportSize.Y-16)/HH) or 1
		new("UIStroke",{Color=T.AC,Transparency=.5,Thickness=1.5},hub)
		local hav=new("ImageLabel",{Size=UDim2.fromOffset(32,32),Position=UDim2.fromOffset(14,10),BackgroundColor3=T.RB,Image=AV(LP.UserId)},hub) rd(hav,99)
		new("UIStroke",{Color=T.AC,Thickness=1.5,Transparency=.2},hav)
		new("TextLabel",{Size=UDim2.fromOffset(150,12),Position=UDim2.fromOffset(54,10),Text="WELCOME BACK",Font=T.HF,TextSize=8,TextColor3=T.AC,TextXAlignment=XL},hub)
		new("TextLabel",{Size=UDim2.fromOffset(150,18),Position=UDim2.fromOffset(54,23),Text=LP.DisplayName,TextSize=13,TextXAlignment=XL,TextTruncate=TE},hub)
		new("TextLabel",{Size=UDim2.new(1,0,0,30),Position=UDim2.fromOffset(0,10),Text="eko hub",Font=T.HF,TextSize=17},hub)
		local hx=new("TextButton",{Size=UDim2.fromOffset(28,26),Position=UDim2.new(1,-42,0,12),Text="X",BackgroundColor3=T.RB},hub) rd(hx,8) press(hx) hx.Activated:Connect(function() gui:Destroy() end)
		local gPage=new("Frame",{Size=UDim2.new(1,-24,1,-100),Position=UDim2.fromOffset(12,90),BackgroundTransparency=1},hub)
		local aPage=new("Frame",{Size=UDim2.new(1,-24,1,-100),Position=UDim2.fromOffset(12,90),BackgroundTransparency=1,Visible=false},hub)
		local tabB={}
		local function setTab(n)
			gPage.Visible=n=="Games" aPage.Visible=n=="Avatar"
			for k,b in pairs(tabB) do tw(b,.25,{BackgroundColor3=k==n and T.AC or T.RB,TextColor3=k==n and T.OA or T.TX}) end
		end
		for i,n in ipairs({"Games","Avatar"}) do
			local b=new("TextButton",{Size=UDim2.fromOffset(110,28),Position=UDim2.fromOffset(14+(i-1)*118,52),Text=(i==1 and "🎮  " or "👕  ")..n:upper(),Font=T.HF,TextSize=10,BackgroundColor3=T.RB},hub) rd(b,14) press(b)
			tabB[n]=b b.Activated:Connect(function() setTab(n) end)
		end
		-- GAMES PAGE
		local sb=new("TextBox",{Size=UDim2.new(1,-306,0,26),Position=UDim2.fromOffset(0,0),Text="",PlaceholderText="Search all games...",ClearTextOnFocus=false,TextSize=11,BackgroundColor3=T.RB,TextXAlignment=XL},gPage) rd(sb,13)
		new("UIPadding",{PaddingLeft=UDim.new(0,12)},sb)
		local sortI,sorts=1,{"Popular","Trending","A → Z","Z → A","Newest","Category"}
		local sbtn=new("TextButton",{Size=UDim2.fromOffset(132,26),Position=UDim2.new(1,-440+132,0,0),Text="↕ Sort: Popular",TextSize=10,BackgroundColor3=T.RB},gPage) sbtn.Position=UDim2.new(1,-(HW-24)+HW-24-132-0,0,0) rd(sbtn,13) press(sbtn)
		local ctab=new("ScrollingFrame",{Size=UDim2.new(1,0,0,26),Position=UDim2.fromOffset(0,32),BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.X,ScrollingDirection=Enum.ScrollingDirection.X},gPage)
		new("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder},ctab)
		local list=new("ScrollingFrame",{Size=UDim2.new(0,208,1,-64),Position=UDim2.fromOffset(0,64),BackgroundTransparency=1,ScrollBarThickness=2,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y},gPage)
		new("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},list)
		local rp=new("Frame",{Size=UDim2.new(1,-220,1,-64),Position=UDim2.fromOffset(220,64)},gPage) rd(rp,12) new("UIStroke",{Color=T.TX,Transparency=.92},rp)
		local bi=new("ImageLabel",{Size=UDim2.fromOffset(84,84),Position=UDim2.fromOffset(14,14),BackgroundColor3=T.RB,ScaleType=Enum.ScaleType.Crop},rp) rd(bi,12)
		local bl=new("TextLabel",{Size=UDim2.fromScale(1,1),Text="",Font=T.HF,TextSize=34},bi)
		local bn=new("TextLabel",{Size=UDim2.new(1,-120,0,40),Position=UDim2.fromOffset(108,14),Font=T.HF,TextSize=12,TextWrapped=true,TextXAlignment=XL},rp)
		local bd=new("TextLabel",{Size=UDim2.new(1,-120,0,34),Position=UDim2.fromOffset(108,56),TextSize=11,TextColor3=T.DIM,TextWrapped=true,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Top},rp)
		local bf=new("TextLabel",{Size=UDim2.new(1,-28,0,74),Position=UDim2.fromOffset(14,104),TextSize=11,TextWrapped=true,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Top},rp)
		local bv=new("TextLabel",{Size=UDim2.new(1,-28,0,14),Position=UDim2.fromOffset(14,182),Text="",TextSize=10,TextColor3=T.AC,TextXAlignment=XL},rp)
		local ab=new("TextButton",{Size=UDim2.new(1,-28,0,22),Position=UDim2.new(0,14,1,-86),TextSize=10,BackgroundColor3=T.RB},rp) rd(ab,6) press(ab)
		local function abt() ab.Text="Auto-launch this game next time: "..(autoOn and "ON" or "OFF") end abt()
		ab.Activated:Connect(function() autoOn=not autoOn abt() end)
		local go=new("TextButton",{Size=UDim2.new(1,-28,0,30),Position=UDim2.new(0,14,1,-52),Text="LAUNCH",Font=T.HF,TextSize=12,BackgroundColor3=T.AC,TextColor3=T.OA},rp) rd(go,10) press(go)
		local cards,sel,chipsC,curCat={}, nil, {}, "ALL"
		local function setSel(g)
			sel=g bn.Text=g.n:upper() bd.Text=g.d bf.Text=g.f bi.Image=cards[g.k].im.Image bl.Text=g.n:sub(1,1) bl.Visible=(bi.Image=="")
			bv.Text="🔥 Popularity "..g.v.."   📈 Trending "..g.t.."   •   "..g.c
			for k,c in pairs(cards) do tw(c.st,.25,{Transparency=k==g.k and 0 or .9}) end
		end
		local function srt(l)
			local m=sorts[sortI]
			table.sort(l,function(a,b)
				if m=="Popular" then if a.v~=b.v then return a.v>b.v end
				elseif m=="Trending" then if a.t~=b.t then return a.t>b.t end
				elseif m=="A → Z" then return a.n:lower()<b.n:lower()
				elseif m=="Z → A" then return a.n:lower()>b.n:lower()
				elseif m=="Newest" then return a.i>b.i
				else if a.c~=b.c then return a.c<b.c end end
				return a.n<b.n
			end)
		end
		local function refresh()
			local q=sb.Text:lower()
			local vis={}
			for _,g in ipairs(GM) do
				local on=(q~="" and g.n:lower():find(q,1,true)~=nil) or (q=="" and (curCat=="ALL" or g.c==curCat))
				cards[g.k].b.Visible=on
				if on then vis[#vis+1]=g end
			end
			srt(vis)
			local selVis=false
			for i,g in ipairs(vis) do
				local cd=cards[g.k] cd.b.LayoutOrder=i
				if sel==g then selVis=true end
				cd.us.Scale=.82 task.delay(math.min(i,12)*.03,function() tw(cd.us,.35,{Scale=1},Enum.EasingStyle.Back) end)
				if not cd.ld then cd.ld=true cd.load() end
			end
			list.CanvasPosition=Vector2.new()
			if vis[1] and not selVis then setSel(vis[1]) end
		end
		local function setCat(c)
			curCat=c
			for cc,b in pairs(chipsC) do local on=cc==c tw(b,.2,{BackgroundColor3=on and T.AC or T.RB,TextColor3=on and T.OA or T.TX}) end
			refresh()
		end
		sbtn.Activated:Connect(function() sortI=sortI%#sorts+1 sbtn.Text="↕ Sort: "..sorts[sortI] refresh() end)
		for _,g in ipairs(GM) do
			local c=new("TextButton",{Size=UDim2.new(1,-4,0,54),Text="",AutoButtonColor=false,Visible=false},list) rd(c,10)
			local us=press(c)
			local st=new("UIStroke",{Color=T.AC,Transparency=.9,Thickness=1.5,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},c)
			local im=new("ImageLabel",{Size=UDim2.fromOffset(42,42),Position=UDim2.fromOffset(6,6),BackgroundColor3=T.RB,ScaleType=Enum.ScaleType.Crop},c) rd(im,8)
			local lt=new("TextLabel",{Size=UDim2.fromScale(1,1),Text=g.n:sub(1,1),Font=T.HF,TextSize=18},im)
			new("TextLabel",{Size=UDim2.new(1,-60,0,30),Position=UDim2.fromOffset(54,5),Text=g.n,TextSize=11,TextWrapped=true,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Top},c)
			new("TextLabel",{Size=UDim2.new(1,-60,0,12),Position=UDim2.fromOffset(54,37),Text=g.c..(det==g and "  •  DETECTED" or "").."  •  🔥"..g.v,TextSize=9,TextColor3=det==g and T.AC or T.DIM,TextXAlignment=XL,TextTruncate=TE},c)
			cards[g.k]={st=st,im=im,b=c,us=us}
			cards[g.k].load=function()
				if g.p<=0 then return end
				task.spawn(function()
					local o,i=pcall(function() return MP:GetProductInfo(g.p) end)
					if o and i and i.IconImageAssetId and i.IconImageAssetId~=0 then
						im.Image="rbxassetid://"..i.IconImageAssetId lt.Visible=false
						if sel==g then bi.Image=im.Image bl.Visible=false end
					end
				end)
			end
			c.Activated:Connect(function() setSel(g) end)
		end
		for _,cname in ipairs({"ALL",unpack(CATS)}) do
			local n=0 for _,g in ipairs(GM) do if cname=="ALL" or g.c==cname then n=n+1 end end
			local b=new("TextButton",{Size=UDim2.fromOffset(0,24),AutomaticSize=Enum.AutomaticSize.X,Text=cname:upper().." ("..n..")",Font=T.HF,TextSize=9,BackgroundColor3=T.RB},ctab)
			new("UIPadding",{PaddingLeft=UDim.new(0,11),PaddingRight=UDim.new(0,11)},b) rd(b,12) press(b)
			chipsC[cname]=b b.Activated:Connect(function() sb.Text="" setCat(cname) end)
		end
		sb:GetPropertyChangedSignal("Text"):Connect(refresh)
		go.Activated:Connect(function() if sel then pcall(writefile,"Eko_Last.txt",sel.k) pcall(writefile,"Eko_Auto.txt",autoOn and "1" or "0") choice=sel.k end end)
		local pre=det for _,g in ipairs(GM) do if not pre and g.k==lastK then pre=g end end
		setCat(pre and pre.c or "ALL")
		if pre then setSel(pre) end
		-- AVATAR PAGE
		local AVS={{"Owned"},{"Classic Shirts","Shirt"},{"Classic T-Shirts","TShirt"},{"Classic Pants","Pants"},{"Hats","Hat"},{"Hair","HairAccessory"},{"Face Acc.","FaceAccessory"},{"Neck","NeckAccessory"},{"Shoulder","ShoulderAccessory"},{"Front","FrontAccessory"},{"Back","BackAccessory"},{"Waist","WaistAccessory"},{"Layered Tops","ShirtAccessory"},{"Layered Pants","PantsAccessory"},{"Jackets","JacketAccessory"},{"Sweaters","SweaterAccessory"},{"Shorts","ShortsAccessory"},{"Shoes","LeftShoeAccessory"},{"Faces","Face"},{"Heads","Head"}}
		local aCard=new("Frame",{Size=UDim2.fromScale(1,1)},aPage) rd(aCard,14)
		new("TextLabel",{Size=UDim2.new(1,0,0,70),Position=UDim2.fromOffset(0,40),Text="👕",TextSize=54},aCard)
		new("TextLabel",{Size=UDim2.new(1,0,0,24),Position=UDim2.fromOffset(0,120),Text="Connect your inventory",Font=T.HF,TextSize=15},aCard)
		new("TextLabel",{Size=UDim2.new(1,-80,0,56),Position=UDim2.fromOffset(40,150),Text="Roblox will ask for permission. Then everything you own shows here and you can try it on. Only you can see the changes (client side).",TextSize=11,TextColor3=T.DIM,TextWrapped=true},aCard)
		local cbtn=new("TextButton",{Size=UDim2.fromOffset(240,38),Position=UDim2.new(.5,-120,0,222),Text="CONNECT MY CLOTHES",Font=T.HF,TextSize=11,BackgroundColor3=T.AC,TextColor3=T.OA},aCard) rd(cbtn,12) press(cbtn)
		local cst=new("TextLabel",{Size=UDim2.new(1,0,0,16),Position=UDim2.fromOffset(0,268),Text="",TextSize=10,TextColor3=T.DIM},aCard)
		local aBody=new("Frame",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Visible=false},aPage)
		local asc=new("ScrollingFrame",{Size=UDim2.new(1,0,0,28),BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.X,ScrollingDirection=Enum.ScrollingDirection.X},aBody)
		new("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder},asc)
		local ast=new("TextLabel",{Size=UDim2.new(1,-220,0,20),Position=UDim2.fromOffset(2,34),Text="Tap an item to wear it. Tap again to remove it.",TextSize=10,TextColor3=T.DIM,TextXAlignment=XL,TextTruncate=TE},aBody)
		local morb=new("TextButton",{Size=UDim2.fromOffset(60,22),Position=UDim2.new(1,-206,0,33),Text="More ▸",TextSize=10,BackgroundColor3=T.RB,Visible=false},aBody) rd(morb,8) press(morb)
		local rsb=new("TextButton",{Size=UDim2.fromOffset(136,22),Position=UDim2.new(1,-142,0,33),Text="↺ Reset Avatar",TextSize=10,BackgroundColor3=T.RB},aBody) rd(rsb,8) press(rsb)
		local grid=new("ScrollingFrame",{Size=UDim2.new(1,0,1,-62),Position=UDim2.fromOffset(0,62),BackgroundTransparency=1,ScrollBarThickness=3,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y},aBody)
		new("UIGridLayout",{CellSize=UDim2.fromOffset(104,128),CellPadding=UDim2.fromOffset(8,8),SortOrder=Enum.SortOrder.LayoutOrder},grid)
		new("UIPadding",{PaddingRight=UDim.new(0,6),PaddingBottom=UDim.new(0,8)},grid)
		local origD pcall(function() origD=hum():GetAppliedDescription() end)
		local aSub,aTok,apg,aChips=1,0,nil,{}
		local function aAdd(items,subT,tok)
			for _,it in ipairs(items) do
				if tok~=aTok then return end
				local f=new("TextButton",{Text="",AutoButtonColor=false},grid) rd(f,10)
				local us=press(f)
				local stk=new("UIStroke",{Color=T.AC,Thickness=2,Transparency=X.AVon[it.AssetId] and .1 or 1,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},f)
				new("ImageLabel",{Size=UDim2.new(1,-12,0,86),Position=UDim2.fromOffset(6,6),BackgroundTransparency=1,ScaleType=Enum.ScaleType.Fit,Image="rbxthumb://type=Asset&id="..string.format("%.0f",it.AssetId).."&w=150&h=150"},f)
				new("TextLabel",{Size=UDim2.new(1,-8,0,30),Position=UDim2.fromOffset(4,94),Text=it.Name or "?",TextSize=10,TextWrapped=true,TextTruncate=TE,TextYAlignment=Enum.TextYAlignment.Top},f)
				f.Activated:Connect(function()
					local ok2,res=X.aToggle(it,subT)
					if not ok2 then ast.Text="⚠ "..tostring(res) return end
					tw(stk,.2,{Transparency=res and .1 or 1}) ast.Text=(res and "Wearing: " or "Removed: ")..(it.Name or "item")
				end)
			end
		end
		local function aLoad(i)
			aSub=i aTok=aTok+1 local tok=aTok
			for j,b in ipairs(aChips) do tw(b,.2,{BackgroundColor3=j==i and T.AC or T.RB,TextColor3=j==i and T.OA or T.TX}) end
			for _,c in ipairs(grid:GetChildren()) do if c:IsA("GuiObject") then c:Destroy() end end
			ast.Text="Loading..." morb.Visible=false
			task.spawn(function()
				local en={}
				if AVS[i][2] then en[1]=EN(AVS[i][2]) else for j=2,#AVS do local v=EN(AVS[j][2]) if v then en[#en+1]=v end end end
				local o,pg=pcall(function() return AES:GetInventory(en) end)
				if tok~=aTok then return end
				if not o or not pg then ast.Text="⚠ Could not read inventory: "..tostring(pg):sub(1,70) return end
				apg=pg
				local o2,cur=pcall(function() return pg:GetCurrentPage() end)
				if not o2 then ast.Text="⚠ Could not read this page" return end
				aAdd(cur,AVS[i][2],tok)
				ast.Text=#cur==0 and "Nothing owned in this category." or "Tap an item to wear it. Tap again to remove it."
				morb.Visible=not pg.IsFinished
			end)
		end
		for i,s in ipairs(AVS) do
			local b=new("TextButton",{Size=UDim2.fromOffset(0,26),AutomaticSize=Enum.AutomaticSize.X,Text=s[1],TextSize=10,BackgroundColor3=T.RB},asc)
			new("UIPadding",{PaddingLeft=UDim.new(0,11),PaddingRight=UDim.new(0,11)},b) rd(b,13) press(b)
			aChips[i]=b b.Activated:Connect(function() aLoad(i) end)
		end
		morb.Activated:Connect(function()
			if not apg then return end
			local tok=aTok
			local o=pcall(function() apg:AdvanceToNextPageAsync() end)
			if o and tok==aTok then local o2,cur=pcall(function() return apg:GetCurrentPage() end) if o2 then aAdd(cur,AVS[aSub][2],tok) end end
			morb.Visible=apg and not apg.IsFinished
		end)
		rsb.Activated:Connect(function()
			for id,inst in pairs(X.AVon) do pcall(function() inst:Destroy() end) X.AVon[id]=nil end
			if origD then pcall(function() hum():ApplyDescription(origD) end) end
			aLoad(aSub) ast.Text="Avatar reset."
		end)
		local function showBody() aCard.Visible=false aBody.Visible=true aLoad(1) end
		cbtn.Activated:Connect(function()
			cst.Text="Waiting for permission..."
			task.spawn(function()
				local res
				local c1=AES.PromptAllowInventoryReadAccessCompleted:Connect(function(r) res=r end)
				pcall(function() AES:PromptAllowInventoryReadAccess() end)
				local t=0 while res==nil and t<90 and gui.Parent do task.wait(.2) t=t+.2 end
				c1:Disconnect()
				if res==Enum.AvatarPromptResult.Success then showBody() else cst.Text="Permission was not granted. Tap again to retry." end
			end)
		end)
		task.spawn(function() local o=pcall(function() AES:GetInventory({Enum.AvatarAssetType.Shirt}) end) if o and gui.Parent then showBody() end end)
		tw(hub,.4,{GroupTransparency=0}) tw(hs,.6,{Scale=hfit},Enum.EasingStyle.Back)
		setTab("Games")
		repeat task.wait(.1) until choice or not gui.Parent
		if gui.Parent then tw(hub,.3,{GroupTransparency=1}) tw(hs,.3,{Scale=hfit*1.1}) task.wait(.32) hub:Destroy() end
	end
end
if not gui.Parent then return end
local GN="" for _,g in ipairs(GM) do if g.k==choice then GN=g.n end end
local PROF="uni" for _,g in ipairs(GM) do if g.k==choice then PROF=g.pr end end
-- ===== LOADER =====
local step,endLoad
do
	local ld=new("CanvasGroup",{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(270,210),BackgroundColor3=T.BG,GroupTransparency=1,ZIndex=50},gui) rd(ld,14)
	local lds=new("UIScale",{Scale=.8},ld) new("UIStroke",{Color=T.TX,Transparency=.75},ld)
	local bolt=new("Frame",{Size=UDim2.fromOffset(64,72),Position=UDim2.new(.5,-32,0,14),BackgroundTransparency=1},ld)
	local bz={}
	for i,s in ipairs({{8,8,56,4},{56,4,30,34},{36,30,8,68},{8,68,58,64}}) do
		local a,b=Vector2.new(s[1],s[2]),Vector2.new(s[3],s[4]) local d=b-a
		bz[i]=new("Frame",{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromOffset((a.X+b.X)/2,(a.Y+b.Y)/2),Size=UDim2.fromOffset(d.Magnitude+4,7),Rotation=math.deg(math.atan2(d.Y,d.X)),BackgroundTransparency=1,BackgroundColor3=T.AC},bolt) rd(bz[i],3)
	end
	new("TextLabel",{Size=UDim2.new(1,0,0,20),Position=UDim2.fromOffset(0,96),Text="eko",Font=T.HF,TextSize=14},ld)
	local lbk=new("Frame",{Size=UDim2.fromOffset(160,3),Position=UDim2.fromOffset(55,141),BackgroundColor3=T.TR},ld) rd(lbk,99)
	local lbf=new("Frame",{Size=UDim2.new(0,0,1,0),BackgroundColor3=T.AC},lbk) rd(lbf,99)
	local lpc=new("TextLabel",{Size=UDim2.new(1,0,0,14),Position=UDim2.fromOffset(0,158),Text="0%",TextSize=10,TextColor3=T.DIM},ld)
	local lst=new("TextLabel",{Size=UDim2.new(1,0,0,16),Position=UDim2.fromOffset(0,176),Text="",TextSize=11,TextColor3=T.DIM},ld)
	step=function(p,t) lst.Text=t lpc.Text=math.floor(p*100).."%" tw(lbf,.25,{Size=UDim2.new(p,0,1,0)}) task.wait(.2) end
	endLoad=function() tw(ld,.45,{GroupTransparency=1}) tw(lds,.45,{Scale=1.15}) task.wait(.4) ld:Destroy() end
	tw(ld,.4,{GroupTransparency=0}) tw(lds,.5,{Scale=1},Enum.EasingStyle.Back)
	task.spawn(function()
		task.wait(.3)
		for _,f in ipairs(bz) do tw(f,.12,{BackgroundTransparency=0}) task.wait(.09) end
		while ld.Parent do for _,f in ipairs(bz) do tw(f,.1,{BackgroundTransparency=math.random()*.55}) end task.wait(.12+math.random()*.2) end
	end)
end
step(.12,"Building "..GN.." menu")
-- ===== WINDOW =====
local WINW,WINH=SHP[ST.shape][1],SHP[ST.shape][2]
local PX,PY=162,56
main=new("CanvasGroup",{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(WINW,WINH),BackgroundColor3=T.BG,Active=true,Visible=false},gui) rd(main,16)
ms=new("UIScale",{Scale=0},main)
function X.fit() local cam=workspace.CurrentCamera local vs=cam and cam.ViewportSize or Vector2.new(1280,720) return math.min(1,(vs.X-24)/WINW,(vs.Y-24)/WINH)*F.uiS end
function Th.shape(n) local s=SHP[n] if not s then return end ST.shape=n WINW,WINH=s[1],s[2] tw(main,.55,{Size=UDim2.fromOffset(WINW,WINH)},Enum.EasingStyle.Back) ms.Scale=X.fit() Th.save() end
local stk=new("UIStroke",{Color=T.AC,Transparency=.78,Thickness=1},main)
local stg=new("UIGradient",{Color=Th.glow(),Enabled=not Th.rainbow},stk)
-- 20 background effect styles
X.FXL={}
for l in ([[Off|·|0|1|1|0|0|0|0|1|0|W
Snow|❄ ❅ ❆|30|9|17|0|.07|.03|0|.3|0|W
Blizzard|❄ ❅|46|8|15|-.14|.34|.02|0|.3|0|W
Ice|✦ ◆|24|8|14|0|.04|.02|0|.35|.3|I
Rain|│|44|11|15|-.02|1.1|0|0|.55|0|B
Stars|✦ ★ ·|36|6|12|0|0|0|0|.45|.5|W
Fireflies|●|18|5|9|0|0|.06|0|.35|.5|Y
Bubbles|○|22|9|20|0|-.1|.03|0|.5|0|C
Embers|•|30|6|11|.01|-.22|.03|0|.3|.3|O
Sakura|🌸|16|12|18|-.02|.07|.035|1|0|0|E
Leaves|🍃 🍂|16|12|18|-.03|.08|.03|1|0|0|E
Matrix|0 1|44|9|13|0|.5|0|0|.35|.2|G
Confetti|■ ▲ ●|34|6|10|0|.2|.03|1|.15|0|R
Sparks|✧ ✦|26|7|13|0|-.12|.04|0|.3|.5|A
Hearts|♥|18|9|16|0|-.1|.03|0|.35|0|P
Clouds|☁|8|44|72|.02|0|0|0|.7|0|W
Aurora|●|6|110|170|.01|0|.05|0|.9|.03|V
Nebula|●|6|120|180|-.008|.004|.04|0|.9|.03|N
Fog|☁|7|60|100|.03|0|0|0|.82|0|W
Dust|·|44|8|14|.01|.02|.05|0|.4|.4|A
Topo|~ ≈ ∿|38|10|18|.015|.04|.08|0|.55|.25|A]]):gmatch("[^\n]+") do
	local n,gl,cnt,s1,s2,vx,vy,sw,ro,al,tk,col=l:match("^(.-)|(.-)|(.-)|(.-)|(.-)|(.-)|(.-)|(.-)|(.-)|(.-)|(.-)|(.-)$")
	local s={g={},n=tonumber(cnt),a=tonumber(s1),b=tonumber(s2),vx=tonumber(vx),vy=tonumber(vy),sw=tonumber(sw),ro=ro=="1",al=tonumber(al),tk=tonumber(tk),col=col}
	for w in gl:gmatch("%S+") do s.g[#s.g+1]=w end
	X.FXL[n]=s Th.fxn[#Th.fxn+1]=n
end
X.FXC={W=rgb(235,240,255),I=rgb(175,225,255),B=rgb(150,190,255),Y=rgb(255,230,120),C=rgb(130,230,255),O=rgb(255,160,60),G=rgb(80,255,120),P=rgb(255,120,190)}
X.FXM={V={rgb(80,255,190),rgb(90,200,255),rgb(160,110,255)},N={rgb(255,90,200),rgb(120,90,255),rgb(70,160,255)}}
X.fxc=new("Frame",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,ClipsDescendants=true},main)
X.fxp,X.fxb={}, {}
for i=1,48 do X.fxp[i]={o=new("TextLabel",{Size=UDim2.fromOffset(40,40),AnchorPoint=Vector2.new(.5,.5),Text="",TextSize=12,Visible=false,Font=Enum.Font.GothamMedium},X.fxc)} end
for i=1,8 do local f=new("Frame",{AnchorPoint=Vector2.new(.5,.5),Visible=false,BackgroundTransparency=.9},X.fxc) rd(f,999) X.fxb[i]={o=f} end
function X.fxSet(n)
	local s=X.FXL[n] or X.FXL.Off ST.fx=n X.fxs=s
	for i,p in ipairs(X.fxp) do
		if s.a<100 and i<=s.n then
			p.on=true p.x=math.random() p.y=math.random() p.sv=.6+math.random()*.8 p.ph=math.random()*6.28
			local sz=s.a+math.random()*(s.b-s.a) local o=p.o
			o.Visible=true o.Text=s.g[math.random(#s.g)] o.TextSize=math.floor(sz) o.Size=UDim2.fromOffset(sz*2,sz*2) o.TextTransparency=s.al
			if s.col=="R" then p.col=Color3.fromHSV(math.random(),.7,1) elseif s.col=="E" then p.col=WH elseif s.col=="A" then p.col=nil else p.col=X.FXC[s.col] or WH end
			if p.col then o.TextColor3=p.col end
		else p.on=false p.o.Visible=false end
	end
	for i,p in ipairs(X.fxb) do
		if s.a>=100 and i<=s.n then
			p.on=true p.x=math.random() p.y=math.random() p.sv=.6+math.random()*.8 p.ph=math.random()*6.28
			local sz=s.a+math.random()*(s.b-s.a) local o=p.o
			o.Visible=true o.Size=UDim2.fromOffset(sz,sz) local m=X.FXM[s.col] or {WH} o.BackgroundColor3=m[math.random(#m)] o.BackgroundTransparency=s.al
		else p.on=false p.o.Visible=false end
	end
end
function X.fxStep(dt,t)
	local s=X.fxs if not s or s.n==0 then return end
	for _,pl in ipairs({X.fxp,X.fxb}) do for _,p in ipairs(pl) do if p.on then
		p.y=p.y+s.vy*dt*p.sv p.x=p.x+s.vx*dt*p.sv
		if p.y>1.08 then p.y=-.08 p.x=math.random() elseif p.y<-.08 then p.y=1.08 p.x=math.random() end
		if p.x>1.08 then p.x=-.08 elseif p.x<-.08 then p.x=1.08 end
		local o=p.o
		o.Position=UDim2.fromScale(p.x+math.sin(t*.8*p.sv+p.ph)*s.sw,p.y)
		if s.ro and o:IsA("TextLabel") then o.Rotation=(t*40*p.sv+p.ph*50)%360 end
		if s.tk>0 then local v=math.clamp(s.al+math.sin(t*2.2*p.sv+p.ph)*s.tk,0,1) if o:IsA("TextLabel") then o.TextTransparency=v else o.BackgroundTransparency=v end end
		if s.col=="A" and not p.col and o:IsA("TextLabel") then o.TextColor3=T.AC end
	end end end
end
-- sidebar
U.side=new("Frame",{Size=UDim2.new(0,152,1,0),BackgroundColor3=Color3.fromRGB(10,10,12),BackgroundTransparency=.15},main)
new("Frame",{Size=UDim2.new(0,1,1,-30),Position=UDim2.new(1,-1,0,15),BackgroundColor3=T.TR},U.side)
do
	local logo=new("Frame",{Size=UDim2.new(1,0,0,48),BackgroundTransparency=1},U.side) drag(logo,main)
	new("TextLabel",{Name="EkoTitle",Size=UDim2.new(1,-20,0,20),Position=UDim2.fromOffset(16,9),Text="eko",Font=T.HF,TextSize=13,TextXAlignment=XL,TextColor3=T.AC},logo)
	new("TextLabel",{Size=UDim2.new(1,-20,0,12),Position=UDim2.fromOffset(16,28),Text="v1  •  "..GN,TextSize=9,TextColor3=T.DIM,TextXAlignment=XL,TextTruncate=TE},logo)
	local prof=new("Frame",{Size=UDim2.new(1,-20,0,54),Position=UDim2.fromOffset(10,52),BackgroundColor3=T.RB},U.side) rd(prof,12)
	local av=new("ImageLabel",{Size=UDim2.fromOffset(38,38),Position=UDim2.fromOffset(8,8),BackgroundColor3=T.RW,Image=AV(LP.UserId)},prof) rd(av,99)
	new("UIStroke",{Color=T.AC,Thickness=1.5,Transparency=.2},av)
	new("TextLabel",{Size=UDim2.new(1,-58,0,11),Position=UDim2.fromOffset(52,9),Text="WELCOME BACK",Font=T.HF,TextSize=7,TextColor3=T.AC,TextXAlignment=XL},prof)
	new("TextLabel",{Size=UDim2.new(1,-58,0,16),Position=UDim2.fromOffset(52,20),Text=LP.DisplayName,TextSize=12,TextXAlignment=XL,TextTruncate=TE},prof)
	new("TextLabel",{Size=UDim2.new(1,-58,0,12),Position=UDim2.fromOffset(52,36),Text="@"..LP.Name,TextSize=9,TextColor3=T.DIM,TextXAlignment=XL,TextTruncate=TE},prof)
end
U.navS=new("ScrollingFrame",{Size=UDim2.new(1,-16,1,-158),Position=UDim2.fromOffset(8,112),BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y},U.side)
U.pill=new("Frame",{Size=UDim2.new(1,0,0,30),BackgroundColor3=T.AC},U.navS) rd(U.pill,9)
U.navL=new("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1},U.navS)
new("UIListLayout",{Padding=UDim.new(0,4),SortOrder=Enum.SortOrder.LayoutOrder},U.navL)
U.foot=new("TextLabel",{Size=UDim2.new(1,-20,0,28),Position=UDim2.new(0,10,1,-36),Text="",TextSize=9,TextColor3=T.DIM,TextWrapped=true,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Top},U.side)
-- header
U.hdr=new("Frame",{Size=UDim2.new(1,-152,0,48),Position=UDim2.fromOffset(152,0),BackgroundTransparency=1},main) drag(U.hdr,main)
U.pgT=new("TextLabel",{Size=UDim2.fromOffset(240,24),Position=UDim2.fromOffset(18,6),Text="",Font=T.HF,TextSize=16,TextXAlignment=XL},U.hdr)
U.pgS=new("TextLabel",{Size=UDim2.fromOffset(240,14),Position=UDim2.fromOffset(18,32),Text=GN,TextSize=10,TextColor3=T.DIM,TextXAlignment=XL,TextTruncate=TE},U.hdr)
U.sbx=new("TextBox",{Size=UDim2.fromOffset(130,26),Position=UDim2.new(1,-212,0,14),Text="",PlaceholderText="Search options...",ClearTextOnFocus=false,TextSize=11,BackgroundColor3=T.RB,TextXAlignment=XL},U.hdr) rd(U.sbx,13)
new("UIPadding",{PaddingLeft=UDim.new(0,12)},U.sbx)
local mb=new("TextButton",{Size=UDim2.fromOffset(28,26),Position=UDim2.new(1,-70,0,14),Text="-",BackgroundColor3=T.RB},U.hdr) rd(mb,8) press(mb)
local xb=new("TextButton",{Size=UDim2.fromOffset(28,26),Position=UDim2.new(1,-38,0,14),Text="X",BackgroundColor3=T.RB},U.hdr) rd(xb,8) press(xb)
local shine=new("Frame",{Size=UDim2.new(1,-200,0,1),Position=UDim2.fromOffset(185,54),BackgroundColor3=T.AC},main)
local shg=new("UIGradient",{Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(.5,0),NumberSequenceKeypoint.new(1,1)})},shine)
local lbx=new("TextButton",{Size=UDim2.fromOffset(42,42),Position=UDim2.fromOffset(20,100),Text="Z",Font=T.HF,TextSize=18,BackgroundColor3=T.AC,TextColor3=T.OA,Visible=false},gui) rd(lbx,10) drag(lbx,lbx)
X.blur=Instance.new("BlurEffect") X.blur.Size=0 X.blur.Parent=Lt
local flash=new("Frame",{Size=UDim2.fromScale(1,1),BackgroundColor3=WH,BackgroundTransparency=1,ZIndex=40,Active=false},main)
local lastPos=main.Position
local function hide()
	lastPos=main.Position
	tw(main,.3,{GroupTransparency=1,Position=lastPos+UDim2.fromOffset(0,16)}) tw(ms,.35,{Scale=ms.Scale*.86},Enum.EasingStyle.Back,Enum.EasingDirection.In)
	tw(X.blur,.3,{Size=0})
	task.delay(.3,function() main.Visible=false lbx.Visible=true lbx.Size=UDim2.fromOffset(0,0) tw(lbx,.5,{Size=UDim2.fromOffset(42,42)},Enum.EasingStyle.Elastic) end)
end
function X.intro()
	for i,n in ipairs(U.tbl) do local b=U.tbn[n].b b.Position=UDim2.fromOffset(-180,0) task.delay(.18+i*.045,function() tw(b,.5,{Position=UDim2.new()},Enum.EasingStyle.Back) end) end
	flash.BackgroundTransparency=.55 tw(flash,.7,{BackgroundTransparency=1})
	shine.Size=UDim2.new(0,0,0,1) tw(shine,.9,{Size=UDim2.new(1,-200,0,1)})
	U.pgT.Position=UDim2.fromOffset(-30,6) tw(U.pgT,.6,{Position=UDim2.fromOffset(18,6)},Enum.EasingStyle.Back)
end
local function showM()
	lbx.Visible=false main.Visible=true main.GroupTransparency=1 ms.Scale=X.fit()*.8
	main.Position=lastPos+UDim2.fromOffset(0,22)
	tw(main,.5,{GroupTransparency=1-F.opac,Position=lastPos}) tw(ms,.8,{Scale=X.fit()},Enum.EasingStyle.Elastic)
	if F.blur then tw(X.blur,.6,{Size=14}) end
	X.intro()
end
mb.Activated:Connect(hide) lbx.Activated:Connect(showM) xb.Activated:Connect(function() G.Eko() end)
cn(UIS.InputBegan:Connect(function(i,g) if not g and (i.KeyCode==Enum.KeyCode.RightShift or i.KeyCode==Enum.KeyCode.Minus) then if main.Visible then hide() else showM() end end end))
task.defer(function() local cam=workspace.CurrentCamera if cam then cn(cam:GetPropertyChangedSignal("ViewportSize"):Connect(function() if main.Visible then ms.Scale=X.fit() end end)) end end)
-- toast
local ts=new("Frame",{Size=UDim2.fromOffset(220,42),Position=UDim2.new(1,10,1,-58),BackgroundColor3=T.BG,ZIndex=10},gui) rd(ts,10) new("UIStroke",{Color=T.AC,Transparency=.5,Thickness=1.2},ts)
new("Frame",{Size=UDim2.new(0,3,1,-14),Position=UDim2.fromOffset(7,7),BackgroundColor3=T.AC},ts)
local tsL=new("TextLabel",{Size=UDim2.new(1,-28,1,-6),Position=UDim2.fromOffset(20,0),Text="",TextSize=11,TextWrapped=true,TextXAlignment=XL},ts)
local tsP=new("Frame",{Size=UDim2.new(1,-16,0,2),Position=UDim2.new(0,8,1,-4),BackgroundColor3=T.AC,BackgroundTransparency=.4},ts) rd(tsP,99)
U.tk=0
local function toast(m)
	U.tk=U.tk+1 local me=U.tk
	tsL.Text=m tsP.Size=UDim2.new(1,-16,0,2)
	tw(ts,.6,{Position=UDim2.new(1,-236,1,-58)},Enum.EasingStyle.Back)
	tw(tsP,2.6,{Size=UDim2.new(0,0,0,2)},Enum.EasingStyle.Linear)
	task.delay(2.6,function() if me==U.tk then tw(ts,.4,{Position=UDim2.new(1,10,1,-58)}) end end)
end
-- welcome overlay (top level, above everything)
function X.welcome()
	if X.welcomed or not F.splash then return end
	X.welcomed=true
	local ov=new("Frame",{Size=UDim2.fromScale(1,1),BackgroundColor3=BLK,BackgroundTransparency=1,ZIndex=300},gui)
	local card=new("CanvasGroup",{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(330,210),BackgroundColor3=T.BG,ZIndex=301},ov) rd(card,20)
	local cs=new("UIScale",{Scale=.5},card)
	new("UIStroke",{Color=T.AC,Thickness=2},card)
	local ring=new("Frame",{AnchorPoint=Vector2.new(.5,0),Position=UDim2.new(.5,0,0,18),Size=UDim2.fromOffset(94,94),BackgroundColor3=WH,ZIndex=302},card) rd(ring,99)
	local rg=new("UIGradient",{Color=ColorSequence.new({kp(0,T.AC),kp(.5,T.BG),kp(1,T.AC)})},ring)
	TS:Create(rg,TweenInfo.new(1.6,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,-1),{Rotation=360}):Play()
	new("ImageLabel",{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.new(1,-8,1,-8),BackgroundColor3=T.RB,Image=AV(LP.UserId),ZIndex=303},ring):FindFirstChildOfClass("UICorner")
	rd(ring:FindFirstChildOfClass("ImageLabel"),99)
	local l1=new("TextLabel",{Size=UDim2.new(1,0,0,16),Position=UDim2.fromOffset(0,122),Text="W E L C O M E",Font=T.HF,TextSize=11,TextColor3=T.AC,TextTransparency=1,ZIndex=302},card)
	local l2=new("TextLabel",{Size=UDim2.new(1,0,0,30),Position=UDim2.fromOffset(0,140),Text="",Font=T.HF,TextSize=22,ZIndex=302},card)
	local l3=new("TextLabel",{Size=UDim2.new(1,0,0,14),Position=UDim2.fromOffset(0,176),Text="@"..LP.Name.."  •  "..GN,TextSize=11,TextColor3=T.DIM,TextTransparency=1,ZIndex=302},card)
	tw(ov,.35,{BackgroundTransparency=.5}) tw(cs,.8,{Scale=1},Enum.EasingStyle.Elastic)
	task.delay(.3,function() tw(l1,.4,{TextTransparency=0}) end)
	task.spawn(function()
		task.wait(.45)
		local nm=LP.DisplayName local n=utf8.len(nm) or #nm
		for i=1,n do local pos=utf8.offset(nm,i+1) or (#nm+1) l2.Text=nm:sub(1,pos-1) task.wait(.05) end
		tw(l3,.4,{TextTransparency=0}) task.wait(1.4)
		tw(card,.5,{GroupTransparency=1}) tw(cs,.5,{Scale=1.15}) tw(ov,.5,{BackgroundTransparency=1})
		task.wait(.6) ov:Destroy()
	end)
end
-- ===== TABS =====
U.pages,U.sfs,U.tbn,U.tbl,U.cur,U.first={}, {}, {}, {},"",nil
X.TICON={Home="◈",Aimbot="◎",Combat="⚔",ESP="◉",Players="☰",Player="▷",Misc="✦",Configs="◫",Settings="⚙",Farm="⬡",Crystals="◇",Teleport="↗",Lift="▲",Egg="○",Blacklist="✕",Fruits="✿",Game="▣",Doors="▢",["Blade Ball"]="●",Survival="◆",Facility="▣",Bots="◈",Loot="▣",Obby="▲",Tycoon="▣",Roles="◎",Safety="◆",Vehicle="▷",NPC="◈",Speed="▷",Avatar="○"}
X.ICO={}
for k,v in ("fly=🕊 noclip=👻 speed=⚡ walk=🚶 jump=⬆ gravity=🌍 fov=🔭 zoom=🔍 fps=📊 ping=📶 bright=💡 prompt=🖐 teleport=📍 waypoint=📌 server=🌐 rejoin=🔄 hop=🔀 copy=📋 reset=♻ afk=💤 egg=🥚 chest=📦 shop=🛒 sell=💰 rebirth=🔁 coin=💰 gem=💎 crystal=🔮 orb=🔶 hoop=⭕ race=🏁 farm=🌾 collect=📥 buy=🛍 upgrade=🛍 damage=💥 npc=🤖 bot=🤖 monster=👹 kill=☠ aura=🌀 punch=👊 melee=⚔ swing=🗡 dig=⛏ lift=🏋 train=💪 loot=📦 parry=🛡 ball=⚽ fruit=🍎 door=🚪 entity=👹 role=🎭 murder=🔪 beast=🐺 computer=💻 exit=🚪 pod=🛏 finish=🏁 hitbox=🔳 bunny=🐇 blur=🌫 particle=✨ welcome=👋 glow=💫 scale=📐 opacity=◐ theme=🎨 font=🔤 corner=◻ config=💾 save=💾 load=📂 crosshair=➕ sticky=📌 team=👥 wall=🧱 predict=🔮 smooth=🧈 target=🎯 priority=⭐ aim=🎯 trigger=🔫 esp=👁 tracer=📏 chams=🔆 health=❤ box=⬜ distance=📏 click=🖱 view=👁 follow=🚶 base=🏠 filter=🔎 blacklist=⛔ alert=🔔 sound=🔊 rate=⏱ delay=⏱ interval=⏱ range=📡 size=📏 height=⬆ platform=🧱 gun=🔫 print=🖨 stop=⏹ time=🕒 spin=🌀 vehicle=🚗 car=🚗 boost=🚀 style=🎨 shape=⬛ snow=❄ quest=📜 safe=🛟 warn=⚠ spam=🔁 font=🔤"):gmatch("(%S-)=(%S+)") do X.ICO[#X.ICO+1]={k,v} end
function X.ico(t,d)
	local a,b=(t or ""):lower(),(d or ""):lower()
	for _,p in ipairs(X.ICO) do if a:find(p[1],1,true) then return p[2] end end
	for _,p in ipairs(X.ICO) do if b:find(p[1],1,true) then return p[2] end end
	return "▪"
end
function X.navPaint()
	for n,t in pairs(U.tbn) do local on=n==U.cur t.tl.TextColor3=on and T.OA or T.TX t.bd.BackgroundTransparency=on and .8 or 0 end
end
X.search=false
function X.filter(sf,q)
	q=q:lower() X.search=q~=""
	for _,c in ipairs(sf:GetChildren()) do
		if c:IsA("GuiObject") then
			local hd=X.holds[c] local st=c:GetAttribute("st")
			if q=="" then c.Visible=hd and hd.open or (not hd) else c.Visible=(st~=nil and st:find(q,1,true)~=nil) end
		end
	end
end
function X.stag(sf)
	local n=0
	for _,c in ipairs(sf:GetChildren()) do
		if c:IsA("GuiObject") and c.Visible then
			n=n+1 if n>16 then break end
			local dl=(n-1)*.04
			local list={c} for _,x in ipairs(c:GetDescendants()) do list[#list+1]=x end
			if #list>60 then list={c} end
			for _,o in ipairs(list) do
				local goal={}
				local function cap(prop) local k="zo_"..prop local v=o:GetAttribute(k) if v==nil then v=o[prop] o:SetAttribute(k,v) end if v<1 then goal[prop]=v end end
				if o:IsA("GuiObject") then cap("BackgroundTransparency") end
				if o:IsA("TextLabel") or o:IsA("TextButton") or o:IsA("TextBox") then cap("TextTransparency") end
				if o:IsA("ImageLabel") then cap("ImageTransparency") end
				if next(goal) then
					for k in pairs(goal) do o[k]=1 end
					task.delay(dl,function() if o.Parent then TS:Create(o,TweenInfo.new(.45,Enum.EasingStyle.Back),goal):Play() end end)
				end
			end
		end
	end
end
local function show(n)
	U.sbx.Text="" X.filter(U.sfs[n],"")
	U.cur=n
	for k,p in pairs(U.pages) do
		if k==n then p.Visible=true p.GroupTransparency=1 p.Position=UDim2.fromOffset(PX+34,PY) tw(p,.45,{GroupTransparency=0,Position=UDim2.fromOffset(PX,PY)},Enum.EasingStyle.Back) X.stag(U.sfs[k])
		elseif p.Visible then tw(p,.14,{GroupTransparency=1}) task.delay(.15,function() if U.cur~=k then p.Visible=false end end) end
	end
	for k,t in pairs(U.tbn) do local on=k==n tw(t.tl,.25,{TextColor3=on and T.OA or T.TX}) tw(t.bd,.25,{BackgroundTransparency=on and .8 or 0}) end
	tw(U.pill,.5,{Position=UDim2.fromOffset(0,(U.tbn[n].i-1)*34)},Enum.EasingStyle.Back)
	U.pgT.Text=n:upper() U.pgT.TextTransparency=1 U.pgT.Position=UDim2.fromOffset(40,6)
	tw(U.pgT,.5,{TextTransparency=0,Position=UDim2.fromOffset(18,6)},Enum.EasingStyle.Back)
	local cnt=0 for _,c in ipairs(U.sfs[n]:GetDescendants()) do if c:GetAttribute("st") then cnt=cnt+1 end end
	U.pgS.Text=GN.."  •  "..cnt.." options"
end
local function tab(n)
	U.first=U.first or n
	local i=#U.tbl+1
	local cell=new("Frame",{Size=UDim2.new(1,0,0,30),BackgroundTransparency=1,ClipsDescendants=true,LayoutOrder=i},U.navL)
	local b=new("TextButton",{Size=UDim2.fromScale(1,1),Text="",BackgroundTransparency=1,AutoButtonColor=false},cell)
	local bd=new("Frame",{Size=UDim2.fromOffset(22,22),Position=UDim2.fromOffset(6,4),BackgroundColor3=T.RB},b) rd(bd,7)
	new("TextLabel",{Size=UDim2.fromScale(1,1),Text=X.TICON[n] or n:sub(1,1),TextSize=12,Font=Enum.Font.GothamMedium},bd)
	local tl=new("TextLabel",{Size=UDim2.new(1,-42,1,0),Position=UDim2.fromOffset(38,0),Text=n,TextSize=12,TextXAlignment=XL,TextTruncate=TE},b)
	U.tbn[n]={bd=bd,tl=tl,i=i,b=b} U.tbl[i]=n
	local hd=new("CanvasGroup",{Size=UDim2.new(1,-(PX+8),1,-(PY+8)),Position=UDim2.fromOffset(PX,PY),BackgroundTransparency=1,Visible=false},main)
	local p=new("ScrollingFrame",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,ScrollBarThickness=3,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y},hd)
	new("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},p)
	new("UIPadding",{PaddingRight=UDim.new(0,8),PaddingBottom=UDim.new(0,10),PaddingTop=UDim.new(0,2)},p)
	U.pages[n]=hd U.sfs[n]=p b.Activated:Connect(function() show(n) end) return p
end
U.sbx:GetPropertyChangedSignal("Text"):Connect(function() local sf=U.sfs[U.cur] if sf then X.filter(sf,U.sbx.Text) end end)
-- ===== WIDGETS =====
local function badge(parent,t,d,y)
	local b=new("Frame",{Size=UDim2.fromOffset(26,26),Position=y and UDim2.fromOffset(10,y) or UDim2.new(0,10,.5,-13),BackgroundColor3=T.RB},parent) rd(b,8)
	new("TextLabel",{Size=UDim2.fromScale(1,1),Text=X.ico(t,d),TextSize=14,Font=Enum.Font.GothamMedium},b)
	return b
end
local function row(pg,h,st)
	local f=new("Frame",{Size=UDim2.new(1,-6,0,h or 38)},pg) rd(f,10)
	if st then f:SetAttribute("st",st:lower()) end
	local s=new("UIStroke",{Color=T.AC,Transparency=.9,Thickness=1.2,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},f)
	f:SetAttribute("on",false)
	f.MouseEnter:Connect(function() if not f:GetAttribute("on") then tw(s,.2,{Transparency=.55}) end end)
	f.MouseLeave:Connect(function() if not f:GetAttribute("on") then tw(s,.25,{Transparency=.9}) end end)
	f.InputBegan:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then
			if f:GetAttribute("on") then tw(s,.08,{Thickness=2.8}) task.delay(.2,function() tw(s,.35,{Thickness=1.2}) end)
			else tw(s,.08,{Transparency=.05,Thickness=2.6}) task.delay(.24,function() if not f:GetAttribute("on") then tw(s,.5,{Transparency=.9,Thickness=1.2}) end end) end
		end
	end)
	return f,s
end
local function lbl(r,t,d,rp,top)
	rp=rp or 70
	local y=(d or top) and (d and 7 or 8) or 0
	local l=new("TextLabel",{Size=(d or top) and UDim2.new(1,-(46+rp),0,18) or UDim2.new(1,-(46+rp),1,0),Position=UDim2.fromOffset(46,y),Text=t,TextSize=12,TextXAlignment=XL,TextTruncate=TE},r)
	if d then new("TextLabel",{Size=UDim2.new(1,-(46+rp),0,12),Position=UDim2.fromOffset(46,26),Text=d,TextSize=9,TextColor3=T.DIM,TextXAlignment=XL,TextTruncate=TE},r) end
	return l
end
X.secs={}
function X.secLayout(s) local w=TXS:GetTextSize(s[3],9,T.HF,Vector2.new(500,24)).X s[2].Position=UDim2.new(0,w+12,.5,0) s[2].Size=UDim2.new(1,-(w+14),0,1) end
local function sec(pg,t)
	t=t:upper()
	local f=new("Frame",{Size=UDim2.new(1,-6,0,24),BackgroundTransparency=1},pg)
	local l=new("TextLabel",{Size=UDim2.new(0,0,1,0),AutomaticSize=Enum.AutomaticSize.X,Text=t,Font=T.HF,TextSize=9,TextColor3=T.AC},f)
	local line=new("Frame",{AnchorPoint=Vector2.new(0,.5),BackgroundColor3=T.TR},f)
	local s={l,line,t} X.secs[#X.secs+1]=s X.secLayout(s)
end
local function note(pg,t,h) return new("TextLabel",{Size=UDim2.new(1,-6,0,h or 30),Text=t,TextSize=10,TextColor3=T.DIM,TextWrapped=true},pg) end
local function btn(pg,t,d,fn)
	local h=d and 48 or 38
	local b=new("TextButton",{Size=UDim2.new(1,-6,0,h),Text="",BackgroundColor3=T.RB,AutoButtonColor=false},pg) rd(b,10) press(b)
	b:SetAttribute("st",(t.." "..(d or "")):lower())
	local s=new("UIStroke",{Color=T.AC,Thickness=1.6,Transparency=1,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},b)
	b.MouseEnter:Connect(function() tw(s,.2,{Transparency=.6}) end)
	b.MouseLeave:Connect(function() tw(s,.25,{Transparency=1}) end)
	b.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then tw(s,.06,{Transparency=.05,Thickness=2.6}) task.delay(.2,function() tw(s,.4,{Transparency=1,Thickness=1.6}) end) end end)
	badge(b,t,d)
	local l=new("TextLabel",{Size=UDim2.new(1,-84,0,d and 18 or h),Position=UDim2.fromOffset(46,d and 7 or 0),Text=t,TextSize=12,TextXAlignment=XL,TextTruncate=TE},b)
	if d then new("TextLabel",{Size=UDim2.new(1,-84,0,12),Position=UDim2.fromOffset(46,26),Text=d,TextSize=9,TextColor3=T.DIM,TextXAlignment=XL,TextTruncate=TE},b) end
	new("TextLabel",{Size=UDim2.fromOffset(16,h),Position=UDim2.new(1,-26,0,0),Text="›",TextSize=18,TextColor3=T.DIM},b)
	b.Activated:Connect(function() fn(b,l) end)
	return b,l
end
function X.holder(pg)
	local hd={open=false}
	local outer=new("Frame",{Size=UDim2.new(1,-6,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=false},pg)
	local line=new("Frame",{Size=UDim2.new(0,2,1,-10),Position=UDim2.fromOffset(9,5),BackgroundColor3=T.AC,BackgroundTransparency=.55},outer) rd(line,99)
	local inner=new("Frame",{Size=UDim2.new(1,-24,0,0),Position=UDim2.fromOffset(22,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1},outer)
	new("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},inner)
	new("UIPadding",{PaddingTop=UDim.new(0,2),PaddingBottom=UDim.new(0,4)},inner)
	hd.outer,hd.inner=outer,inner
	function hd.finish() local s="" for _,c in ipairs(inner:GetChildren()) do local a=c:GetAttribute("st") if a then s=s.." "..a end end outer:SetAttribute("st",s) end
	function hd.set(on,anim)
		hd.open=on
		if X.search then return end
		if on then outer.Visible=true if anim then X.stag(inner) end else outer.Visible=false end
	end
	X.holds[outer]=hd
	return hd
end
local function tog(pg,t,k,d,fn,sub)
	local r,s=row(pg,d and 48 or 38,t.." "..(d or "")) badge(r,t,d) lbl(r,t,d,66)
	X.meta[k]={t=t,i=X.ico(t,d)}
	local b=new("TextButton",{Size=UDim2.fromOffset(42,22),Position=UDim2.new(1,-54,.5,-11),Text="",AutoButtonColor=false},r) rd(b,99)
	acc(b,"BackgroundColor3",function() return F[k] end)
	local kn=new("Frame",{Size=UDim2.fromOffset(16,16),Position=UDim2.fromOffset(3,3),BackgroundColor3=T.OA},b) rd(kn,99)
	local hd=sub and X.holder(pg)
	if hd then sub(hd.inner) hd.finish() end
	local pulse=TS:Create(s,TweenInfo.new(1.1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),{Transparency=.78})
	local function pn(a)
		local on=F[k] and true or false
		r:SetAttribute("on",on)
		local c,kc,p=on and T.AC or T.OF,on and T.OA or T.TX,on and UDim2.fromOffset(23,3) or UDim2.fromOffset(3,3)
		if on then s.Transparency=.2 pulse:Play() else pulse:Cancel() tw(s,.3,{Transparency=.9}) end
		if a then
			tw(b,.2,{BackgroundColor3=c}) tw(kn,.1,{Size=UDim2.fromOffset(22,16)})
			tw(kn,.35,{BackgroundColor3=kc,Position=p},Enum.EasingStyle.Back)
			task.delay(.1,function() tw(kn,.3,{Size=UDim2.fromOffset(16,16)},Enum.EasingStyle.Back) end)
		else b.BackgroundColor3=c kn.BackgroundColor3=kc kn.Position=p end
		if hd then hd.set(on,a) end
	end
	pn() REP[#REP+1]=function() pn() end
	TG[k]=function(v,q) F[k]=v pn(not q) if fn then fn(v) end end
	b.Activated:Connect(function() TG[k](not F[k]) end)
	return r
end
local function sld(pg,t,k,mn,mx,d,fn,stp)
	stp=stp or ((mx-mn)>=5 and 1 or .01)
	local dec=stp>=1 and 0 or (stp>=.1 and 1 or 2)
	local h=d and 62 or 52
	local r=row(pg,h,t.." "..(d or "")) badge(r,t,d,8) lbl(r,t,d,90,true)
	local vl=new("TextLabel",{Size=UDim2.fromOffset(78,18),Position=UDim2.new(1,-90,0,8),Font=T.HF,TextSize=11,TextXAlignment=XR,TextColor3=T.AC},r)
	local hit=new("Frame",{Size=UDim2.new(1,-62,0,26),Position=UDim2.fromOffset(46,h-30),BackgroundTransparency=1},r)
	local tkk=new("Frame",{Size=UDim2.new(1,0,0,4),Position=UDim2.new(0,0,.5,-2),BackgroundColor3=T.TR},hit) rd(tkk,99)
	local fl2=new("Frame",{Size=UDim2.new(0,0,1,0),BackgroundColor3=T.AC},tkk) rd(fl2,99)
	local kn=new("Frame",{Size=UDim2.fromOffset(14,14),AnchorPoint=Vector2.new(.5,.5),Position=UDim2.new(0,0,.5,0),BackgroundColor3=T.AC},tkk) rd(kn,99)
	local fmt="%."..dec.."f"
	local function s(v)
		v=math.clamp(v,mn,mx) v=mn+math.floor((v-mn)/stp+.5)*stp v=math.clamp(tonumber(string.format(fmt,v)) or mn,mn,mx)
		F[k]=v local f=(v-mn)/(mx-mn) fl2.Size=UDim2.new(f,0,1,0) kn.Position=UDim2.new(f,0,.5,0) vl.Text=string.format(fmt,v)
		if fn then fn(v) end
	end
	SL[k]=s s(F[k])
	local act,off,sf=nil,0,nil
	local function setX(x) s(mn+math.clamp((x-tkk.AbsolutePosition.X)/math.max(tkk.AbsoluteSize.X,1),0,1)*(mx-mn)) end
	local function stop() if not act then return end act=nil tw(kn,.2,{Size=UDim2.fromOffset(14,14)},Enum.EasingStyle.Back) if sf then sf.ScrollingEnabled=true sf=nil end end
	hit.InputBegan:Connect(function(i)
		local mouse=i.UserInputType==Enum.UserInputType.MouseButton1
		local touch=i.UserInputType==Enum.UserInputType.Touch
		if not (mouse or touch) then return end
		local kx=kn.AbsolutePosition.X+kn.AbsoluteSize.X/2
		if touch and math.abs(i.Position.X-kx)>34 then return end
		act=i off=touch and (kx-i.Position.X) or 0
		sf=hit:FindFirstAncestorWhichIsA("ScrollingFrame") if sf then sf.ScrollingEnabled=false end
		tw(kn,.15,{Size=UDim2.fromOffset(20,20)},Enum.EasingStyle.Back)
		setX(i.Position.X+off)
		i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then stop() end end)
	end)
	cn(UIS.InputChanged:Connect(function(i) if not act then return end if act.UserInputState==Enum.UserInputState.End then stop() return end if i==act or i.UserInputType==Enum.UserInputType.MouseMovement then setX(i.Position.X+off) end end))
	cn(UIS.InputEnded:Connect(function(i) if act and (i==act or i.UserInputType==Enum.UserInputType.MouseButton1) then stop() end end))
	return r
end
local function nbox(pg,t,k,d)
	local r=row(pg,d and 48 or 38,t.." "..(d or "")) badge(r,t,d) lbl(r,t,d,136)
	local b=new("TextBox",{Size=UDim2.fromOffset(110,24),Position=UDim2.new(1,-122,.5,-12),Text=tostring(F[k]),ClearTextOnFocus=false,TextSize=12,BackgroundColor3=T.RB},r) rd(b,8)
	SL[k]=function(v) F[k]=v b.Text=tostring(v) end
	b.FocusLost:Connect(function() local n=tonumber(b.Text) if n then F[k]=n else b.Text=tostring(F[k]) end end)
end
local function tbox(pg,ph,bt,fn)
	local r=row(pg,42,ph)
	local b=new("TextBox",{Size=UDim2.new(1,-124,0,26),Position=UDim2.fromOffset(8,8),Text="",PlaceholderText=ph,ClearTextOnFocus=false,TextSize=12,BackgroundColor3=T.RB,TextXAlignment=XL},r) rd(b,8)
	new("UIPadding",{PaddingLeft=UDim.new(0,8)},b)
	local a=new("TextButton",{Size=UDim2.fromOffset(100,26),Position=UDim2.new(1,-108,0,8),Text=bt,TextSize=11,BackgroundColor3=T.RB},r) rd(a,8) press(a)
	local function go() local n=b.Text:match("^%s*(.-)%s*$") if n~="" then fn(n) b.Text="" end end
	a.Activated:Connect(go) b.FocusLost:Connect(function(en) if en then go() end end)
end
local function chips(pg,title,set,list,neg)
	local r=new("Frame",{Size=UDim2.new(1,-6,0,0),AutomaticSize=Enum.AutomaticSize.Y},pg) rd(r,10) r:SetAttribute("st",title:lower())
	new("UIPadding",{PaddingTop=UDim.new(0,8),PaddingBottom=UDim.new(0,8),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8)},r)
	new("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},r)
	new("TextLabel",{Size=UDim2.new(1,0,0,16),Text=title,TextSize=10,TextColor3=T.DIM,TextXAlignment=XL},r)
	local g=new("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1},r)
	new("UIGridLayout",{CellSize=UDim2.new(.5,-3,0,26),CellPadding=UDim2.fromOffset(6,6),SortOrder=Enum.SortOrder.LayoutOrder},g)
	local bs={}
	local function paint(n) local on=set[n] bs[n].Text=(neg and on) and ("[X] "..n) or n tw(bs[n],.2,{BackgroundColor3=on and (neg and rgb(100,28,28) or T.AC) or T.RB,TextColor3=(on and not neg) and T.OA or T.TX}) end
	local function add(n)
		if bs[n] then return end
		bs[n]=new("TextButton",{Text=n,TextSize=11,BackgroundColor3=T.RB,TextTruncate=TE},g) rd(bs[n],8) press(bs[n])
		bs[n].Activated:Connect(function() set[n]=not set[n] or nil paint(n) end)
	end
	for _,n in ipairs(list) do add(n) end
	local function rp() for n in pairs(bs) do paint(n) end end
	REP[#REP+1]=rp
	return add,rp
end
function X.opts(pg,title,list,get,set)
	local r=new("Frame",{Size=UDim2.new(1,-6,0,0),AutomaticSize=Enum.AutomaticSize.Y},pg) rd(r,10) r:SetAttribute("st",title:lower())
	new("UIPadding",{PaddingTop=UDim.new(0,8),PaddingBottom=UDim.new(0,8),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8)},r)
	new("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},r)
	new("TextLabel",{Size=UDim2.new(1,0,0,16),Text=title,TextSize=10,TextColor3=T.DIM,TextXAlignment=XL},r)
	local g=new("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1},r)
	new("UIGridLayout",{CellSize=UDim2.new(.5,-3,0,26),CellPadding=UDim2.fromOffset(6,6),SortOrder=Enum.SortOrder.LayoutOrder},g)
	local bs={}
	local function paint() for n,b in pairs(bs) do local on=get()==n tw(b,.2,{BackgroundColor3=on and T.AC or T.RB,TextColor3=on and T.OA or T.TX}) end end
	for _,n in ipairs(list) do bs[n]=new("TextButton",{Text=n,TextSize=11,BackgroundColor3=T.RB,TextTruncate=TE},g) rd(bs[n],8) press(bs[n]) bs[n].Activated:Connect(function() set(n) paint() end) end
	paint() REP[#REP+1]=paint
end
-- ===== Part 2 + 3 (merged) =====
for k,v in pairs({
fly=false,spd=120,walk=false,walkS=32,noclip=false,inf=false,afk=false,shiftlock=false,arj=false,bhop=false,jp=false,jpv=100,gravOn=false,grav=196,ctp=false,instp=false,fovOn=false,fovV=70,fpsb=false,zoomOn=false,zoomV=100,fb=false,fps=false,gfont=false,spin=false,spinS=12,frz=false,nofog=false,ctOn=false,ct=14,
esp=false,pesp=true,pbox=true,phb=true,ptr=false,chams=false,pteam=true,edist=2000,
aim=false,aimhold=false,sticky=true,team=false,wall=false,cross=false,face=true,trig=false,tdel=.05,pred=.1,afov=200,smooth=0,hbx=false,hbs=6,mel=false,melr=12,melf=true,
auto=false,stay=1,cruise=40,back=true,tpb=false,rspd=600,runS=70,runB=90,bsafe=0,alert=true,snd=true,eesp=true,etr=false,
mlfarm=false,mlrate=10,mlreb=false,mlcry=false,mlcnt=10,mlcdel=.4,mlmin=0,mlka=false,mlkr=20,mlkall=false,mlktp=false,mlfr=true,
mmesp=true,mmcoin=false,mmr=200,mmgun=false,mmwarn=false,mmwr=45,mmgesp=false,mmsafe=false,mmsd=35,mmtr=false,
bffesp=false,bfcesp=false,bfacf=false,bfacc=false,bfnot=true,
drpesp=false,drauto=false,drr=12,drd=120,dral=true,
bbp=false,bbt=.35,bbs=false,bbesp=false,skyh=350,
fbeast=true,fcomp=false,fexit=false,fpod=false,fwarn=false,fwr=40,
lorb=false,lrate=20,lall=false,lhoop=false,lrace=false,shoop=false,sreb=false,
sclk=false,sck=8,sacol=false,scr=80,ssell=false,segg=false,schest=false,sshop=false,
lfarm=false,lfr=30,lftp=true,lfa=6,lclk=false,lbuy=false,ldmg=false,lbi=1,llift=false,qint=false,qr=14,
nesp=false,nwarn=false,nwr=60,lootesp=false,finesp=false,
tcol=false,tcr=60,tbuy=false,tbi=1,tpes=false,
vboost=false,vspd=80,vfly=false,vfs=120,vgrip=false}) do F[k]=v end
for k in ("auto fly aim trig mlfarm mlcry mlka mlreb mlkall mlktp mmcoin mmgun mmsafe drauto bbp bbs ctp lorb lall lhoop lrace sclk sacol ssell sreb bfacf bfacc hbx bhop mel lfarm lbuy ldmg llift tcol tbuy vboost vfly qint spin frz"):gmatch("%S+") do NS[k]=true end
local E={EG={},BL={},SE={},SR={},BK={},KW={},SA={},mode="go",atE=false,got=0,t0=tick()}
E.pick,E.scan,E.ppos,E.rar,E.grab,E.reg,E.match,E.eStep=nop,nop,nop,nop,nop,nop,nop,nop
E.addE,E.rpE,E.addR,E.rpR,E.addB,E.rpB,E.addA,E.rpA=nop,nop,nop,nop,nop,nop,nop,nop
X.tn,X.ti,X.tpn={"Head","Chest","Legs","Root"},1,"Head"
X.TT={Head={"Head"},Chest={"UpperTorso","Torso"},Legs={"LowerTorso","Left Leg"},Root={"HumanoidRootPart"}}
X.OV,X.RH,X.g0,X.RM,X.RT,X.ps,X.hb,X.prio={}, {}, workspace.Gravity, {}, {}, {}, {}, 1
X.specP,X.follow,X.t0s,X.cls=nil,nil,tick(),{}
-- fixed accent repaint (skips preview swatches)
function X.repaint()
	local l=X.accR
	for i=#l,1,-1 do local r=l[i] local o=r[1]
		if o.Parent then if not o:GetAttribute("keep") and (not r[3] or r[3]()) then o[r[2]]=T.AC end else table.remove(l,i) end
	end
end
local function alive(p) local c=p.Character local h=c and c:FindFirstChildOfClass("Humanoid") return h~=nil and h.Health>0 and c:FindFirstChild("HumanoidRootPart")~=nil end
local function w2(v) local o=workspace.CurrentCamera:WorldToViewportPoint(v) return Vector2.new(o.X,o.Y),o.Z end
local function mkf() return new("Frame",{AnchorPoint=Vector2.new(.5,.5),BackgroundColor3=WH,Visible=false,ZIndex=2},EL) end
local function ln(f,p1,p2) local d=p2-p1 f.Position=UDim2.fromOffset((p1.X+p2.X)/2,(p1.Y+p2.Y)/2) f.Size=UDim2.fromOffset(d.Magnitude,1.5) f.Rotation=math.deg(math.atan2(d.Y,d.X)) f.Visible=true end
local function cnt(s) local n=0 for _ in pairs(s) do n=n+1 end return n end
local function addG(f) local o=GST GST=function(dt) o(dt) f(dt) end end
local function K(o) o:SetAttribute("keep",true) return o end
-- ===== shared helpers =====
do
	local ctl,ctt pcall(function() ctl=require(LP.PlayerScripts.PlayerModule):GetControls() end) ctt=0
	function X.flyDir(h,cm)
		if not ctl and tick()-ctt>3 then ctt=tick() pcall(function() ctl=require(LP.PlayerScripts:FindFirstChild("PlayerModule")):GetControls() end) end
		local mv=Vector3.zero
		if ctl then local o,v=pcall(ctl.GetMoveVector,ctl) if o and typeof(v)=="Vector3" then mv=v end end
		local typing=UIS:GetFocusedTextBox()~=nil
		if mv.Magnitude<.05 and not typing then
			local kx=(UIS:IsKeyDown(Enum.KeyCode.D) and 1 or 0)-(UIS:IsKeyDown(Enum.KeyCode.A) and 1 or 0)
			local kz=(UIS:IsKeyDown(Enum.KeyCode.S) and 1 or 0)-(UIS:IsKeyDown(Enum.KeyCode.W) and 1 or 0)
			mv=Vector3.new(kx,0,kz)
		end
		if mv.Magnitude<.05 and h then
			local md=h.MoveDirection
			if md.Magnitude>.05 then
				local lk,rv=cm.CFrame.LookVector,cm.CFrame.RightVector
				local fw,fr=Vector3.new(lk.X,0,lk.Z),Vector3.new(rv.X,0,rv.Z)
				if fw.Magnitude>.01 and fr.Magnitude>.01 then fw,fr=fw.Unit,fr.Unit mv=Vector3.new(md:Dot(fr),0,-md:Dot(fw)) end
			end
		end
		local dir=cm.CFrame.LookVector*-mv.Z+cm.CFrame.RightVector*mv.X
		if not typing then
			local up=(UIS:IsKeyDown(Enum.KeyCode.Space) and 1 or 0)-((UIS:IsKeyDown(Enum.KeyCode.LeftControl) or UIS:IsKeyDown(Enum.KeyCode.LeftShift)) and 1 or 0)
			dir=dir+Vector3.yAxis*up
		end
		if dir.Magnitude>1 then dir=dir.Unit end
		return dir
	end
end
function X.spec(p)
	X.specP=p
	local cm=workspace.CurrentCamera
	if p then local h=p.Character and p.Character:FindFirstChildOfClass("Humanoid") if h then cm.CameraSubject=h toast("Viewing "..p.DisplayName) end
	else local h=hum() if h then cm.CameraSubject=h end end
end
function X.dot(k,pos,txt,tr,col)
	local d=X.OV[k]
	if not d then d={tx=new("TextLabel",{AnchorPoint=Vector2.new(.5,1),Size=UDim2.fromOffset(220,28),TextSize=11,TextStrokeTransparency=.4,TextColor3=WH,Visible=false,ZIndex=2},EL),ln=mkf()} X.OV[k]=d end
	local cm=workspace.CurrentCamera local v=cm:WorldToViewportPoint(pos)
	d.tx.Visible=v.Z>0 and txt~=nil d.ln.Visible=false
	if v.Z<=0 then return end
	if col then d.tx.TextColor3=col d.ln.BackgroundColor3=col end
	if txt then d.tx.Text=txt d.tx.Position=UDim2.fromOffset(v.X,v.Y) end
	if tr then ln(d.ln,Vector2.new(cm.ViewportSize.X/2,cm.ViewportSize.Y),Vector2.new(v.X,v.Y)) end
end
function X.hdot(k) local d=X.OV[k] if d then d.tx.Visible=false d.ln.Visible=false end end
cn(workspace.DescendantRemoving:Connect(function(o) local d=X.OV[o] if d then d.tx:Destroy() d.ln:Destroy() X.OV[o]=nil end end))
function X.watch(pred)
	local set={}
	local function reg(o) if not set[o] then local o2,r=pcall(pred,o) if o2 and r then set[o]=true end end end
	task.spawn(function() for i,o in ipairs(workspace:GetDescendants()) do reg(o) if i%400==0 then task.wait() end end end)
	cn(workspace.DescendantAdded:Connect(reg))
	cn(workspace.DescendantRemoving:Connect(function(o) set[o]=nil end))
	return set
end
function X.getPRS() if not X.PRS then X.PRS=X.watch(function(o) return o:IsA("ProximityPrompt") end) end return X.PRS end
function X.nroot(h) local m=h.Parent return m and (m:FindFirstChild("HumanoidRootPart") or m.PrimaryPart or m:FindFirstChildWhichIsA("BasePart")) end
function X.opos(o)
	if o:IsA("BasePart") then return o.Position
	elseif o:IsA("Model") then local o2,cf=pcall(o.GetPivot,o) return o2 and cf.Position or nil
	elseif o:IsA("Attachment") then return o.WorldPosition
	elseif o:IsA("Humanoid") then local rt=X.nroot(o) return rt and rt.Position
	elseif o:IsA("ProximityPrompt") then local p=o.Parent if p then return X.opos(p) end
	elseif o:IsA("Tool") then local h=o:FindFirstChild("Handle") return h and h.Position end
end
function X.near(set)
	local r=root() if not r then return end
	local best,bd
	for o in pairs(set) do local p=o.Parent and X.opos(o) if p then local d=(p-r.Position).Magnitude if not bd or d<bd then best,bd=o,d end end end
	return best,bd
end
function X.tp(pos) local r=root() if r and pos then r.CFrame=CFrame.new(pos+Vector3.new(0,3,0)) end end
function X.inChar(o) local m=o.Parent while m and m~=workspace do if m:FindFirstChildOfClass("Humanoid") then return true end m=m.Parent end return false end
function X.touch(o)
	local r=root() if not r then return end
	local function t(d) if firetouchinterest then pcall(function() firetouchinterest(r,d,0) firetouchinterest(r,d,1) end) end end
	if o:IsA("BasePart") then t(o) end
	for _,d in ipairs(o:GetDescendants()) do
		if d:IsA("ProximityPrompt") then pcall(fireproximityprompt,d) elseif d:IsA("ClickDetector") then pcall(fireclickdetector,d) elseif d:IsA("BasePart") then t(d) end
	end
end
function X.click()
	if mouse1click then pcall(mouse1click) return end
	pcall(function() local vs=workspace.CurrentCamera.ViewportSize VIM:SendMouseButtonEvent(vs.X/2,vs.Y/2,0,true,game,0) VIM:SendMouseButtonEvent(vs.X/2,vs.Y/2,0,false,game,0) end)
end
function X.named(keys)
	local o={set={},keys=keys}
	local function has(n) for _,k in ipairs(o.keys) do if n:find(k,1,true) then return true end end return false end
	local function ok(i)
		if not (i:IsA("Model") or i:IsA("BasePart")) then return false end
		if not has(i.Name:lower()) then return false end
		if X.inChar(i) then return false end
		if i:IsA("BasePart") and i.Parent and i.Parent:IsA("Model") and has(i.Parent.Name:lower()) then return false end
		return true
	end
	local function reg(i) if not o.set[i] then local a,b=pcall(ok,i) if a and b then o.set[i]=true end end end
	function o.scan() task.spawn(function() for n,i in ipairs(workspace:GetDescendants()) do reg(i) if n%400==0 then task.wait() end end end) end
	function o.add(k) o.keys[#o.keys+1]=k:lower() o.scan() end
	o.scan()
	cn(workspace.DescendantAdded:Connect(reg))
	cn(workspace.DescendantRemoving:Connect(function(i) o.set[i]=nil end))
	return o
end
function X.npcs()
	local set={}
	local function reg(o) if o:IsA("Humanoid") and not set[o] then local m=o.Parent if m and not P:GetPlayerFromCharacter(m) and not (LP.Character and m==LP.Character) then set[o]=true end end end
	task.spawn(function() for i,o in ipairs(workspace:GetDescendants()) do reg(o) if i%400==0 then task.wait() end end end)
	cn(workspace.DescendantAdded:Connect(reg))
	cn(workspace.DescendantRemoving:Connect(function(o) set[o]=nil end))
	return set
end
function X.npcClean(set) for h in pairs(set) do if not h.Parent or P:GetPlayerFromCharacter(h.Parent) then set[h]=nil end end end
function X.nearNpc(set,filt)
	local r=root() if not r then return end
	local best,bd
	for h in pairs(set) do
		local m=h.Parent
		if m and h.Health>0 and not P:GetPlayerFromCharacter(m) then
			local rt=X.nroot(h)
			if rt then
				local okk=true
				if filt and #filt>0 then okk=false local n=m.Name:lower() for _,k in ipairs(filt) do if n:find(k,1,true) then okk=true break end end end
				if okk then local d=(rt.Position-r.Position).Magnitude if not bd or d<bd then best,bd=h,d end end
			end
		end
	end
	return best,bd
end
function X.pass(set,on,col,label,cap)
	local st=X.ps[set] if not st then st={t=0,list={}} X.ps[set]=st end
	local r=root()
	if not on or not r then
		if st.on then for _,o in ipairs(st.list) do X.hdot(o) end st.list={} st.on=false end
		return
	end
	st.on=true
	if tick()-st.t>.4 then
		st.t=tick()
		local c={}
		for o in pairs(set) do
			if o.Parent and (not o:IsA("Humanoid") or o.Health>0) then
				local p=X.opos(o)
				if p then local d=(p-r.Position).Magnitude if d<=F.edist then c[#c+1]={o,d} end end
			end
		end
		table.sort(c,function(a,b) return a[2]<b[2] end)
		local nl,keep={}, {}
		for i=1,math.min(#c,cap or 40) do nl[i]=c[i][1] keep[c[i][1]]=true end
		for _,o in ipairs(st.list) do if not keep[o] then X.hdot(o) end end
		st.list=nl
	end
	for _,o in ipairs(st.list) do
		local p=o.Parent and X.opos(o)
		if p then
			local nm=o:IsA("Humanoid") and (o.Parent and o.Parent.Name or "NPC") or o.Name
			X.dot(o,p,label..": "..nm.."\n"..math.floor((p-r.Position).Magnitude).."m",false,col)
		else X.hdot(o) end
	end
end
function X.rem(names)
	for _,n in ipairs(names) do
		local r=X.RM[n]
		if r and r.Parent then return r end
		if not X.RT[n] or tick()-X.RT[n]>2 then
			X.RT[n]=tick() r=nil
			for _,rt in ipairs({LP,game:GetService("ReplicatedStorage")}) do
				local x=rt:FindFirstChild(n,true)
				if x and (x:IsA("RemoteEvent") or x:IsA("RemoteFunction")) then r=x break end
			end
			X.RM[n]=r
			if r then return r end
		end
	end
end
function X.remFind(sub)
	local key="~"..sub
	local c=X.RM[key]
	if c and c.Parent then return c end
	if X.RT[key] and tick()-X.RT[key]<3 then return nil end
	X.RT[key]=tick()
	for _,rt in ipairs({game:GetService("ReplicatedStorage"),LP}) do
		for _,d in ipairs(rt:GetDescendants()) do
			if (d:IsA("RemoteEvent") or d:IsA("RemoteFunction")) and d.Name:lower():find(sub,1,true) then X.RM[key]=d return d end
		end
	end
end
function X.call(r,...)
	local a={...}
	return pcall(function() if r:IsA("RemoteFunction") then return r:InvokeServer(unpack(a)) end r:FireServer(unpack(a)) return nil end)
end
function X.fire(names,...) local r=X.rem(names) if not r then return false end local a={...} task.spawn(function() X.call(r,unpack(a)) end) return true end
-- auto buy / collect engine (prompts, touch parts, on-screen buttons)
function X.buyer(keys)
	local B={keys=keys}
	local BAD={"robux","r$","gamepass","premium","vip","donat"}
	local function has(s,list) for _,k in ipairs(list) do if s:find(k,1,true) then return true end end return false end
	B.PRS=X.getPRS() B.named=X.named(keys)
	local function ptxt(pr) local p=pr.Parent return ((pr.ObjectText or "").." "..(pr.ActionText or "").." "..(p and p.Name or "").." "..((p and p.Parent) and p.Parent.Name or "")):lower() end
	local function btxt(d) local s=d.Name:lower() if d:IsA("TextButton") then s=s.." "..d.Text:lower() end for _,ch in ipairs(d:GetChildren()) do if ch:IsA("TextLabel") then s=s.." "..ch.Text:lower() end end return s end
	local function clickBtn(b)
		if not getconnections then return false end
		local did=false
		for _,sg in ipairs({b.MouseButton1Click,b.Activated,b.MouseButton1Down}) do
			pcall(function() for _,c in ipairs(getconnections(sg)) do if c.Fire then c:Fire() did=true elseif c.Function then c.Function() did=true end end end)
		end
		return did
	end
	function B.buttons(list)
		local out={}
		if not getconnections then return out end
		local pgui=LP:FindFirstChildOfClass("PlayerGui")
		if pgui then for _,d in ipairs(pgui:GetDescendants()) do
			if (d:IsA("TextButton") or d:IsA("ImageButton")) and d.Visible and not d:IsDescendantOf(gui) then local s=btxt(d) if has(s,list) and not has(s,BAD) then out[#out+1]=d end end
		end end
		return out
	end
	function B.run(list,range)
		local n,r=0,root()
		for pr in pairs(B.PRS) do
			if pr.Parent and pr.Enabled then
				local s=ptxt(pr)
				if has(s,list) and not has(s,BAD) then
					local ok2=true
					if range and r then local p=X.opos(pr) ok2=p~=nil and (p-r.Position).Magnitude<=range end
					if ok2 then pcall(fireproximityprompt,pr) n=n+1 end
				end
			end
		end
		local c=0
		for o in pairs(B.named.set) do
			if o.Parent and c<12 then
				local s=o.Name:lower()
				if has(s,list) and not has(s,BAD) then
					local ok2=true
					if range and r then local p=X.opos(o) ok2=p~=nil and (p-r.Position).Magnitude<=range end
					if ok2 then c=c+1 pcall(X.touch,o) end
				end
			end
		end
		for _,b in ipairs(B.buttons(list)) do if clickBtn(b) then n=n+1 end end
		return n+c
	end
	function B.counts(list)
		local a,b2=0,0
		for pr in pairs(B.PRS) do if pr.Parent and has(ptxt(pr),list) then a=a+1 end end
		for o in pairs(B.named.set) do if o.Parent and has(o.Name:lower(),list) then b2=b2+1 end end
		return a,b2
	end
	function B.printAll(list)
		local n=0
		for pr in pairs(B.PRS) do if pr.Parent and has(ptxt(pr),list) then print("[Eko] prompt:",pr:GetFullName()) n=n+1 end end
		for o in pairs(B.named.set) do if o.Parent then print("[Eko] part:",o:GetFullName()) n=n+1 end end
		for _,b in ipairs(B.buttons(list)) do print("[Eko] button:",b:GetFullName()) n=n+1 end
		return n
	end
	return B
end
X.pia=0
function X.promptStep(dt)
	local PR=X.getPRS() local r=root()
	for pr in pairs(PR) do
		local p=pr.Parent and X.opos(pr)
		if p and r and F.drpesp then
			local d=(p-r.Position).Magnitude
			if d<=F.drd and pr.Enabled then
				local nm=pr.ObjectText~="" and pr.ObjectText or (pr.Parent and pr.Parent.Name or "?")
				X.dot(pr,p,nm.."\n"..(pr.ActionText~="" and (pr.ActionText.." | ") or "")..math.floor(d).."m",false,rgb(255,230,120))
			else X.hdot(pr) end
		else X.hdot(pr) end
	end
	if F.drauto and r then
		X.pia=X.pia+dt
		if X.pia>.3 then X.pia=0 for pr in pairs(PR) do local p=pr.Parent and X.opos(pr) if p and pr.Enabled and (p-r.Position).Magnitude<=F.drr and not pr.ActionText:lower():find("hide") then pcall(fireproximityprompt,pr) end end end
	end
end
function X.promptUI(g)
	sec(g,"Prompts")
	tog(g,"Prompt ESP","drpesp","Labels items, doors and levers you can interact with",nil,function(s) sld(s,"ESP Range","drd",20,400,"How far away prompts get labeled") end)
	tog(g,"Auto Interact","drauto","Presses nearby prompts for you (skips hiding spots)",nil,function(s) sld(s,"Interact Range","drr",4,30,"How close you must be for auto interact") end)
	btn(g,"Teleport To Nearest Prompt","Jumps to the closest interactable object",function()
		local best,bd,r=nil,nil,root()
		for pr in pairs(X.getPRS()) do if pr.Parent and pr.Enabled and r then local p=X.opos(pr) if p then local d=(p-r.Position).Magnitude if not bd or d<bd then best,bd=p,d end end end end
		if best then X.tp(best) else toast("No prompts found") end
	end)
end
function X.monsters(pg)
	local NPC=X.npcs()
	sec(pg,"Monsters")
	tog(pg,"Monster ESP","nesp","Labels nearby monsters / bots with their distance")
	tog(pg,"Monster Warning","nwarn","Pop-up when one gets close to you",nil,function(s) sld(s,"Warning Distance","nwr",20,200,"How close it must be to warn you") end)
	btn(pg,"Print Monster Names","Lists every NPC found in the F9 console",function()
		local seen,n={}, 0
		for h in pairs(NPC) do local nm=h.Parent and h.Parent.Name if nm and not seen[nm] then seen[nm]=true print("[Eko] npc:",nm) n=n+1 end end
		toast(n.." names printed (F9)")
	end)
	local mc=note(pg,"",34)
	local cl,wl,s3=0,0,0
	return function(dt)
		cl=cl+dt if cl>1 then cl=0 X.npcClean(NPC) end
		X.pass(NPC,F.nesp,rgb(255,90,90),"Monster",30)
		local npc,d=X.nearNpc(NPC)
		if F.nwarn and npc and d<=F.nwr and tick()-wl>4 then wl=tick() toast("Monster nearby: "..(npc.Parent and npc.Parent.Name or "?").." ("..math.floor(d).."m)") end
		s3=s3+dt
		if s3>.6 then s3=0 local n=0 for h in pairs(NPC) do if h.Parent and h.Health>0 then n=n+1 end end mc.Text="Living monsters tracked: "..n..(npc and ("\nNearest: "..(npc.Parent and npc.Parent.Name or "?").." at "..math.floor(d).."m") or "") end
	end
end
function X.crystalUI(pg,list)
	local cry,ci,costs,gv,gt0,opened,lastRes=list[1],1,{},nil,0,0,"-"
	local opening=false
	local function gems()
		if not (gv and gv.Parent) then gv=nil if tick()-gt0>5 then gt0=tick() for _,d in ipairs(LP:GetDescendants()) do if d.Name=="Gems" and d:IsA("ValueBase") then gv=d break end end end end
		return gv and gv.Value
	end
	local function canOpen() local g=gems() return not g or g>=F.mlmin+(costs[cry] or 0) end
	local function openOne()
		local g0=gems()
		local r=X.rem({"openCrystalRemote"})
		if not r then lastRes="remote not found" toast("Crystal remote not found") return false end
		local ok2,res=X.call(r,"openCrystal",cry)
		lastRes=ok2 and (res~=nil and tostring(res) or "sent") or ("error: "..tostring(res))
		task.wait(.35)
		local g1=gems()
		if g0 and g1 then if g0>g1 then costs[cry]=g0-g1 opened=opened+1 return true,true end return true,false end
		opened=opened+1 return true,true
	end
	local function openN(n,auto)
		if opening then toast("Already opening") return end
		opening=true
		task.spawn(function()
			local fails,i=0,0
			while opening and i<math.floor(n) do
				i=i+1
				if not canOpen() then toast("Stopped: gem limit") break end
				local ok2,spent=openOne()
				if not ok2 then break end
				if spent==false then fails=fails+1 if fails>=3 then toast("No gems spent. Check crystal name / gems") break end else fails=0 end
				task.wait(F.mlcdel)
			end
			opening=false
			if auto and F.mlcry then TG.mlcry(false) end
		end)
	end
	sec(pg,"Crystal")
	btn(pg,"Crystal: "..cry,"Tap to cycle which crystal gets opened",function(b,l) ci=ci%#list+1 cry=list[ci] l.Text="Crystal: "..cry end)
	tbox(pg,"custom crystal name...","Use Name",function(n) cry=n toast("Crystal: "..n) end)
	local crl=note(pg,"",46)
	sec(pg,"Opening")
	sld(pg,"Open Amount","mlcnt",1,100,"How many crystals to open at once (whole numbers)")
	btn(pg,"Open Now","Opens the amount set above",function() openN(F.mlcnt) end)
	btn(pg,"Measure Cost (opens 1)","Opens one crystal to learn how many gems it costs",function() openN(1) end)
	tog(pg,"Auto Open Loop","mlcry","Keeps opening until you run out or hit your limit",function(v) if v then openN(math.huge,true) else opening=false end end,function(s)
		sld(s,"Open Delay (sec)","mlcdel",.1,2,"Wait between each crystal",nil,.1)
		nbox(s,"Keep At Least (gems)","mlmin","Stops opening before you drop under this many gems")
	end)
	btn(pg,"Stop Opening","Cancels any opening that is running",function() opening=false end)
	return function() crl.Text=string.format("Crystal: %s | Gems: %s\nCost per open: %s | Opened: %d\nLast reply: %s",cry,tostring(gems() or "?"),costs[cry] and (costs[cry].." gems") or "unknown yet",opened,lastRes:sub(1,60)) end
end
local function plist(pg,fn)
	local box=new("Frame",{Size=UDim2.new(1,-6,0,270)},pg) rd(box,10)
	box:SetAttribute("st","players teleport view spectate follow list avatars")
	local sb=new("TextBox",{Size=UDim2.new(1,-90,0,26),Position=UDim2.fromOffset(8,8),Text="",PlaceholderText="Search players...",ClearTextOnFocus=false,TextSize=11,BackgroundColor3=T.RB,TextXAlignment=XL},box) rd(sb,8)
	new("UIPadding",{PaddingLeft=UDim.new(0,10)},sb)
	local sv=new("TextButton",{Size=UDim2.fromOffset(70,26),Position=UDim2.new(1,-78,0,8),Text="Stop All",TextSize=10,BackgroundColor3=T.RB},box) rd(sv,8) press(sv)
	sv.Activated:Connect(function() X.spec(nil) X.follow=nil toast("Stopped viewing / following") end)
	local sc=new("ScrollingFrame",{Size=UDim2.new(1,-10,1,-46),Position=UDim2.fromOffset(5,40),BackgroundTransparency=1,ScrollBarThickness=3,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y},box)
	new("UIListLayout",{Padding=UDim.new(0,4),SortOrder=Enum.SortOrder.Name},sc)
	local bs={}
	local function add(p)
		if p==LP or bs[p] then return end
		local f=new("Frame",{Size=UDim2.new(1,-6,0,44),Name=p.Name:lower()},sc) rd(f,8)
		f:SetAttribute("dn",p.DisplayName:lower())
		local im=new("ImageLabel",{Size=UDim2.fromOffset(34,34),Position=UDim2.fromOffset(6,5),BackgroundColor3=T.RB,Image=AV(p.UserId)},f) rd(im,99)
		new("TextLabel",{Size=UDim2.new(1,-206,0,16),Position=UDim2.fromOffset(48,6),Text=p.DisplayName,TextSize=12,TextXAlignment=XL,TextTruncate=TE},f)
		local sub=new("TextLabel",{Size=UDim2.new(1,-206,0,12),Position=UDim2.fromOffset(48,24),Text="@"..p.Name,TextSize=9,TextColor3=T.DIM,TextXAlignment=XL,TextTruncate=TE},f)
		local function mkb(txt,x,w,cb) local b=new("TextButton",{Size=UDim2.fromOffset(w,26),Position=UDim2.new(1,x,.5,-13),Text=txt,TextSize=10,BackgroundColor3=T.RB},f) rd(b,6) press(b) b.Activated:Connect(cb) end
		mkb("TP",-152,34,function() fn(p) toast("Teleported to "..p.DisplayName) end)
		mkb("VIEW",-114,44,function() X.spec(p) end)
		mkb("FOLLOW",-66,60,function() X.follow=p toast("Following "..p.DisplayName) end)
		bs[p]={f=f,sub=sub}
	end
	for _,p in ipairs(P:GetPlayers()) do add(p) end
	cn(P.PlayerAdded:Connect(add))
	cn(P.PlayerRemoving:Connect(function(p) if bs[p] then bs[p].f:Destroy() bs[p]=nil end if X.specP==p then X.spec(nil) end if X.follow==p then X.follow=nil end end))
	sb:GetPropertyChangedSignal("Text"):Connect(function()
		local q=sb.Text:lower()
		for _,v in pairs(bs) do v.f.Visible=(q=="") or (v.f.Name:find(q,1,true)~=nil) or ((v.f:GetAttribute("dn") or ""):find(q,1,true)~=nil) end
	end)
	task.spawn(function()
		while gui.Parent do
			task.wait(.7)
			local r=root()
			for p,v in pairs(bs) do
				local c=p.Character local h=c and c:FindFirstChildOfClass("Humanoid") local rt=c and c:FindFirstChild("HumanoidRootPart")
				v.sub.Text="@"..p.Name..((h and rt and r) and ("  •  "..math.floor((rt.Position-r.Position).Magnitude).."m  •  "..math.floor(h.Health).." HP") or "")
			end
		end
	end)
end
function X.lockCard(pg)
	local r=row(pg,48,"locked target")
	local im=new("ImageLabel",{Size=UDim2.fromOffset(34,34),Position=UDim2.fromOffset(10,7),BackgroundColor3=T.RB,Image=""},r) rd(im,99)
	local l1=new("TextLabel",{Size=UDim2.new(1,-60,0,18),Position=UDim2.fromOffset(54,7),Text="No lock",TextSize=12,TextXAlignment=XL},r)
	local l2=new("TextLabel",{Size=UDim2.new(1,-60,0,12),Position=UDim2.fromOffset(54,26),Text="Your aimbot target shows here",TextSize=9,TextColor3=T.DIM,TextXAlignment=XL},r)
	local cur
	X.setLock=function(p)
		if p==cur then return end cur=p
		if p then im.Image=AV(p.UserId) l1.Text=p.DisplayName l2.Text="@"..p.Name.."  •  locked on" else im.Image="" l1.Text="No lock" l2.Text="Your aimbot target shows here" end
	end
end
-- ===== tabs per game profile =====
local isE,runMode=(PROF=="pet" or PROF=="egg"),PROF=="egg"
local TABS={shoot={"Aimbot","Combat","ESP","Players"},crim={"Aimbot","Combat","Loot","ESP","Players"},brawl={"Combat","Aimbot","ESP","Players"},
	sim={"Farm","Teleport","ESP","Players"},los={"Farm","Crystals","Teleport","ESP","Players"},lls={"Lift","Teleport","ESP","Players"},ml={"Farm","Crystals","Combat","ESP","Players"},
	pet={"Egg","Blacklist","ESP","Players"},egg={"Egg","Blacklist","ESP","Players"},mm2={"Roles","Game","Aimbot","Safety","ESP","Players"},
	doors={"Doors"},nds={"Survival","Players"},evade={"Bots","ESP","Players"},ball={"Blade Ball","Players"},surv={"Survival","ESP","Players"},tyc={"Tycoon","Teleport","ESP","Players"},
	obby={"Obby","Players"},fruit={"Fruits","ESP","Players"},soc={"Aimbot","Players","ESP"},rpg={"NPC","Teleport","ESP","Players"},drive={"Vehicle","Teleport","Players"},uni={"Aimbot","Combat","ESP","Players"}}
PG.Home=tab("Home")
for _,n in ipairs(TABS[PROF] or TABS.uni) do PG[n]=tab(n) end
PG.g=PG[(TABS[PROF] or TABS.uni)[1]]
PG.Player,PG.Misc,PG.Configs,PG.Settings=tab("Player"),tab("Misc"),tab("Configs"),tab("Settings")
local cx={}
for i,s in ipairs({{14,2},{2,14}}) do cx[i]=new("Frame",{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(s[1],s[2]),BackgroundColor3=WH,Visible=false},EL) end
cx[3]=new("Frame",{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),BackgroundTransparency=1,Visible=false},EL) rd(cx[3],999) new("UIStroke",{Color=WH,Transparency=.5},cx[3])
local fl=new("TextLabel",{Size=UDim2.fromOffset(150,24),Position=UDim2.new(.5,-75,0,8),Text="FPS",BackgroundColor3=T.BG,BackgroundTransparency=.2,Visible=false,Active=true},gui) rd(fl,6) drag(fl,fl)
-- ===== HOME =====
function X.buildHome(pg)
	local gm for _,g in ipairs(GM) do if g.k==choice then gm=g end end
	local pr=new("Frame",{Size=UDim2.new(1,-6,0,106)},pg) rd(pr,12) pr:SetAttribute("st","home profile welcome account")
	local ring=new("Frame",{Size=UDim2.fromOffset(76,76),Position=UDim2.fromOffset(14,15),BackgroundColor3=WH},pr) rd(ring,99)
	local rgr=new("UIGradient",{Color=ColorSequence.new({kp(0,T.AC),kp(.5,T.BG),kp(1,T.AC)})},ring)
	TS:Create(rgr,TweenInfo.new(3.5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,-1),{Rotation=360}):Play()
	local av=new("ImageLabel",{AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.new(1,-8,1,-8),BackgroundColor3=T.RB,Image=AV(LP.UserId)},ring) rd(av,99)
	new("TextLabel",{Size=UDim2.new(1,-120,0,12),Position=UDim2.fromOffset(104,16),Text="WELCOME BACK",Font=T.HF,TextSize=8,TextColor3=T.AC,TextXAlignment=XL},pr)
	new("TextLabel",{Size=UDim2.new(1,-120,0,26),Position=UDim2.fromOffset(104,30),Text=LP.DisplayName,Font=T.HF,TextSize=18,TextXAlignment=XL,TextTruncate=TE},pr)
	new("TextLabel",{Size=UDim2.new(1,-120,0,14),Position=UDim2.fromOffset(104,60),Text="@"..LP.Name.."  •  ID "..LP.UserId,TextSize=10,TextColor3=T.DIM,TextXAlignment=XL,TextTruncate=TE},pr)
	new("TextLabel",{Size=UDim2.new(1,-120,0,14),Position=UDim2.fromOffset(104,76),Text="Account age: "..LP.AccountAge.." days",TextSize=10,TextColor3=T.DIM,TextXAlignment=XL},pr)
	local gc=new("Frame",{Size=UDim2.new(1,-6,0,104)},pg) rd(gc,12) gc:SetAttribute("st","game info "..GN:lower())
	local gi=new("ImageLabel",{Size=UDim2.fromOffset(76,76),Position=UDim2.fromOffset(14,14),BackgroundColor3=T.RB,ScaleType=Enum.ScaleType.Crop,Image="rbxthumb://type=GameIcon&id="..game.GameId.."&w=150&h=150"},gc) rd(gi,12)
	new("TextLabel",{Size=UDim2.new(1,-120,0,12),Position=UDim2.fromOffset(104,14),Text="CURRENT GAME",Font=T.HF,TextSize=8,TextColor3=T.AC,TextXAlignment=XL},gc)
	new("TextLabel",{Size=UDim2.new(1,-120,0,22),Position=UDim2.fromOffset(104,28),Text=GN,Font=T.HF,TextSize=14,TextXAlignment=XL,TextTruncate=TE},gc)
	new("TextLabel",{Size=UDim2.new(1,-120,0,30),Position=UDim2.fromOffset(104,52),Text=(gm and gm.d or "").."\nPlace "..game.PlaceId,TextSize=10,TextColor3=T.DIM,TextWrapped=true,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Top},gc)
	if gm then
		local fr=new("Frame",{Size=UDim2.new(1,-6,0,0),AutomaticSize=Enum.AutomaticSize.Y},pg) rd(fr,12) fr:SetAttribute("st","features inside "..gm.f:lower())
		new("UIPadding",{PaddingTop=UDim.new(0,10),PaddingBottom=UDim.new(0,12),PaddingLeft=UDim.new(0,14),PaddingRight=UDim.new(0,14)},fr)
		new("UIListLayout",{Padding=UDim.new(0,6)},fr)
		new("TextLabel",{Size=UDim2.new(1,0,0,12),Text="WHAT'S INSIDE",Font=T.HF,TextSize=8,TextColor3=T.AC,TextXAlignment=XL},fr)
		new("TextLabel",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,Text=gm.f,TextSize=11,TextWrapped=true,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Top},fr)
	end
	local st=new("Frame",{Size=UDim2.new(1,-6,0,64),BackgroundTransparency=1},pg) st:SetAttribute("st","stats fps ping players session")
	new("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6)},st)
	X.home={}
	for _,s in ipairs({{"fps","FPS"},{"ping","PING"},{"pl","PLAYERS"},{"ses","SESSION"}}) do
		local t=new("Frame",{Size=UDim2.new(.25,-5,1,0)},st) rd(t,10)
		X.home[s[1]]=new("TextLabel",{Size=UDim2.new(1,0,0,28),Position=UDim2.fromOffset(0,10),Text="-",Font=T.HF,TextSize=16,TextColor3=T.AC},t)
		new("TextLabel",{Size=UDim2.new(1,0,0,14),Position=UDim2.fromOffset(0,40),Text=s[2],Font=T.HF,TextSize=8,TextColor3=T.DIM},t)
	end
	sec(pg,"Quick Actions")
	btn(pg,"Open Configs","Save and load your favourite setups",function() show("Configs") end)
	btn(pg,"Open eko hub","Switch game or try on avatar items",function() G.Eko() task.spawn(function() G.EkoBoot(true) end) end)
	btn(pg,"Rejoin Server","Reconnects you to this same server",function() pcall(function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,LP) end) end)
	btn(pg,"Server Hop","Joins a different server",function() pcall(function() game:GetService("TeleportService"):Teleport(game.PlaceId,LP) end) end)
	btn(pg,"Reset Character","Kills your character so you respawn",function() local h=hum() if h then h.Health=0 end end)
end
X.buildHome(PG.Home)
-- ===== CONFIGS =====
X.cfgf="Eko_"..choice.."_cfgs.json"
X.cfg={list={},startup=nil}
do local o,d=pcall(function() return HS:JSONDecode(readfile(X.cfgf)) end) if o and type(d)=="table" and type(d.list)=="table" then X.cfg=d end end
local function cfgWrite() pcall(function() writefile(X.cfgf,HS:JSONEncode(X.cfg)) end) end
local function snap(auto)
	local d={f={},SE={},SR={},BK={},KW={},SA={},WP=X.wp}
	for k,v in pairs(F) do
		if (type(v)=="boolean" or type(v)=="number") and not NOCFG[k] then
			if auto then if not NS[k] then d.f[k]=v end elseif not STYLEK[k] then d.f[k]=v end
		end
	end
	for _,k in ipairs({"SE","SR","BK","KW","SA"}) do for n in pairs(E[k]) do d[k][#d[k]+1]=n end end
	if E.base then d.base={E.base.X,E.base.Y,E.base.Z} end
	return d
end
local function applyCfg(d)
	for _,k in ipairs({"SE","SR","BK","SA"}) do for n in pairs(E[k]) do E[k][n]=nil end end
	for _,n in ipairs(d.SE or {}) do E.addE(n) E.SE[n]=true end for _,n in ipairs(d.SR or {}) do E.addR(n) E.SR[n]=true end
	for _,n in ipairs(d.BK or {}) do E.addB(n) E.BK[n]=true end for _,n in ipairs(d.KW or {}) do E.KW[n]=true end for _,n in ipairs(d.SA or {}) do E.addA(n) E.SA[n]=true end
	E.rpE() E.rpR() E.rpB() E.rpA()
	if type(d.base)=="table" and #d.base==3 then E.base=Vector3.new(d.base[1],d.base[2],d.base[3]) end
	if type(d.WP)=="table" then X.wp=d.WP if X.wpBuild then X.wpBuild() end end
	for k,v in pairs(d.f or d) do if TG[k] and type(v)=="boolean" then TG[k](v,true) elseif SL[k] and type(v)=="number" then SL[k](v) end end
	if next(E.KW) then E.scan() end
end
local function saveA(q) local o=pcall(function() writefile("Eko_"..choice..".json",HS:JSONEncode(snap(true))) end) if not q then toast(o and "Saved!" or "Save failed") end end
local function loadA(q)
	local o,d=pcall(function() return HS:JSONDecode(readfile("Eko_"..choice..".json")) end)
	if not o or type(d)~="table" then if not q then toast("No config found") end return false end
	applyCfg(d) return true
end
do
	local cp=PG.Configs
	sec(cp,"Your Configs  ("..GN..")")
	local cfgBox
	local function build()
		for _,c in ipairs(cfgBox:GetChildren()) do if c:IsA("GuiObject") then c:Destroy() end end
		if #X.cfg.list==0 then new("TextLabel",{Size=UDim2.new(1,0,0,40),Text="No configs yet. Turn on some features, then tap Create.",TextSize=11,TextColor3=T.DIM,TextWrapped=true},cfgBox) end
		for i,c in ipairs(X.cfg.list) do
			local card=new("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,LayoutOrder=i},cfgBox) rd(card,12)
			new("UIStroke",{Color=WH,Transparency=X.cfg.startup==c.name and .2 or .9,Thickness=1.5,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},card)
			new("UIPadding",{PaddingTop=UDim.new(0,10),PaddingBottom=UDim.new(0,10),PaddingLeft=UDim.new(0,12),PaddingRight=UDim.new(0,12)},card)
			new("UIListLayout",{Padding=UDim.new(0,7),SortOrder=Enum.SortOrder.LayoutOrder},card)
			local on={}
			for k,v in pairs(c.data.f or {}) do if v==true and X.meta[k] then on[#on+1]=X.meta[k] end end
			table.sort(on,function(a,b) return a.t<b.t end)
			local nf=0 for _,k in ipairs({"SE","SR","BK","KW","SA"}) do nf=nf+#(c.data[k] or {}) end
			local h=new("Frame",{Size=UDim2.new(1,0,0,22),BackgroundTransparency=1,LayoutOrder=1},card)
			new("TextLabel",{Size=UDim2.new(1,-90,1,0),Text=(X.cfg.startup==c.name and "★ " or "")..c.name,Font=T.HF,TextSize=13,TextXAlignment=XL,TextTruncate=TE},h)
			new("TextLabel",{Size=UDim2.fromOffset(86,22),Position=UDim2.new(1,-86,0,0),Text=#on.." features on",TextSize=9,TextColor3=T.AC,TextXAlignment=XR},h)
			local names={} for j=1,math.min(3,#on) do names[j]=on[j].t end
			local sm=#on==0 and "Nothing enabled in this config" or (table.concat(names,", ")..(#on>3 and (" +"..(#on-3).." more") or ""))
			if nf>0 then sm=sm.."  •  "..nf.." filters" end
			if c.data.WP and #c.data.WP>0 then sm=sm.."  •  "..#c.data.WP.." waypoints" end
			new("TextLabel",{Size=UDim2.new(1,0,0,14),Text=sm,TextSize=10,TextColor3=T.DIM,TextXAlignment=XL,TextTruncate=TE,LayoutOrder=2},card)
			local ig=new("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=3},card)
			new("UIGridLayout",{CellSize=UDim2.fromOffset(30,30),CellPadding=UDim2.fromOffset(5,5),SortOrder=Enum.SortOrder.LayoutOrder},ig)
			for j=1,math.min(#on,17) do
				local ic=new("Frame",{BackgroundColor3=T.RB,LayoutOrder=j},ig) rd(ic,8)
				new("TextLabel",{Size=UDim2.fromScale(1,1),Text=(j==17 and #on>17) and ("+"..(#on-16)) or on[j].i,TextSize=15,Font=Enum.Font.GothamMedium},ic)
			end
			local br=new("Frame",{Size=UDim2.new(1,0,0,28),BackgroundTransparency=1,LayoutOrder=4},card)
			new("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},br)
			local function mb2(txt,col,cb)
				local b=new("TextButton",{Size=UDim2.fromOffset(0,28),AutomaticSize=Enum.AutomaticSize.X,Text=txt,TextSize=11,BackgroundColor3=col or T.RB,TextColor3=col and T.OA or T.TX},br)
				new("UIPadding",{PaddingLeft=UDim.new(0,11),PaddingRight=UDim.new(0,11)},b) rd(b,8) press(b) b.Activated:Connect(cb)
			end
			mb2("Load",T.AC,function() applyCfg(c.data) toast("Loaded: "..c.name) end)
			mb2("Update",nil,function() c.data=snap() cfgWrite() build() toast("Updated: "..c.name) end)
			mb2("Copy",nil,function() pcall(function() setclipboard(HS:JSONEncode({name=c.name,data=c.data})) end) toast("Copied "..c.name) end)
			mb2(X.cfg.startup==c.name and "★ Startup" or "☆ Startup",nil,function() X.cfg.startup=(X.cfg.startup==c.name) and nil or c.name cfgWrite() build() end)
			mb2("Delete",nil,function() table.remove(X.cfg.list,i) if X.cfg.startup==c.name then X.cfg.startup=nil end cfgWrite() build() end)
		end
	end
	tbox(cp,"new config name...","Create",function(n)
		local d=snap()
		for _,c in ipairs(X.cfg.list) do if c.name==n then c.data=d cfgWrite() build() toast("Overwrote: "..n) return end end
		X.cfg.list[#X.cfg.list+1]={name=n,data=d} cfgWrite() build() toast("Created: "..n)
	end)
	cfgBox=new("Frame",{Size=UDim2.new(1,-6,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1},cp)
	cfgBox:SetAttribute("st","configs saved load profiles")
	new("UIListLayout",{Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},cfgBox)
	tbox(cp,"paste exported config text...","Import",function(txt)
		local o,d=pcall(function() return HS:JSONDecode(txt) end)
		if o and type(d)=="table" and type(d.data)=="table" then X.cfg.list[#X.cfg.list+1]={name=d.name or "Imported",data=d.data} cfgWrite() build() toast("Imported: "..(d.name or "config")) else toast("That is not a valid config") end
	end)
	note(cp,"Each card shows icons for every feature turned on inside it. Tap the star to load a config automatically every time you launch this game.",44)
	build()
end
-- ===== shared UI blocks =====
local function aimUI(pg)
	sec(pg,"Aimbot")
	tog(pg,"Aimbot","aim","Snaps your camera onto the best player in the FOV",function() lock=nil end,function(s)
		tog(s,"Hold Right Mouse To Aim","aimhold","Only aims while you hold the right mouse button")
		tog(s,"Sticky Lock","sticky","Keeps tracking the same player until they die")
		tog(s,"Team Check","team","Ignores your teammates")
		tog(s,"Wall Check","wall","Only locks players you can actually see")
		if choice=="riv" then tog(s,"Face Target (Shiftlock)","face","Turns your character toward the locked player") end
		sld(s,"Prediction","pred",0,1,"Leads moving targets (higher = further ahead)")
		sld(s,"Aim FOV","afov",50,600,"Size of the area the aimbot searches")
		sld(s,"Smoothing","smooth",0,1,"Higher = slower, more natural looking aim")
		btn(s,"Target Part: Head","Tap to cycle Head / Chest / Legs / Root",function(b,l) X.ti=X.ti%4+1 X.tpn=X.tn[X.ti] l.Text="Target Part: "..X.tpn end)
		btn(s,"Priority: Closest To Crosshair","Tap to cycle crosshair / distance / lowest health",function(b,l) X.prio=X.prio%3+1 l.Text="Priority: "..({"Closest To Crosshair","Closest Distance","Lowest Health"})[X.prio] end)
		btn(s,"Release Lock","Drops your current target",function() lock=nil end)
	end)
	tog(pg,"Crosshair + FOV Circle","cross","Draws a crosshair and the aim area",function(x) for _,f in ipairs(cx) do f.Visible=x end end)
	sec(pg,"Triggerbot")
	tog(pg,"Triggerbot","trig","Auto shoots when your crosshair is on a player",nil,function(s) sld(s,"Trigger Delay","tdel",0,.5,"Wait before each auto shot (seconds)") end)
	X.lockCard(pg)
end
local function combatUI(pg,melee)
	if melee then
		sec(pg,"Melee")
		tog(pg,"Melee Aura","mel","Swings your equipped weapon automatically at enemies in range",nil,function(s)
			sld(s,"Aura Range","melr",5,40,"How close an enemy must be to get swung at")
			tog(s,"Face Enemy","melf","Turns you toward the enemy while swinging")
		end)
	end
	sec(pg,"Hitboxes")
	tog(pg,"Hitbox Expander","hbx","Makes enemy hitboxes bigger so shots land easier",nil,function(s) sld(s,"Hitbox Size","hbs",2,25,"How big the enemy hitboxes become") end)
	sec(pg,"Movement")
	tog(pg,"Bunny Hop","bhop","Hold Space to keep jumping the moment you land")
end
local function espUI(pg)
	sec(pg,"Player ESP")
	tog(pg,"Player ESP","esp","Master switch for everything below",nil,function(s)
		tog(s,"Name / Distance / HP","pesp","Shows name, distance and health over players")
		tog(s,"Box","pbox","Draws a box around each player")
		tog(s,"Health Bar","phb","Green to red bar next to the box")
		tog(s,"Tracers","ptr","Lines from the screen bottom to players")
		tog(s,"Chams","chams","Glowing outline you can see through walls")
		tog(s,"Show Teammates","pteam","Turn off to only see enemies")
		sld(s,"Max Distance","edist",100,3000,"ESP hides players farther than this")
	end)
end
-- ===== EGG GAMES =====
if isE then do
	local eP,bP,xP=PG.Egg,PG.Blacklist,PG.ESP
	local RN={C="Common",U="Uncommon",R="Rare",E="Epic",L="Legendary",M="Mythic",K="Cosmic",S="Secret",T="Eternal",D="Divine"}
	local SAD={
		Forest="Chicken:C,Dog:C,Bird:U,Burrowing Owl:R,Raccoon:R,Fox:E,Bear:E,Brr Brr Patapim:L",
		Lake="Frog:C,Duckling:C,Catfish:U,Turtle:R,Trulimero Trulicina:E,Swan:E,Axolotl:L,Leviathan:K",
		Desert="Jerboa:C,Fennec:U,Camel:R,Tob Tobi Tob Tob:E,Snake:L,Sand Spider:M,Scorpion:M,Royal Sphinx:K",
		Jungle="Chimpanzee:R,Toucan:R,Crocodile:E,Gorilla:L,Orangutini Ananassini:L,Spider:M,Tiger:M,King Snake:S",
		Snow="Penguin:R,Walrus:E,Polar Bear:L,Sabertooth Tiger:M,Mammoth:M,King Mammoth:K,Yeti:S,Ice Dragon:T",
		Volcano="Lava Gecko:R,Lava Frog:E,Flaming Bull:L,Lava Iguana:L,Chillin Chilli:M,Cerberus:S,Phoenix:T,Lava Dragon:T",
		["Abyss Ocean"]="Parrotfish:R,Swordfish:E,Shark:L,Orca:M,Whale Shark:K,Beluga Whale:K,Kraken:S,El Maja:T",
		Prehistoric="Dodo:R,Pterodactyl:L,Ankylosaurus:M,Triceratops:K,Bronto:K,T-Rex:S,Tralaledon:S,Mosasaurus:T",
		Cosmic="Centipede:E,Cosmic Gecko:L,Cosmic Gorilla:M,La Vacca Saturno Saturnita:K,Cosmic Skeleton Boss:S,Cosmic Dragon:S,Eternal Lunar Dragon:T,Unicorn:D",
		["Cherry Blossom"]="Crane:E,Salamander:L,Red Panda:M,Snowy Owl:K,Koi:K,Stag:S,Oni Tiger:T,Kitsune:D",
		["Titan Temple"]="Spideron:L,Crustacia:L,Bladehide:K,Mantaris:K,Rhinotaur:K,Mutant Shark:S,Gorilla King:T,Nightflame:D",
		["Angels & Demons"]="Light Dove:L,Winged Lamb:M,Sacred Moth:K,Holy Peacock:K,Pure Jellyfish:S,Centaur:S,Pegasus:T,ArchAngel:D,Flame Sprite:L,Toro:M,Imp:K,Demon Hound:K,Gargoyle:S,RazorFang:S,Skeleton Horse:T,World Burner:D"}
	local AREAS={"Forest","Lake","Desert","Jungle","Snow","Volcano","Abyss Ocean","Prehistoric","Cosmic","Cherry Blossom","Titan Temple","Angels & Demons"}
	local DB={}
	local function norm(s) return (s:lower():gsub("[^%w]","")) end
	if runMode then for b,s in pairs(SAD) do for nm,rc in s:gmatch("([^,:]+):(%a)") do DB[norm(nm.."egg")]={b,RN[rc]} end end end
	local RL=runMode and {"Common","Uncommon","Rare","Epic","Legendary","Mythic","Cosmic","Secret","Eternal","Divine","Unknown"} or {"Common","Uncommon","Rare","Epic","Legendary","Mythical","Secret","Event","Unknown"}
	local RS2={"Secret","Mythical","Legendary","Epic","Rare","Uncommon","Common"}
	sec(eP,runMode and "Autofarm" or "Auto Farm")
	tog(eP,runMode and "Autofarm Eggs" or "Auto Fly To Eggs","auto",runMode and "Runs to the nearest egg, grabs it, runs home" or "Flies to the nearest egg with built-in noclip",function(v)
		E.tgt=nil E.mode="go" E.atE=false
		if v and not E.base then local r=root() if r then E.base=r.Position end end
		if not v and runMode then local h=hum() if h then h.WalkSpeed=16 end end
	end,function(s)
		if runMode then
			sld(s,"Run Speed (to egg)","runS",16,200,"Walk speed while heading to an egg")
			sld(s,"Run Speed (back to base)","runB",16,200,"Walk speed while returning home")
		else
			sld(s,"Fly Speed (to egg)","spd",20,500,"How fast you fly toward eggs")
			sld(s,"Return Speed (to base)","rspd",100,1500,"How fast you fly back home")
			sld(s,"Cruise Height","cruise",0,150,"Height you fly at while traveling")
			tog(s,"Teleport Back (instant)","tpb","Teleports home instead of flying")
		end
		sld(s,"Stay At Egg (sec)","stay",.3,3,"How long to wait at the egg to grab it",nil,.1)
		sld(s,"Ignore Eggs Near Base","bsafe",0,300,"Skips eggs this many studs from your base")
		tog(s,"Return To Base After Each Egg","back","Goes home after grabbing an egg")
	end)
	btn(eP,"Set Base Here","Saves your current spot as home",function() local r=root() if r then E.base=r.Position toast("Base saved") end end)
	sec(eP,"Filters  (none selected = all)")
	E.addR,E.rpR=chips(eP,"RARITIES",E.SR,RL)
	if runMode then E.addA,E.rpA=chips(eP,"AREAS (biomes)",E.SA,AREAS) end
	E.addE,E.rpE=chips(eP,"EGGS",E.SE,runMode and {} or {"Halloween","Black Hole","Cherub","Rainbow","Gold","Void","Volcanic","Solarius"})
	sec(eP,"Tools")
	E.stl=note(eP,"Eggs found: 0",34)
	btn(eP,"Teleport To Nearest Egg","Instantly moves you next to the closest egg",function() local o,r=E.pick(),root() if o and r then r.CFrame=CFrame.new(E.ppos(o)+Vector3.new(0,3,0)) end end)
	btn(eP,"Skip Current Egg","Ignores your current target for 5 minutes",function() if E.tgt then E.BL[E.tgt]=tick()+300 E.tgt=nil end end)
	btn(eP,"Rescan Eggs","Clears skips and searches the map again",function() E.BL={} E.scan() end)
	btn(eP,"Print Eggs To Console","Lists every egg found in the F9 console",function() for o in pairs(E.EG) do local r,a=E.rar(o) print("[Eko]",o:GetFullName(),r,a or "") end end)
	tbox(eP,"extra egg keyword...","Add Keyword",function(n) E.KW[n]=true E.scan() toast("Keyword added: "..n) end)
	sec(eP,"Alerts")
	tog(eP,"Egg Alerts","alert","Pop-up when a new egg that matches appears",nil,function(s) tog(s,"Alert Sound","snd","Plays a ping with each alert") end)
	sec(bP,"Never go to these  (tap to toggle)")
	E.addB,E.rpB=chips(bP,"EGG NAMES",E.BK,runMode and {} or {"Gold","Rainbow","Void","Black Hole","Cherub","Halloween","Volcanic","Solarius"},true)
	tbox(bP,"egg name...","Blacklist",function(n) E.addB(n) E.BK[n]=true E.rpB() E.tgt=nil toast("Blacklisted: "..n) end)
	btn(bP,"Blacklist Current Target","Never goes to this egg type again",function() if E.tgt then local n=E.tgt.Name E.addB(n) E.BK[n]=true E.rpB() E.BL[E.tgt]=tick()+600 E.tgt=nil toast("Blacklisted: "..n) else toast("No target right now") end end)
	btn(bP,"Clear Blacklist","Removes every blacklisted egg",function() for k in pairs(E.BK) do E.BK[k]=nil end E.rpB() toast("Blacklist cleared") end)
	sec(xP,"Eggs")
	tog(xP,"Egg ESP","eesp","Shows name, rarity, area and distance on eggs",nil,function(s) tog(s,"Egg Tracers","etr","Draws a line to every egg") end)
	local NEG={"spawn","shop","stand","machine","incubator","nest","button","stall","pad","hatch"}
	local RC={}
	local function sad(o)
		local best,bl
		local function try(s) for k,v in pairs(DB) do if #k>(bl or 0) and s:find(k,1,true) then best,bl=v,#k end end end
		try(norm(o.Name))
		if not best then for _,d in ipairs(o:GetDescendants()) do if d:IsA("TextLabel") and #d.Text<=30 then try(norm(d.Text)) end end end
		return best
	end
	function E.ppos(o) if o:IsA("Model") then local ok2,cf=pcall(o.GetPivot,o) return ok2 and cf.Position or nil end return o.Position end
	function E.rar(o)
		local c=RC[o] if c and tick()-c[2]<2 then return c[1],c[3] end
		local info=runMode and sad(o)
		local r=info and info[2]
		if not r then
			r=o:GetAttribute("Rarity") local v=o:FindFirstChild("Rarity")
			if not r and v and v:IsA("ValueBase") then r=v.Value end
			if not r then
				local txt=o.Name:lower()
				for _,d in ipairs(o:GetDescendants()) do if d:IsA("TextLabel") and #d.Text<=22 then txt=txt.." "..d.Text:lower() end end
				for _,k in ipairs(RS2) do if txt:find(k:lower()) then r=k break end end
				if not r and not runMode then for _,k in ipairs({"halloween","cherub","rainbow","gold","void","black hole"}) do if txt:find(k) then r="Event" break end end end
			end
		end
		r=tostring(r or "Unknown") RC[o]={r,tick(),info and info[1]} return r,info and info[1]
	end
	local function isEgg(o)
		local n=o.Name:lower() local hit=n:find("egg")
		for k in pairs(E.KW) do if n:find(k:lower(),1,true) then hit=true end end
		if not hit then return false end
		for _,k in ipairs(NEG) do if n:find(k) then return false end end
		if o:IsA("Model") then return true end
		if o:IsA("BasePart") then local m=o.Parent return not (m and m:IsA("Model") and m.Name:lower():find("egg")) end
		return false
	end
	function E.match(o)
		local n=o.Name:lower()
		for k in pairs(E.BK) do if n:find(k:lower(),1,true) then return false end end
		if next(E.SE) then local okk=false for k in pairs(E.SE) do if n:find(k:lower(),1,true) then okk=true break end end if not okk then return false end end
		if next(E.SR) and not E.SR[E.rar(o)] then return false end
		if next(E.SA) then local _,a=E.rar(o) if not (a and E.SA[a]) then return false end end
		return true
	end
	local scanned=false
	function E.reg(o)
		if E.EG[o] then return end
		local o2,res=pcall(isEgg,o)
		if o2 and res then
			E.EG[o]=true E.addE(o.Name) E.addB(o.Name) E.addR((E.rar(o)))
			if scanned and F.alert and E.match(o) then
				toast("New egg: "..o.Name)
				if F.snd then local s=Instance.new("Sound") s.SoundId="rbxasset://sounds/electronicpingshort.wav" s.Volume=1 s.Parent=gui s:Play() task.delay(2,function() s:Destroy() end) end
			end
		end
	end
	function E.scan() scanned=false task.spawn(function() for i,o in ipairs(workspace:GetDescendants()) do E.reg(o) if i%500==0 then task.wait() end end scanned=true end) end
	function E.pick()
		local r=root() if not r then return end
		local best,bs
		for o in pairs(E.EG) do
			local pp=o.Parent and E.ppos(o)
			if pp and not (LP.Character and o:IsDescendantOf(LP.Character)) and not (E.BL[o] and E.BL[o]>tick()) and not (E.base and F.bsafe>0 and (pp-E.base).Magnitude<F.bsafe) and E.match(o) then local d=(pp-r.Position).Magnitude if not bs or d<bs then best,bs=o,d end end
		end
		return best
	end
	function E.grab(o) X.touch(o) end
	cn(workspace.DescendantAdded:Connect(E.reg))
	cn(workspace.DescendantRemoving:Connect(function(o) E.EG[o]=nil RC[o]=nil end))
	function E.eStep()
		local r0=root()
		for o in pairs(E.EG) do
			local pp=o.Parent and E.ppos(o)
			if pp and (F.eesp or F.etr) then
				local rr,aa=E.rar(o)
				X.dot(o,pp,F.eesp and (o.Name.."\n["..rr..(aa and (" | "..aa) or "").."] "..math.floor(r0 and (pp-r0.Position).Magnitude or 0).."m") or nil,F.etr)
			else X.hdot(o) end
		end
	end
	step(.4,"Scanning eggs") E.scan()
end end
-- ===== MUSCLE LEGENDS =====
if PROF=="ml" then do
	local fP,cP,kP=PG.Farm,PG.Crystals,PG.Combat
	local TOOLS={"Weight","Pushups","Situps","Handstands","Punch"}
	local mti=1
	local function equip(n)
		local c,h=LP.Character,hum() if not (c and h) then return end
		local t=c:FindFirstChild(n)
		if not t then local bp=LP:FindFirstChildOfClass("Backpack") t=bp and bp:FindFirstChild(n) end
		if t and t:IsA("Tool") and t.Parent~=c then h:EquipTool(t) end
		return t
	end
	local frc={}
	local function isFriend(p)
		local v=frc[p]
		if v==nil then frc[p]=false task.spawn(function() local ok2,r=pcall(function() return LP:IsFriendsWith(p.UserId) end) frc[p]=ok2 and r or false end) return false end
		return v
	end
	local function killStep()
		local c,r,h=LP.Character,root(),hum() if not (c and r and h) then return end
		if not F.mlfarm then equip("Punch") end
		local tool=c:FindFirstChild("Punch")
		local hands={c:FindFirstChild("RightHand"),c:FindFirstChild("LeftHand"),c:FindFirstChild("Right Arm"),c:FindFirstChild("Left Arm")}
		local near,nd,hit
		for _,p in ipairs(P:GetPlayers()) do
			if p~=LP and alive(p) and not (F.mlfr and isFriend(p)) then
				local tc=p.Character local tr=tc.HumanoidRootPart
				local d=(tr.Position-r.Position).Magnitude
				if not nd or d<nd then near,nd=tr,d end
				if F.mlkall or d<=F.mlkr then
					hit=true
					if firetouchinterest then for _,hd in ipairs(hands) do if hd then for _,part in ipairs({tr,tc:FindFirstChild("Head")}) do pcall(function() firetouchinterest(hd,part,0) firetouchinterest(hd,part,1) end) end end end end
				end
			end
		end
		if F.mlktp and near and nd>F.mlkr*.6 then r.CFrame=near.CFrame*CFrame.new(0,0,2.5) end
		if hit or F.mlktp then
			if tool then pcall(function() tool:Activate() end) end
			X.fire({"muscleEvent"},"punch","rightHand") X.fire({"muscleEvent"},"punch","leftHand")
		end
	end
	sec(fP,"Training")
	tog(fP,"Auto Farm","mlfarm","Trains your selected tool automatically (gets you stronger)",nil,function(s)
		btn(s,"Tool: Weight","Tap to switch which tool you train",function(b,l) mti=mti%#TOOLS+1 l.Text="Tool: "..TOOLS[mti] end)
		sld(s,"Reps Per Second","mlrate",1,60,"How fast it trains. Too high can get you kicked")
	end)
	tog(fP,"Auto Rebirth","mlreb","Rebirths every few seconds when you have enough strength")
	local fst=note(fP,"Remotes: checking...",34)
	local crUpd=X.crystalUI(cP,{"Blue Crystal","Green Crystal","Frost Crystal","Mythical Crystal","Inferno Crystal","Legends Crystal","Muscle Elite Crystal","Galaxy Oracle Crystal","Jungle Crystal","Eclipse Crystal","Infinity Crystal"})
	sec(kP,"Kill Aura")
	tog(kP,"Kill Aura","mlka","Punches players near you (kills them)",nil,function(s)
		sld(s,"Kill Aura Range","mlkr",5,100,"How close a player must be to get punched")
		tog(s,"Kill Everyone (any range)","mlkall","Hits every player in the server, even far away")
		tog(s,"Teleport To Targets","mlktp","Moves you next to the nearest player so punches land")
		tog(s,"Ignore Friends","mlfr","Skips players on your friends list")
	end)
	note(kP,"Kill aura equips Punch automatically unless Auto Farm is using another tool.",34)
	local rb,ka,ma,sc2=0,0,0,0
	addG(function(dt)
		if F.mlfarm then equip(TOOLS[mti]) ma=math.min(ma+dt*F.mlrate,8) local n=math.floor(ma) if n>0 then ma=ma-n for _=1,n do X.fire({"muscleEvent"},"rep") end end end
		if F.mlreb then rb=rb+dt if rb>5 then rb=0 X.fire({"rebirthRemote","rebirthEvent"},"rebirthRequest") end end
		if F.mlka then ka=ka+dt if ka>.1 then ka=0 pcall(killStep) end end
		sc2=sc2+dt
		if sc2>.5 then sc2=0 fst.Text="muscleEvent: "..(X.rem({"muscleEvent"}) and "found" or "NOT found").." | rebirth: "..(X.rem({"rebirthRemote","rebirthEvent"}) and "found" or "NOT found") crUpd() end
	end)
end end
-- ===== LEGENDS OF SPEED =====
if PROF=="los" then do
	local f,tpg=PG.Farm,PG.Teleport
	local HOOPS=X.watch(function(o) return o:IsA("BasePart") and o:FindFirstAncestor("Hoops")~=nil and not X.inChar(o) end)
	local ORBS={"Red Orb","Blue Orb","Orange Orb","Yellow Orb","Gem"}
	local CITIES={"City","Snow City","Magma City","Legends Highway"}
	local LOS,city={}, "City"
	sec(f,"Orb Farm")
	tog(f,"Auto Farm Orbs","lorb","Collects orbs straight from the server for steps / gems (no running)",nil,function(s)
		sld(s,"Orbs Per Second","lrate",1,60,"Total orbs collected each second. Lower is safer")
		tog(s,"Collect In All Cities","lall","Rotates through every city so every orb type pays out")
	end)
	local addO,rpO=chips(f,"ORB TYPES  (Gem = gems, colored = steps)  none = all",LOS,ORBS)
	tbox(f,"custom orb name...","Add Orb",function(n) addO(n) LOS[n]=true rpO() toast("Orb added: "..n) end)
	X.opts(f,"CITY  (used when 'all cities' is off)",CITIES,function() return city end,function(n) city=n end)
	tbox(f,"custom city name...","Use City",function(n) city=n toast("City: "..n) end)
	sec(f,"Hoops & Races")
	tog(f,"Auto Hoops","lhoop","Touches every hoop on the map for bonus steps")
	tog(f,"Auto Join Race","lrace","Sends a join-race request every few seconds",nil,function(s) btn(s,"Join Race Now","Sends the join-race request once",function() if not X.fire({"raceEvent"},"joinRace") then toast("Race remote not found") end end) end)
	sec(f,"Rebirth")
	tog(f,"Auto Rebirth","sreb","Rebirths automatically every 5 seconds")
	btn(f,"Rebirth Now","Sends one rebirth request",function() if not X.fire({"rebirthEvent"},"rebirthRequest") then toast("Rebirth remote not found") end end)
	local stn=note(f,"",34)
	local crUpd=X.crystalUI(PG.Crystals,{"Red Crystal","Blue Crystal","Purple Crystal","Yellow Crystal","Lightning Crystal","Snow Crystal","Lava Crystal","Inferno Crystal","Electro Legends Crystal","Galaxy Oracle Crystal","Jungle Crystal"})
	sec(tpg,"Hoops")
	btn(tpg,"Teleport To Nearest Hoop","Jumps to the closest hoop",function() local o=X.near(HOOPS) if o then X.tp(X.opos(o)) else toast("No hoops found") end end)
	btn(tpg,"Teleport To Random Hoop","Jumps to a random hoop on the map",function() local l={} for o in pairs(HOOPS) do if o.Parent then l[#l+1]=o end end if #l>0 then X.tp(X.opos(l[math.random(#l)])) else toast("No hoops found") end end)
	note(tpg,"Hoops are found inside the map's Hoops folder, so the count only fills once the map has loaded.",44)
	sec(PG.ESP,"Speed")
	tog(PG.ESP,"Hoop ESP","shoop","Labels the nearest hoops with their distance")
	local oa,oi,hp,rbT,raT,sT=0,0,0,0,0,0
	addG(function(dt)
		local r=root()
		if F.lorb then
			oa=math.min(oa+dt*F.lrate,12)
			local n=math.floor(oa)
			if n>0 then
				oa=oa-n
				local types={} for k in pairs(LOS) do types[#types+1]=k end
				if #types==0 then types=ORBS end
				for _=1,n do oi=oi+1 X.fire({"orbEvent"},"collectOrb",types[oi%#types+1],F.lall and CITIES[oi%#CITIES+1] or city) end
			end
		end
		if F.lhoop and r then hp=hp+dt if hp>.35 then hp=0 local n=0 for o in pairs(HOOPS) do if o.Parent and n<12 then n=n+1 if firetouchinterest then pcall(function() firetouchinterest(r,o,0) firetouchinterest(r,o,1) end) end end end end end
		if F.sreb then rbT=rbT+dt if rbT>5 then rbT=0 X.fire({"rebirthEvent"},"rebirthRequest") end end
		if F.lrace then raT=raT+dt if raT>6 then raT=0 X.fire({"raceEvent"},"joinRace") end end
		X.pass(HOOPS,F.shoop,rgb(255,210,90),"Hoop")
		sT=sT+dt
		if sT>.6 then sT=0 stn.Text="orbEvent: "..(X.rem({"orbEvent"}) and "found" or "NOT found").." | rebirthEvent: "..(X.rem({"rebirthEvent"}) and "found" or "NOT found").." | raceEvent: "..(X.rem({"raceEvent"}) and "found" or "NOT found").."\nHoops on map: "..cnt(HOOPS) crUpd() end
	end)
end end
-- ===== NPC FARM (Lift Legends + RPG games) =====
if PROF=="lls" or PROF=="rpg" then do
	local f=PROF=="lls" and PG.Lift or PG.NPC
	local tpg=PG.Teleport
	local NPC=X.npcs() local filt={}
	local KD={"damage","dmg","fire","flame"}
	local KA={"buy","upgrade","purchase","damage","dmg","fire","flame"}
	local BUY=PROF=="lls" and X.buyer({"buy","upgrade","purchase","damage","dmg","fire","flame"}) or nil
	local function doAttack()
		local c,h=LP.Character,hum()
		local tool=c and c:FindFirstChildOfClass("Tool")
		if not tool and h then local bp=LP:FindFirstChildOfClass("Backpack") tool=bp and bp:FindFirstChildOfClass("Tool") if tool then h:EquipTool(tool) end end
		if tool then pcall(function() tool:Activate() end) end
		if F.lclk then X.click() end
	end
	sec(f,"NPC Farm")
	tog(f,"Auto Farm NPCs","lfarm","Finds the nearest NPC, moves next to it and attacks until it dies",nil,function(s)
		sld(s,"Attack Range","lfr",5,100,"How close you must be before attacking (studs)")
		tog(s,"Teleport To NPCs","lftp","Snaps you next to each NPC so every hit lands")
		sld(s,"Attacks Per Second","lfa",1,20,"How fast it swings your tool")
		tog(s,"Also Click Mouse","lclk","Adds a screen-center click to each attack")
		tbox(s,"only NPC names containing...","Add Filter",function(n) filt[#filt+1]=n:lower() toast("Filter added: "..n) end)
		btn(s,"Clear NPC Filter","Goes back to attacking every NPC",function() filt={} toast("NPC filter cleared") end)
	end)
	if BUY then
		sec(f,"Auto Buy")
		tog(f,"Auto Buy Upgrades","lbuy","Presses every buy / upgrade / damage prompt, pad and button it finds",nil,function(s) sld(s,"Buy Interval (sec)","lbi",.2,5,"How often it tries to buy",nil,.1) end)
		tog(f,"Auto Buy Damage","ldmg","Only buys damage upgrades (the fire / damage station)",nil,function(s) tbox(s,"extra damage keyword...","Add Keyword",function(n) KD[#KD+1]=n:lower() KA[#KA+1]=n:lower() BUY.named.add(n) toast("Damage keyword added: "..n) end) end)
		sec(f,"Lifting")
		tog(f,"Auto Lift / Train","llift","Uses your equipped tool again and again")
		btn(f,"Print Buy Targets","Lists matching prompts, parts and buttons in the F9 console",function() toast(BUY.printAll(KA).." buy targets printed (F9)") end)
	else
		sec(f,"Interact")
		tog(f,"Auto Interact","qint","Presses nearby prompts (quests, loot, doors)",nil,function(s) sld(s,"Interact Range","qr",4,40,"How close a prompt must be") end)
	end
	btn(f,"Print NPC Names","Lists every NPC found in the F9 console",function()
		local seen,n={}, 0
		for h in pairs(NPC) do local nm=h.Parent and h.Parent.Name if nm and not seen[nm] then seen[nm]=true print("[Eko] npc:",nm) n=n+1 end end
		toast(n.." NPC names printed (F9)")
	end)
	local stn=note(f,"",46)
	sec(tpg,"NPCs")
	btn(tpg,"Teleport To Nearest NPC","Jumps next to the closest living NPC",function() local h=X.nearNpc(NPC,filt) local rt=h and X.nroot(h) if rt then X.tp(rt.Position) else toast("No NPC found") end end)
	if BUY then sec(tpg,"Buying") btn(tpg,"Teleport To Nearest Buy Pad","Jumps to the closest buy / upgrade / damage object",function() local o=X.near(BUY.named.set) if o then X.tp(X.opos(o)) else toast("No buy pad found") end end) end
	sec(PG.ESP,"NPCs")
	tog(PG.ESP,"NPC ESP","nesp","Labels the nearest NPCs with their distance")
	local aa,bt,lt,cl,s3,qt=0,0,0,0,0,0
	addG(function(dt)
		cl=cl+dt if cl>1 then cl=0 X.npcClean(NPC) end
		if F.lfarm then
			local r,h=root(),hum()
			if r and h then
				local npc,d=X.nearNpc(NPC,filt)
				local rt=npc and X.nroot(npc)
				if rt then
					local pos=rt.Position
					if F.lftp then local spot=(rt.CFrame*CFrame.new(0,0,3.5)).Position r.CFrame=CFrame.lookAt(spot,Vector3.new(pos.X,spot.Y,pos.Z)) r.AssemblyLinearVelocity=Vector3.zero
					elseif d>F.lfr then h:MoveTo(pos) end
					if F.lftp or d<=F.lfr then aa=math.min(aa+dt*F.lfa,3) while aa>=1 do aa=aa-1 doAttack() end end
				end
			end
		end
		if BUY then
			if F.lbuy or F.ldmg then bt=bt+dt if bt>=F.lbi then bt=0 if F.lbuy then pcall(BUY.run,KA) end if F.ldmg then pcall(BUY.run,KD) end end end
			if F.llift then lt=lt+dt if lt>.12 then lt=0 doAttack() end end
		elseif F.qint then
			qt=qt+dt
			if qt>.35 then qt=0 local r=root() if r then for pr in pairs(X.getPRS()) do local p=pr.Parent and X.opos(pr) if p and pr.Enabled and (p-r.Position).Magnitude<=F.qr and not pr.ActionText:lower():find("hide") then pcall(fireproximityprompt,pr) end end end end
		end
		X.pass(NPC,F.nesp,rgb(255,120,120),"NPC",30)
		s3=s3+dt
		if s3>.6 then
			s3=0
			local nn=0 for h in pairs(NPC) do if h.Parent and h.Health>0 then nn=nn+1 end end
			if BUY then local pa,pb=BUY.counts(KA) stn.Text=string.format("Living NPCs: %d | buy prompts: %d | buy parts: %d\nGUI button clicking: %s",nn,pa,pb,getconnections and "supported" or "NOT supported by your executor")
			else stn.Text="Living NPCs found: "..nn end
		end
	end)
end end
-- ===== SIMULATOR TOOLKIT =====
if PROF=="sim" then do
	local SCT={nl={swing=1,sell=1,shop=1,chest=1,boss=1,reb=1},nl2={swing=1,sell=1,shop=1,chest=1,boss=1,reb=1},ps99={egg=1,chest=1,shop=1,reb=1},psx={egg=1,chest=1,shop=1,reb=1},bgs={egg=1,chest=1,shop=1,sell=1,reb=1},
		bee={swing=1,sell=1,shop=1},sab={swing=1,sell=1,shop=1,chest=1,boss=1,reb=1},anf={swing=1,egg=1,shop=1,boss=1},dragon={egg=1,chest=1,shop=1},fisch={swing=1,sell=1,shop=1},gag={sell=1,shop=1,egg=1},sab2={sell=1,shop=1}}
	local Q=SCT[choice] or {swing=1,sell=1,shop=1,chest=1,egg=1,reb=1}
	local f,tpg,esg=PG.Farm,PG.Teleport,PG.ESP
	local isBee=choice=="bee"
	local function nm(o) return o.Name:lower() end
	local function mdl(o) return o:IsA("Model") or o:IsA("BasePart") end
	local function W(key,pred) return Q[key] and X.watch(pred) or {} end
	local EGGS=W("egg",function(o) return mdl(o) and nm(o):find("egg",1,true)~=nil and nm(o):find("leggin",1,true)==nil and not X.inChar(o) end)
	local CHS=W("chest",function(o) return mdl(o) and nm(o):find("chest",1,true)~=nil and not X.inChar(o) end)
	local SELL=W("sell",function(o) return mdl(o) and nm(o):find("sell",1,true)~=nil and not X.inChar(o) end)
	local SHOP=W("shop",function(o) return mdl(o) and nm(o):find("shop",1,true)~=nil and not X.inChar(o) end)
	local BOSS=W("boss",function(o) return o:IsA("Model") and nm(o):find("boss",1,true)~=nil and not X.inChar(o) end)
	local CSET={coin=1,coins=1,gem=1,gems=1,orb=1,chi=1,crystal=1,token=1,star=1,stars=1,cash=1,gold=1,collectible=1,pickup=1,energy=1,drop=1}
	local COLS=X.watch(function(o) if not o:IsA("BasePart") or X.inChar(o) then return false end return CSET[(nm(o):gsub("[%d%s_]",""))]~=nil end)
	sec(f,"Automation")
	if Q.swing then tog(f,isBee and "Auto Dig" or "Auto Swing","sclk",isBee and "Uses your scooper over and over to collect pollen" or "Swings your weapon over and over to train",nil,function(s) sld(s,isBee and "Digs Per Second" or "Swings Per Second","sck",1,30,"How fast it activates your tool") end) end
	tog(f,"Auto Collect","sacol","Touches coins, gems, chi, tokens and orbs near you",nil,function(s) sld(s,"Collect Range","scr",20,500,"How far away things get collected") end)
	if Q.sell then tog(f,"Auto Sell","ssell","Touches the nearest sell area / prompt every second") end
	if Q.reb then tog(f,"Auto Rebirth","sreb","Fires the rebirth remote every 5 seconds (found by name)") end
	local stn=note(f,"",44)
	sec(f,"Developer")
	btn(f,"Print Useful Remotes","Lists rebirth / egg / sell / collect remotes in the F9 console",function()
		local n=0
		for _,rt in ipairs({game:GetService("ReplicatedStorage"),LP}) do for _,d in ipairs(rt:GetDescendants()) do
			if d:IsA("RemoteEvent") or d:IsA("RemoteFunction") then local s=d.Name:lower() for _,k in ipairs({"rebirth","egg","sell","collect","orb","click","swing","hatch","gem","chest"}) do if s:find(k,1,true) then print("[Eko]",d:GetFullName()) n=n+1 break end end end
		end end
		toast(n.." remotes printed (F9)")
	end)
	local function tpN(s2,label) local o=X.near(s2) if o then X.tp(X.opos(o)) toast("Teleported to "..label) else toast("No "..label.." found") end end
	sec(tpg,"Teleports")
	if Q.egg then btn(tpg,"Teleport To Nearest Egg","Jumps next to the closest egg",function() tpN(EGGS,"egg") end) end
	if Q.chest then btn(tpg,"Teleport To Nearest Chest","Jumps next to the closest chest",function() tpN(CHS,"chest") end) end
	if Q.sell then btn(tpg,"Teleport To Sell Area","Jumps to the closest sell area",function() tpN(SELL,"sell area") end) end
	if Q.shop then btn(tpg,"Teleport To Nearest Shop","Jumps to the closest shop",function() tpN(SHOP,"shop") end) end
	if Q.boss then btn(tpg,"Teleport To Nearest Boss","Jumps next to the closest boss",function() tpN(BOSS,"boss") end) end
	btn(tpg,"Teleport To Nearest Collectible","Jumps to the closest coin / gem / token",function() tpN(COLS,"collectible") end)
	sec(esg,"Finders")
	if Q.egg then tog(esg,"Egg ESP","segg","Labels the nearest eggs with their distance") end
	if Q.chest then tog(esg,"Chest ESP","schest","Labels the nearest chests with their distance") end
	if Q.shop then tog(esg,"Shop ESP","sshop","Labels the nearest shops with their distance") end
	local clk,col,sl,rb,st2,warned=0,0,0,0,0,false
	addG(function(dt)
		local r,h=root(),hum()
		if F.sclk and h then
			clk=math.min(clk+dt*F.sck,3)
			while clk>=1 do
				clk=clk-1
				local c=LP.Character local tool=c and c:FindFirstChildOfClass("Tool")
				if not tool then local bp=LP:FindFirstChildOfClass("Backpack") tool=bp and bp:FindFirstChildOfClass("Tool") if tool then h:EquipTool(tool) end end
				if tool then pcall(function() tool:Activate() end) end
			end
		end
		if F.sacol and r then
			col=col+dt
			if col>.2 then
				col=0 local n=0
				for o in pairs(COLS) do if o.Parent and n<8 and (o.Position-r.Position).Magnitude<=F.scr then n=n+1 if firetouchinterest then pcall(function() firetouchinterest(r,o,0) firetouchinterest(r,o,1) end) end end end
				if not firetouchinterest and not warned then warned=true toast("Your executor has no firetouchinterest") end
			end
		end
		if F.ssell and r then sl=sl+dt if sl>1 then sl=0 local o=X.near(SELL) if o then pcall(X.touch,o) end end end
		if F.sreb then rb=rb+dt if rb>5 then rb=0 local rr=X.remFind("rebirth") if rr then task.spawn(function() X.call(rr,"rebirthRequest") end) end end end
		X.pass(EGGS,F.segg,rgb(255,200,90),"Egg") X.pass(CHS,F.schest,rgb(90,200,255),"Chest") X.pass(SHOP,F.sshop,rgb(190,150,255),"Shop")
		st2=st2+dt
		if st2>.6 then st2=0 stn.Text=string.format("Found: eggs %d | chests %d | sell %d | shops %d | collectibles %d\nRebirth remote: %s",cnt(EGGS),cnt(CHS),cnt(SELL),cnt(SHOP),cnt(COLS),X.remFind("rebirth") and "found" or "not found") end
	end)
end end
-- ===== TYCOON =====
if PROF=="tyc" then do
	local g,tpg,esg=PG.Tycoon,PG.Teleport,PG.ESP
	local KB={"buy","purchase","upgrade","unlock","expand"}
	local KC={"collect","cash","money","claim","income"}
	local BUY=X.buyer(KB) local COL=X.buyer(KC)
	sec(g,"Cash")
	tog(g,"Auto Collect Cash","tcol","Touches / presses every collector, cash pile and claim button nearby",nil,function(s) sld(s,"Collect Range","tcr",20,500,"How far away collectors get used") end)
	sec(g,"Buying")
	tog(g,"Auto Buy","tbuy","Presses buy / upgrade / unlock prompts, pads and buttons",nil,function(s) sld(s,"Buy Interval (sec)","tbi",.2,5,"How often it tries to buy",nil,.1) end)
	btn(g,"Print Buy Targets","Lists matching prompts, parts and buttons in the F9 console",function() toast(BUY.printAll(KB).." buy targets printed (F9)") end)
	local stn=note(g,"",46)
	note(g,"Works through prompts, touch pads and on-screen buttons. Robux / gamepass / VIP items are always skipped.",44)
	sec(tpg,"Teleports")
	btn(tpg,"Teleport To Nearest Buy Pad","Jumps to the closest buy / upgrade object",function() local o=X.near(BUY.named.set) if o then X.tp(X.opos(o)) else toast("No buy pad found") end end)
	btn(tpg,"Teleport To Nearest Collector","Jumps to the closest cash collector",function() local o=X.near(COL.named.set) if o then X.tp(X.opos(o)) else toast("No collector found") end end)
	sec(esg,"Tycoon")
	tog(esg,"Buy Pad ESP","tpes","Labels the nearest buy pads with their distance")
	local ct,bt,s3=0,0,0
	addG(function(dt)
		if F.tcol then ct=ct+dt if ct>.5 then ct=0 pcall(COL.run,KC,F.tcr) end end
		if F.tbuy then bt=bt+dt if bt>=F.tbi then bt=0 pcall(BUY.run,KB) end end
		X.pass(BUY.named.set,F.tpes,rgb(255,210,90),"Buy",30)
		s3=s3+dt
		if s3>.6 then s3=0 local a,b2=BUY.counts(KB) local c1,c2=COL.counts(KC) stn.Text=string.format("Buy prompts: %d | buy parts: %d | collectors: %d\nGUI button clicking: %s",a,b2,c1+c2,getconnections and "supported" or "NOT supported by your executor") end
	end)
end end
-- ===== OBBY =====
if PROF=="obby" then do
	local g=PG.Obby
	local FIN=X.named({"finish","winpart","goal"})
	sec(g,"Course")
	btn(g,"Teleport To Finish","Jumps to the end of the course",function() local o=X.near(FIN.set) if o then X.tp(X.opos(o)) else toast("No finish found yet. Climb a bit and try again") end end)
	tog(g,"Finish ESP","finesp","Labels the finish line so you always know where to go")
	note(g,"Use Fly, Noclip and Speed in the Player tab to climb faster. The finish is found by name, so it may not load until the round starts.",44)
	addG(function() X.pass(FIN.set,F.finesp,rgb(120,255,160),"Finish") end)
end end
-- ===== EVADE =====
if PROF=="evade" then addG(X.monsters(PG.Bots)) end
-- ===== CRIMINALITY LOOT =====
if PROF=="crim" then do
	local g=PG.Loot
	local LT=X.named({"crate","safe","register","atm"})
	sec(g,"Loot")
	tog(g,"Loot ESP","lootesp","Labels crates, safes and registers with their distance")
	btn(g,"Teleport To Nearest Loot","Jumps to the closest loot object",function() local o=X.near(LT.set) if o then X.tp(X.opos(o)) else toast("No loot found") end end)
	tbox(g,"extra loot name...","Add Keyword",function(n) LT.add(n) toast("Loot keyword added: "..n) end)
	btn(g,"Print Loot Names","Lists every loot object found in the F9 console",function() local n=0 for o in pairs(LT.set) do if o.Parent then print("[Eko] loot:",o:GetFullName()) n=n+1 end end toast(n.." loot objects printed (F9)") end)
	addG(function() X.pass(LT.set,F.lootesp,rgb(120,255,160),"Loot") end)
end end
-- ===== DOORS / SURVIVAL GAMES =====
if PROF=="doors" then do
	local g=PG.Doors
	X.promptUI(g)
	sec(g,"Rooms")
	btn(g,"Teleport To Latest Door","Jumps to the door of the newest room",function()
		local rooms=workspace:FindFirstChild("CurrentRooms")
		local best,bn
		if rooms then for _,rm in ipairs(rooms:GetChildren()) do local n=tonumber(rm.Name) if n and (not bn or n>bn) then best,bn=rm,n end end end
		local door=best and best:FindFirstChild("Door",true)
		local p=door and X.opos(door)
		if p then X.tp(p) else toast("No door found") end
	end)
	sec(g,"Entities")
	tog(g,"Entity Alerts","dral","Warns you when Rush, Ambush, Eyes and others spawn")
	cn(workspace.ChildAdded:Connect(function(c) if F.dral then for _,k in ipairs({"Rush","Ambush","Eyes","Halt","Screech","Seek","Figure"}) do if c.Name:find(k) then toast("Entity: "..c.Name) break end end end end))
	addG(X.promptStep)
end end
if PROF=="surv" then do
	local g=PG.Survival
	X.promptUI(g)
	local mon=X.monsters(g)
	addG(function(dt) X.promptStep(dt) mon(dt) end)
end end
-- ===== MURDER MYSTERY 2 =====
if PROF=="mm2" then do
	local rP,g,sP=PG.Roles,PG.Game,PG.Safety
	local CO=X.watch(function(o) if not o:IsA("BasePart") then return false end local n=o.Name:lower() return n:find("coin") and not n:find("container") and true or false end)
	local function role(p)
		local c,b=p.Character,p:FindFirstChildOfClass("Backpack")
		local function has(n) return (c and c:FindFirstChild(n)) or (b and b:FindFirstChild(n)) end
		if has("Knife") then return "Murderer",rgb(255,60,60) elseif has("Gun") then return "Sheriff",rgb(70,140,255) end
		return "Innocent",rgb(70,255,120)
	end
	-- MM2 aimbot targeting (the shared aimbot controls get added to this tab below)
	F.mmaimM=true
	sec(PG.Aimbot,"MM2 Targeting")
	tog(PG.Aimbot,"Aim Only At The Murderer","mmaimM","Sheriff / innocent lock onto the murderer only. As murderer you can lock onto anyone")
	X.aimFilter=function(p)
		if not F.mmaimM then return true end
		local mine=role(LP)
		if mine=="Murderer" then return true end
		local nm=role(p)
		return nm=="Murderer"
	end
	local rc={}
	for _,rn in ipairs({"Murderer","Sheriff"}) do
		local r=row(rP,58,"role card "..rn:lower())
		local im=new("ImageLabel",{Size=UDim2.fromOffset(40,40),Position=UDim2.fromOffset(12,9),BackgroundColor3=T.RB,Image=""},r) rd(im,99)
		local l1=new("TextLabel",{Size=UDim2.new(1,-70,0,20),Position=UDim2.fromOffset(60,9),Text=rn..": nobody yet",Font=T.HF,TextSize=12,TextXAlignment=XL,TextTruncate=TE},r)
		local l2=new("TextLabel",{Size=UDim2.new(1,-70,0,14),Position=UDim2.fromOffset(60,31),Text="Roles show once the round starts",TextSize=10,TextColor3=T.DIM,TextXAlignment=XL},r)
		rc[rn]={im=im,l1=l1,l2=l2}
	end
	sec(rP,"Role ESP")
	tog(rP,"Role ESP","mmesp","Red = murderer, blue = sheriff, green = innocent",nil,function(s) tog(s,"Murderer / Sheriff Tracers","mmtr","Lines to the murderer and sheriff") end)
	tog(rP,"Murderer Nearby Warning","mmwarn","Pop-up when the murderer gets close to you",nil,function(s) sld(s,"Warning Distance","mmwr",10,150,"How close the murderer must be to warn you") end)
	sec(g,"Coins")
	tog(g,"Auto Collect Coins","mmcoin","Grabs coins near you automatically",nil,function(s) sld(s,"Collect Range","mmr",20,600,"How far away coins get collected") end)
	btn(g,"Teleport To Nearest Coin","Jumps to the closest coin",function() local c=X.near(CO) if c then X.tp(X.opos(c)) else toast("No coins found") end end)
	sec(g,"Gun")
	tog(g,"Dropped Gun ESP","mmgesp","Labels the gun after the sheriff dies")
	tog(g,"Auto Grab Gun","mmgun","Teleports to a dropped gun, grabs it, then brings you back")
	btn(g,"Teleport To Dropped Gun","Jumps to the gun after the sheriff dies",function() local d=workspace:FindFirstChild("GunDrop",true) local p=d and X.opos(d) if p then X.tp(p) else toast("No gun drop found") end end)
	note(g,"Roles come from who is holding a Knife or Gun. Coins are found by name, so results depend on the map.",44)
	local sky,back2
	local function toSky()
		local r=root() if not r then return end
		back2=r.Position
		if not sky then sky=Instance.new("Part") sky.Name="ZSky" sky.Anchored=true sky.Size=Vector3.new(60,2,60) sky.Transparency=.5 sky.Parent=workspace end
		sky.Position=back2+Vector3.new(0,F.skyh,0) r.CFrame=CFrame.new(sky.Position+Vector3.new(0,4,0))
	end
	X.cls[#X.cls+1]=function() if sky then sky:Destroy() end end
	sec(sP,"Safe Spot")
	sld(sP,"Platform Height","skyh",100,1000,"How far above the map the safe platform is built")
	btn(sP,"Teleport To Safe Platform","Builds a platform high above the map and puts you on it",function() toSky() end)
	btn(sP,"Return To Ground","Takes you back to where you were",function() local r=root() if r and back2 then r.CFrame=CFrame.new(back2+Vector3.new(0,3,0)) end end)
	tog(sP,"Auto Safe When Murderer Near","mmsafe","Teleports you to the safe platform when the murderer gets close",nil,function(s) sld(s,"Trigger Distance","mmsd",10,120,"How close the murderer must be") end)
	note(sP,"The platform is only visible to you.",20)
	local ra,ca,ga,busy,wl,sf=0,0,0,false,0,0
	addG(function(dt)
		ra=ra+dt
		if ra>.3 then
			ra=0
			local best={}
			local r=root()
			for _,p in ipairs(P:GetPlayers()) do
				if p~=LP then
					local nm,col=role(p)
					local c=p.Character
					if nm~="Innocent" then best[nm]=p end
					if F.mmesp and c then
						local hl=X.RH[p] if not hl then hl=Instance.new("Highlight") hl.FillTransparency=.5 hl.Parent=par X.RH[p]=hl end
						hl.Adornee=c hl.FillColor=col hl.OutlineColor=col
					elseif X.RH[p] then X.RH[p].Adornee=nil end
					local rt=c and c:FindFirstChild("HumanoidRootPart")
					if nm=="Murderer" and rt and r then
						local d=(rt.Position-r.Position).Magnitude
						if F.mmwarn and d<=F.mmwr and tick()-wl>5 then wl=tick() toast("Murderer nearby: "..p.DisplayName.." ("..math.floor(d).."m)") end
						if F.mmsafe and d<=F.mmsd and tick()-sf>6 then sf=tick() toSky() toast("Auto safe: teleported") end
					end
				end
			end
			for rn,cd in pairs(rc) do
				local p=best[rn]
				if p then
					cd.im.Image=AV(p.UserId) cd.l1.Text=rn..": "..p.DisplayName
					local rt=p.Character and p.Character:FindFirstChild("HumanoidRootPart")
					cd.l2.Text="@"..p.Name..((rt and r) and ("  •  "..math.floor((rt.Position-r.Position).Magnitude).."m away") or "")
				else cd.im.Image="" cd.l1.Text=rn..": nobody yet" cd.l2.Text="Roles show once the round starts" end
			end
		end
		if F.mmtr then
			local cm=workspace.CurrentCamera
			for rn,key in pairs({Murderer="mmT1",Sheriff="mmT2"}) do
				local d=X.OV[key]
				local p
				for _,pl in ipairs(P:GetPlayers()) do if pl~=LP then local nm=role(pl) if nm==rn then p=pl break end end end
				local rt=p and p.Character and p.Character:FindFirstChild("HumanoidRootPart")
				if rt then X.dot(key,rt.Position,rn,true,rn=="Murderer" and rgb(255,60,60) or rgb(70,140,255)) else X.hdot(key) end
			end
		else X.hdot("mmT1") X.hdot("mmT2") end
		if F.mmcoin then
			ca=ca+dt
			if ca>.25 then ca=0 local r=root() if r then local n=0 for o in pairs(CO) do if o.Parent and n<6 and (o.Position-r.Position).Magnitude<=F.mmr then n=n+1 if firetouchinterest then pcall(function() firetouchinterest(r,o,0) firetouchinterest(r,o,1) end) else r.CFrame=CFrame.new(o.Position) end end end end end
		end
		local gd=(F.mmgesp or F.mmgun) and workspace:FindFirstChild("GunDrop",true)
		if F.mmgesp and gd then local p=X.opos(gd) if p then X.dot("mmGun",p,"GUN DROPPED",false,rgb(255,230,90)) end else X.hdot("mmGun") end
		if F.mmgun and not busy and gd then
			ga=ga+dt
			if ga>.6 then
				ga=0
				local p=X.opos(gd) local r=root()
				if p and r then busy=true local back=r.CFrame task.spawn(function() r.CFrame=CFrame.new(p+Vector3.new(0,2,0)) task.wait(.35) pcall(X.touch,gd) task.wait(.25) if r.Parent then r.CFrame=back end task.wait(2) busy=false end) end
			end
		end
	end)
end end
-- ===== FLEE THE FACILITY =====
if PROF=="flee" then do
	local g=PG.Facility
	local CP=X.watch(function(o) return o:IsA("Model") and o.Name=="ComputerTable" end)
	local PD=X.watch(function(o) return o:IsA("Model") and o.Name=="FreezePod" end)
	local EXs=X.watch(function(o) return o.Name=="ExitDoor" and (o:IsA("Model") or o:IsA("BasePart")) end)
	sec(g,"Beast")
	tog(g,"Beast ESP","fbeast","Highlights whoever is holding the Hammer in red")
	tog(g,"Beast Nearby Warning","fwarn","Pop-up when the beast gets close to you",nil,function(s) sld(s,"Warning Distance","fwr",10,150,"How close the beast must be to trigger the warning") end)
	sec(g,"Map")
	tog(g,"Computer ESP","fcomp","Shows every computer and how far it is")
	tog(g,"Exit ESP","fexit","Shows the exit doors")
	tog(g,"Freeze Pod ESP","fpod","Shows the freeze pods")
	btn(g,"Teleport To Nearest Computer","Jumps to the closest computer",function() local o=X.near(CP) if o then X.tp(X.opos(o)) else toast("No computers found") end end)
	btn(g,"Teleport To Nearest Exit","Jumps to the closest exit door",function() local o=X.near(EXs) if o then X.tp(X.opos(o)) else toast("No exit found") end end)
	local ba,wl=0,0
	addG(function(dt)
		X.pass(CP,F.fcomp,rgb(90,200,255),"Computer") X.pass(PD,F.fpod,rgb(190,150,255),"Pod") X.pass(EXs,F.fexit,rgb(90,255,130),"Exit")
		ba=ba+dt
		if ba>.4 then
			ba=0 local r=root()
			for _,p in ipairs(P:GetPlayers()) do
				if p~=LP then
					local c=p.Character
					local beast=c and c:FindFirstChild("Hammer")~=nil
					if F.fbeast and c and beast then local hl=X.RH[p] if not hl then hl=Instance.new("Highlight") hl.FillTransparency=.4 hl.Parent=par X.RH[p]=hl end hl.Adornee=c hl.FillColor=rgb(255,50,50) hl.OutlineColor=rgb(255,50,50)
					elseif X.RH[p] then X.RH[p].Adornee=nil end
					if F.fwarn and beast and r and tick()-wl>5 then local rt=c:FindFirstChild("HumanoidRootPart") if rt and (rt.Position-r.Position).Magnitude<=F.fwr then wl=tick() toast("Beast nearby: "..p.DisplayName) end end
				end
			end
		end
	end)
end end
-- ===== FRUIT GAMES =====
if PROF=="fruit" then do
	local g=PG.Fruits
	local FR=X.watch(function(o) return (o:IsA("Tool") or o:IsA("Model")) and o.Name:find("Fruit")~=nil and not X.inChar(o) end)
	local CH=X.watch(function(o) return (o:IsA("Model") or o:IsA("BasePart")) and o.Name:find("Chest")~=nil and not X.inChar(o) end)
	sec(g,"Fruits")
	tog(g,"Fruit ESP","bffesp","Shows spawned fruits and their distance")
	tog(g,"Auto Collect Fruit","bfacf","Teleports to spawned fruit and picks it up")
	tog(g,"Fruit Spawn Notifier","bfnot","Pop-up the moment a fruit spawns")
	btn(g,"Teleport To Nearest Fruit","Jumps to the closest spawned fruit",function() local o=X.near(FR) if o then X.tp(X.opos(o)) else toast("No fruit found") end end)
	sec(g,"Chests")
	tog(g,"Chest ESP","bfcesp","Shows chests and their distance")
	tog(g,"Auto Collect Chests","bfacc","Teleports to the nearest chest and opens it")
	btn(g,"Teleport To Nearest Chest","Jumps to the closest chest",function() local o=X.near(CH) if o then X.tp(X.opos(o)) else toast("No chest found") end end)
	cn(workspace.ChildAdded:Connect(function(c) if F.bfnot and c.Name:find("Fruit") then toast("Fruit spawned: "..c.Name) end end))
	local af,ac=0,0
	addG(function(dt)
		X.pass(FR,F.bffesp,rgb(255,190,60),"Fruit") X.pass(CH,F.bfcesp,rgb(90,200,255),"Chest")
		if F.bfacf then af=af+dt if af>1.5 then af=0 local o=X.near(FR) if o then X.tp(X.opos(o)) pcall(X.touch,o) end end end
		if F.bfacc then ac=ac+dt if ac>2 then ac=0 local o=X.near(CH) if o then X.tp(X.opos(o)) pcall(X.touch,o) end end end
	end)
end end
-- ===== BLADE BALL =====
if PROF=="ball" then do
	local g=PG["Blade Ball"]
	sec(g,"Parry")
	tog(g,"Auto Parry","bbp","Presses F right before a ball aimed at you arrives",nil,function(s) sld(s,"Reaction Time (sec)","bbt",.1,.8,"How early it parries (higher = earlier)",nil,.01) end)
	tog(g,"Spam Parry","bbs","Mashes F constantly")
	sec(g,"Visuals")
	tog(g,"Ball ESP","bbesp","Highlights every ball so you never lose it")
	local bsp=note(g,"Ball speed: -",20)
	local lastP,sp,hl2,rt=0,0,{},0
	local function pressF() pcall(function() VIM:SendKeyEvent(true,Enum.KeyCode.F,false,game) task.delay(.03,function() pcall(function() VIM:SendKeyEvent(false,Enum.KeyCode.F,false,game) end) end) end) end
	X.cls[#X.cls+1]=function() for _,h in pairs(hl2) do pcall(function() h:Destroy() end) end end
	addG(function(dt)
		if F.bbs then sp=sp+dt if sp>.12 then sp=0 pressF() end end
		local r,balls=root(),workspace:FindFirstChild("Balls")
		local top=0
		if balls then
			for _,b in ipairs(balls:GetChildren()) do
				if b:IsA("BasePart") then
					local v=b.AssemblyLinearVelocity top=math.max(top,v.Magnitude)
					if F.bbesp then local h=hl2[b] if not h then h=Instance.new("Highlight") h.FillColor=rgb(255,70,70) h.OutlineColor=WH h.FillTransparency=.5 h.Parent=par hl2[b]=h end h.Adornee=b elseif hl2[b] then hl2[b].Adornee=nil end
					if F.bbp and r then
						local tg=b:GetAttribute("target")
						local d=r.Position-b.Position
						local mine=(tg==LP.Name) or (tg==nil and v.Magnitude>1 and d.Magnitude>0 and v:Dot(d.Unit)>v.Magnitude*.6)
						if mine then local eta=d.Magnitude/math.max(v.Magnitude,1) if eta<=F.bbt and tick()-lastP>.45 then lastP=tick() pressF() end end
					end
				end
			end
		end
		for b,h in pairs(hl2) do if not b.Parent then h:Destroy() hl2[b]=nil end end
		rt=rt+dt if rt>.4 then rt=0 bsp.Text="Ball speed: "..math.floor(top).." studs/s" end
	end)
end end
-- ===== NATURAL DISASTER =====
if PROF=="nds" then do
	local g=PG.Survival
	local sky,back2
	sec(g,"Safe Spot")
	sld(g,"Platform Height","skyh",100,1000,"How far above the map the safe platform is built")
	btn(g,"Teleport To Sky Platform","Builds a safe platform high above the map",function()
		local r=root() if not r then return end
		back2=r.Position
		if not sky then sky=Instance.new("Part") sky.Name="ZSky" sky.Anchored=true sky.Size=Vector3.new(60,2,60) sky.Transparency=.5 sky.Parent=workspace end
		sky.Position=back2+Vector3.new(0,F.skyh,0) r.CFrame=CFrame.new(sky.Position+Vector3.new(0,4,0))
	end)
	btn(g,"Return To Ground","Takes you back to where you were",function() local r=root() if r and back2 then r.CFrame=CFrame.new(back2+Vector3.new(0,3,0)) end end)
	btn(g,"Remove Platform","Deletes the sky platform",function() if sky then sky:Destroy() sky=nil end end)
	X.cls[#X.cls+1]=function() if sky then sky:Destroy() end end
end end
-- ===== VEHICLE GAMES =====
if PROF=="drive" then do
	local g,tpg=PG.Vehicle,PG.Teleport
	sec(g,"Boost")
	tog(g,"Vehicle Boost","vboost","Hold Left Shift to push your vehicle forward fast",nil,function(s) sld(s,"Boost Power","vspd",20,300,"How hard the boost pushes") end)
	tog(g,"Vehicle Fly","vfly","WASD + Space / Ctrl to fly your vehicle",nil,function(s) sld(s,"Fly Speed","vfs",40,400,"How fast the vehicle flies") end)
	tog(g,"Anti-Flip Grip","vgrip","Keeps your vehicle upright")
	btn(g,"Flip Vehicle Upright","Rights your vehicle if it is on its roof",function()
		local h=hum() local s=h and h.SeatPart
		if s then local cf=s.CFrame s.CFrame=CFrame.new(cf.Position+Vector3.new(0,4,0))*CFrame.Angles(0,math.atan2(-cf.LookVector.X,-cf.LookVector.Z),0) s.AssemblyLinearVelocity=Vector3.zero else toast("You are not in a vehicle") end
	end)
	btn(g,"Stop Vehicle","Instantly stops your vehicle",function() local h=hum() local s=h and h.SeatPart if s then s.AssemblyLinearVelocity=Vector3.zero s.AssemblyAngularVelocity=Vector3.zero end end)
	local SP2=X.named({"spawn","shop","dealer","garage"})
	sec(tpg,"Places")
	btn(tpg,"Teleport To Nearest Dealer / Shop","Jumps to the closest shop or dealership",function() local o=X.near(SP2.set) if o then X.tp(X.opos(o)) else toast("Nothing found") end end)
	addG(function(dt)
		local h=hum() local s=h and h.SeatPart if not s then return end
		local cm=workspace.CurrentCamera
		if F.vboost and UIS:IsKeyDown(Enum.KeyCode.LeftShift) then s.AssemblyLinearVelocity=s.AssemblyLinearVelocity+s.CFrame.LookVector*F.vspd*dt*6 end
		if F.vfly then
			local dir=X.flyDir(h,cm)
			s.AssemblyLinearVelocity=dir*F.vfs s.AssemblyAngularVelocity=Vector3.zero
		end
		if F.vgrip then local cf=s.CFrame if cf.UpVector.Y<.45 then s.CFrame=CFrame.new(cf.Position+Vector3.new(0,2,0))*CFrame.Angles(0,math.atan2(-cf.LookVector.X,-cf.LookVector.Z),0) s.AssemblyAngularVelocity=Vector3.zero end end
	end)
end end
-- ===== AIMBOT / COMBAT / ESP / PLAYERS TABS =====
if PG.Aimbot then aimUI(PG.Aimbot) end
if PG.Combat and (PROF=="shoot" or PROF=="crim" or PROF=="brawl" or PROF=="uni") then combatUI(PG.Combat,PROF=="brawl") end
if PG.ESP then espUI(PG.ESP) end
if PG.Players then plist(PG.Players,function(p) local r,t=root(),p.Character and p.Character:FindFirstChild("HumanoidRootPart") if r and t then r.CFrame=t.CFrame*CFrame.new(0,0,3) end end) end
-- ===== PLAYER + MISC =====
local pP,mP=PG.Player,PG.Misc
sec(pP,"Movement")
if runMode then note(pP,"Fly and Noclip are hidden in this game because it has anticheat. Autofarm runs on foot.",34)
else
	tog(pP,"Fly","fly","WASD / joystick to move, Space up, Ctrl down",nil,function(s) if not isE then sld(s,"Fly Speed","spd",20,500,"How fast you fly") end end)
	tog(pP,"Noclip","noclip","Walk through walls and objects")
end
tog(pP,"Walk Speed","walk","Overrides how fast you run",function(v) if not v then local h=hum() if h then h.WalkSpeed=16 end end end,function(s) sld(s,"Speed Value","walkS",16,250,"The walk speed used while this is on") end)
if not runMode then
	tog(pP,"Jump Power","jp","Overrides how high you jump",function(v) if not v then local h=hum() if h then h.JumpPower=50 end end end,function(s) sld(s,"Jump Power Value","jpv",50,350,"The jump power used while this is on") end)
	tog(pP,"Gravity","gravOn","Overrides the world's gravity",function(v) if not v then workspace.Gravity=X.g0 end end,function(s) sld(s,"Gravity Value","grav",0,196,"Lower = floaty, 196 = normal") end)
	tog(pP,"Click Teleport","ctp","Hold Ctrl and click to teleport there")
end
sec(pP,"Extra")
tog(pP,"Infinite Jump","inf","Jump again in mid air as many times as you like")
tog(pP,"Spin Character","spin","Spins your character around constantly",nil,function(s) sld(s,"Spin Speed","spinS",1,60,"How fast you spin") end)
tog(pP,"Freeze Character","frz","Anchors you in place so nothing can push you",function(v) local r=root() if r then r.Anchored=v end end)
tog(pP,"Anti-AFK","afk","Stops the game from kicking you for idling")
tog(pP,"Mobile Shiftlock","shiftlock","Enables shiftlock-style camera for mobile (locks mouse / forces first-person style lock)",function(v)
	pcall(function()
		local ps = game:GetService("Players")
		local mouse = LP:GetMouse()
		if v then
			-- force shiftlock-like behavior
			UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
			pcall(function() LP.CameraMode = Enum.CameraMode.Classic end)
			-- many mobile shiftlock scripts also set this
			local cam = workspace.CurrentCamera
			if cam then cam.CameraType = Enum.CameraType.Custom end
		else
			UIS.MouseBehavior = Enum.MouseBehavior.Default
		end
	end)
end)
btn(pP,"Reset Character","Kills your character so you respawn",function() local h=hum() if h then h.Health=0 end end)

sec(mP,"Skybox")
local SKIES={
	{"Default",nil},
	{"Night",{Bk=158065739,Dn=158065764,Ft=158065778,Lf=158065792,Rt=158065811,Up=158065824}},
	{"Nebula",{Bk=159454299,Dn=159454318,Ft=159454339,Lf=159454361,Rt=159454379,Up=159454400}},
	{"Pink Sky",{Bk=6444884337,Dn=6444884779,Ft=6444884337,Lf=6444884337,Rt=6444884337,Up=6444884779}},
	{"Sunset",{Bk=600830446,Dn=600830591,Ft=600830446,Lf=600830370,Rt=600830370,Up=600830517}},
	{"Space",{Bk=159454299,Dn=159454318,Ft=159454339,Lf=159454361,Rt=159454379,Up=159454400}},
	{"Cyan",{Bk=150939529,Dn=150939620,Ft=150939529,Lf=150939453,Rt=150939453,Up=150939554}},
}
local function applySky(data)
	local sky=Lt:FindFirstChildOfClass("Sky")
	if not data then
		if sky then sky:Destroy() end
		return
	end
	if not sky then sky=Instance.new("Sky") sky.Parent=Lt end
	sky.SkyboxBk="rbxassetid://"..data.Bk
	sky.SkyboxDn="rbxassetid://"..data.Dn
	sky.SkyboxFt="rbxassetid://"..data.Ft
	sky.SkyboxLf="rbxassetid://"..data.Lf
	sky.SkyboxRt="rbxassetid://"..data.Rt
	sky.SkyboxUp="rbxassetid://"..data.Up
end
X.opts(mP,"SKYBOX PRESET",{"Default","Night","Nebula","Pink Sky","Sunset","Space","Cyan"},function() return F.skyname or "Default" end,function(n)
	F.skyname=n
	for _,s in ipairs(SKIES) do if s[1]==n then applySky(s[2]) break end end
	toast("Skybox: "..n)
end)

sec(mP,"Visuals")
tog(mP,"Fullbright","fb","Removes darkness and fog",function(v)
	if v then X.fbo={Lt.Brightness,Lt.ClockTime,Lt.FogEnd,Lt.Ambient} Lt.Brightness=2 Lt.ClockTime=14 Lt.FogEnd=1e5 Lt.Ambient=WH
	elseif X.fbo then Lt.Brightness,Lt.ClockTime,Lt.FogEnd,Lt.Ambient=X.fbo[1],X.fbo[2],X.fbo[3],X.fbo[4] end
end)
tog(mP,"Time Of Day","ctOn","Locks the clock to a time you choose",nil,function(s) sld(s,"Clock Time","ct",0,24,"0 = midnight, 12 = noon",function(v) if F.ctOn then Lt.ClockTime=v end end,.5) end)
tog(mP,"Remove Fog","nofog","Clears distance fog so you can see far",function(v) if v then X.fog0=Lt.FogEnd Lt.FogEnd=1e6 elseif X.fog0 then Lt.FogEnd=X.fog0 end end)
tog(mP,"FOV Changer","fovOn","Overrides your camera field of view",function(v) if not v then workspace.CurrentCamera.FieldOfView=70 end end,function(s) sld(s,"FOV Value","fovV",40,120,"Higher = see more of the screen sides") end)
tog(mP,"Camera Zoom Limit","zoomOn","Lets you zoom the camera out much further",function(v) pcall(function() LP.CameraMaxZoomDistance=v and F.zoomV or 128 end) end,function(s) sld(s,"Zoom Distance","zoomV",20,500,"How far you can zoom out",function(v) if F.zoomOn then pcall(function() LP.CameraMaxZoomDistance=v end) end end) end)
tog(mP,"FPS Booster","fpsb","Lowers shadows and effects for more FPS",function(v)
	if v then X.fpo={sh=Lt.GlobalShadows,fx={}} Lt.GlobalShadows=false for _,o in ipairs(Lt:GetChildren()) do if o:IsA("PostEffect") and o.Enabled then o.Enabled=false X.fpo.fx[#X.fpo.fx+1]=o end end
	elseif X.fpo then Lt.GlobalShadows=X.fpo.sh for _,o in ipairs(X.fpo.fx) do pcall(function() o.Enabled=true end) end X.fpo=nil end
end)
tog(mP,"FPS + Ping Counter","fps","Small draggable box with your FPS and ping",function(v) fl.Visible=v end)
-- in-game font changer
X.gf={orig={},name="Gotham",con=nil}
local function gfApply()
	local pg2=LP:FindFirstChildOfClass("PlayerGui") if not pg2 then return end
	local fnt=Th.fnt(X.gf.name)
	for _,o in ipairs(pg2:GetDescendants()) do
		if (o:IsA("TextLabel") or o:IsA("TextButton") or o:IsA("TextBox")) and not o:IsDescendantOf(gui) then
			if X.gf.orig[o]==nil then X.gf.orig[o]=o.Font end
			o.Font=fnt
		end
	end
end
local function gfRestore() if X.gf.con then X.gf.con:Disconnect() X.gf.con=nil end for o,f in pairs(X.gf.orig) do pcall(function() o.Font=f end) end X.gf.orig={} end
X.cls[#X.cls+1]=gfRestore
tog(mP,"Game Font Changer","gfont","Changes the font of the game's own UI text",function(v)
	if v then
		gfApply()
		local pg2=LP:FindFirstChildOfClass("PlayerGui")
		if pg2 then X.gf.con=pg2.DescendantAdded:Connect(function(o) if F.gfont and (o:IsA("TextLabel") or o:IsA("TextButton") or o:IsA("TextBox")) and not o:IsDescendantOf(gui) then task.defer(function() if X.gf.orig[o]==nil then X.gf.orig[o]=o.Font end o.Font=Th.fnt(X.gf.name) end) end end) end
	else gfRestore() end
end,function(s) X.opts(s,"GAME FONT",{"Gotham","Arcade","Bangers","Code","Creepster","Fantasy","Michroma","Oswald","PermanentMarker","SciFi","Ubuntu","Cartoon","LuckiestGuy","IndieFlower"},function() return X.gf.name end,function(n) X.gf.name=n if F.gfont then gfApply() end end) end)
sec(mP,"Utilities")
tog(mP,"Instant Prompts","instp","Skips the hold timer on proximity prompts")
cn(game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(pr) if F.instp then pcall(fireproximityprompt,pr) end end))
btn(mP,"Copy Place ID","Copies this game's place ID",function() pcall(function() setclipboard(tostring(game.PlaceId)) end) toast("Copied "..game.PlaceId) end)
btn(mP,"Copy Job ID","Copies this server's job ID",function() pcall(function() setclipboard(tostring(game.JobId)) end) toast("Copied server ID") end)
tbox(mP,"paste a job id to join...","Join Server",function(n) pcall(function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,n,LP) end) end)
sec(mP,"Waypoints")
tbox(mP,"waypoint name...","Save Here",function(n) local r=root() if r then X.wp[#X.wp+1]={n=n,x=r.Position.X,y=r.Position.Y,z=r.Position.Z} X.wpBuild() toast("Saved waypoint: "..n) end end)
local wpf=new("Frame",{Size=UDim2.new(1,-6,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1},mP)
wpf:SetAttribute("st","waypoints saved locations teleport")
new("UIListLayout",{Padding=UDim.new(0,4),SortOrder=Enum.SortOrder.LayoutOrder},wpf)
function X.wpBuild()
	for _,c in ipairs(wpf:GetChildren()) do if c:IsA("GuiObject") then c:Destroy() end end
	for i,w in ipairs(X.wp) do
		local f=new("Frame",{Size=UDim2.new(1,0,0,34),LayoutOrder=i},wpf) rd(f,8)
		new("TextLabel",{Size=UDim2.new(1,-110,1,0),Position=UDim2.fromOffset(12,0),Text="📌 "..w.n,TextSize=12,TextXAlignment=XL,TextTruncate=TE},f)
		local tpb=new("TextButton",{Size=UDim2.fromOffset(44,24),Position=UDim2.new(1,-98,.5,-12),Text="TP",TextSize=11,BackgroundColor3=T.RB},f) rd(tpb,6) press(tpb)
		tpb.Activated:Connect(function() X.tp(Vector3.new(w.x,w.y,w.z)) toast("Teleported to "..w.n) end)
		local xb2=new("TextButton",{Size=UDim2.fromOffset(32,24),Position=UDim2.new(1,-46,.5,-12),Text="X",TextSize=11,BackgroundColor3=T.RB},f) rd(xb2,6) press(xb2)
		xb2.Activated:Connect(function() table.remove(X.wp,i) X.wpBuild() end)
	end
end
sec(mP,"Server")
tog(mP,"Auto Rejoin On Kick","arj","Rejoins the game if you get kicked")
btn(mP,"Rejoin Server","Reconnects you to this same server",function() pcall(function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,LP) end) end)
btn(mP,"Server Hop","Joins a different server",function() pcall(function() game:GetService("TeleportService"):Teleport(game.PlaceId,LP) end) end)
X.info=note(mP,"",46)
cn(UIS.InputBegan:Connect(function(i,gpe)
	if gpe or not F.ctp then return end
	if i.UserInputType==Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
		local r,m=root(),LP:GetMouse()
		if r and m.Hit then r.CFrame=CFrame.new(m.Hit.Position+Vector3.new(0,3,0)) end
	end
end))
-- ===== THEME ENGINE =====
function Th.walk() local l={} for _,r in ipairs({main,lbx,ts,fl}) do l[#l+1]=r for _,d in ipairs(r:GetDescendants()) do l[#l+1]=d end end return l end
Th.BGK,Th.TXK={"BG","RW","RB","AC","OF","TR"},{"TX","DIM","OA","AC"}
function Th.rm(o,old)
	if o:GetAttribute("keep") then return end
	if o:IsA("GuiObject") then local v=o.BackgroundColor3 for _,k in ipairs(Th.BGK) do if v==old[k] then o.BackgroundColor3=T[k] break end end end
	if o:IsA("TextLabel") or o:IsA("TextButton") or o:IsA("TextBox") then local v=o.TextColor3 for _,k in ipairs(Th.TXK) do if v==old[k] then o.TextColor3=T[k] break end end
	elseif o:IsA("UIStroke") then if o.Color==old.TX then o.Color=T.TX elseif o.Color==old.AC then o.Color=T.AC end end
end
function Th.save() if Th.sv then return end Th.sv=true task.delay(.5,function() Th.sv=false pcall(writefile,"Eko_Style.json",HS:JSONEncode(ST)) end) end
function Th.apply(name)
	ST.theme=name
	local old={} for k,v in pairs(T) do old[k]=v end
	Th.use(name) Th.rainbow=(name=="Rainbow")
	for _,o in ipairs(Th.walk()) do pcall(Th.rm,o,old) end
	stg.Enabled=not Th.rainbow stg.Color=Th.glow()
	X.navPaint() for _,f in ipairs(REP) do pcall(f) end X.repaint() Th.save()
end
function Th.setpack(n)
	ST.pack=n
	local oH,oB=T.HF,T.BF
	Th.usepack(n)
	for _,o in ipairs(Th.walk()) do
		if (o:IsA("TextLabel") or o:IsA("TextButton") or o:IsA("TextBox")) and not o:GetAttribute("keep") and not o:GetAttribute("fk") then
			local f=o.Font if f==oH then o.Font=T.HF elseif f==oB then o.Font=T.BF end
		end
	end
	for _,s in ipairs(X.secs) do pcall(X.secLayout,s) end
	Th.save()
end
function Th.corner(n)
	ST.corner=n
	for _,o in ipairs(Th.walk()) do if o:IsA("UICorner") then local r=o:GetAttribute("R") if r then o.CornerRadius=UDim.new(0,Th.cr(r)) end end end
	Th.save()
end
Th.rbA=0
function Th.rb(dt)
	if not Th.rainbow then return end
	Th.rbA=Th.rbA+dt if Th.rbA<.045 then return end Th.rbA=0
	T.AC=Color3.fromHSV((os.clock()*.17)%1,.7,1) T.OA=BLK
	X.repaint()
end
-- ===== SETTINGS =====
function X.cards(pg,title,names,cols,height,make,get,setf)
	local r=new("Frame",{Size=UDim2.new(1,-6,0,0),AutomaticSize=Enum.AutomaticSize.Y},pg) rd(r,10) r:SetAttribute("st",title:lower())
	new("UIPadding",{PaddingTop=UDim.new(0,8),PaddingBottom=UDim.new(0,8),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8)},r)
	new("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},r)
	new("TextLabel",{Size=UDim2.new(1,0,0,16),Text=title,TextSize=10,TextColor3=T.DIM,TextXAlignment=XL},r)
	local g=new("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1},r)
	new("UIGridLayout",{CellSize=UDim2.new(1/cols,-6,0,height),CellPadding=UDim2.fromOffset(6,6),SortOrder=Enum.SortOrder.LayoutOrder},g)
	local cs={}
	local function paint() for n,c in pairs(cs) do local on=get()==n tw(c.st,.2,{Thickness=on and 2.5 or 0}) c.ck.Visible=on end end
	for _,n in ipairs(names) do
		local b=new("TextButton",{Text="",AutoButtonColor=false},g) rd(b,10) press(b)
		local st=K(new("UIStroke",{Color=WH,Thickness=0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},b))
		local ck=K(new("TextLabel",{Size=UDim2.fromOffset(16,16),Position=UDim2.new(1,-20,0,4),Text="✓",TextSize=12,TextColor3=WH,Visible=false,ZIndex=3},b))
		cs[n]={b=b,st=st,ck=ck}
		make(b,n,cs[n])
		b.Activated:Connect(function() setf(n) paint() end)
	end
	paint() REP[#REP+1]=paint
	return cs
end
do
	local sP=PG.Settings
	sec(sP,"Menu Style")
	X.cards(sP,"THEME  (tap to preview + apply)",Th.names,3,64,function(b,n)
		local t=TH[n]
		K(b).BackgroundColor3=t.BG
		local dot=K(new("Frame",{Size=UDim2.fromOffset(22,22),Position=UDim2.fromOffset(8,8),BackgroundColor3=t.AC},b)) rd(dot,99)
		if n=="Rainbow" then new("UIGradient",{Color=Th.RBSEQ},dot) end
		K(new("TextLabel",{Size=UDim2.fromOffset(40,22),Position=UDim2.fromOffset(36,8),Text="Aa",Font=Enum.Font.GothamBold,TextSize=14,TextColor3=t.TX,TextXAlignment=XL},b))
		local bar=K(new("Frame",{Size=UDim2.new(1,-16,0,6),Position=UDim2.new(0,8,0,36),BackgroundColor3=t.RB},b)) rd(bar,99)
		local fill=K(new("Frame",{Size=UDim2.new(.6,0,1,0),BackgroundColor3=t.AC},bar)) rd(fill,99)
		K(new("TextLabel",{Size=UDim2.new(1,-8,0,12),Position=UDim2.fromOffset(8,47),Text=n,TextSize=9,TextColor3=t.DIM,TextXAlignment=XL},b))
		if n=="Custom" then X.cdot,X.cfill=dot,fill end
	end,function() return ST.theme end,function(n) Th.apply(n) end)
	do
		local ACC={{255,255,255},{255,70,70},{255,140,40},{255,210,60},{110,230,100},{40,220,170},{60,200,255},{60,120,255},{140,90,255},{220,90,255},{255,90,170},{30,30,36}}
		local r=new("Frame",{Size=UDim2.new(1,-6,0,0),AutomaticSize=Enum.AutomaticSize.Y},sP) rd(r,10) r:SetAttribute("st","accent color override")
		new("UIPadding",{PaddingTop=UDim.new(0,8),PaddingBottom=UDim.new(0,8),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8)},r)
		new("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},r)
		new("TextLabel",{Size=UDim2.new(1,0,0,16),Text="ACCENT COLOR  (overrides the theme's accent)",TextSize=10,TextColor3=T.DIM,TextXAlignment=XL},r)
		local g=new("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1},r)
		new("UIGridLayout",{CellSize=UDim2.fromOffset(38,38),CellPadding=UDim2.fromOffset(7,7),SortOrder=Enum.SortOrder.LayoutOrder},g)
		local bs={}
		local function paint() for _,o in ipairs(bs) do local on if o.def then on=type(ST.acc)~="table" else on=type(ST.acc)=="table" and ST.acc[1]==o.c[1] and ST.acc[2]==o.c[2] and ST.acc[3]==o.c[3] end tw(o.st,.2,{Thickness=on and 3 or 0}) end end
		local d0=K(new("TextButton",{Text="↺",TextSize=16,BackgroundColor3=T.RB,AutoButtonColor=false},g)) rd(d0,10) press(d0)
		bs[1]={st=K(new("UIStroke",{Color=WH,Thickness=0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},d0)),def=true}
		d0.Activated:Connect(function() ST.acc=nil Th.apply(ST.theme) paint() end)
		for _,c in ipairs(ACC) do
			local b=K(new("TextButton",{Text="",BackgroundColor3=rgb(c[1],c[2],c[3]),AutoButtonColor=false},g)) rd(b,10) press(b)
			bs[#bs+1]={st=K(new("UIStroke",{Color=WH,Thickness=0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},b)),c=c}
			b.Activated:Connect(function() ST.acc={c[1],c[2],c[3]} Th.apply(ST.theme) paint() end)
		end
		paint() REP[#REP+1]=paint
	end
	sld(sP,"Custom Theme Hue","hue",0,1,"Only used by the Custom theme",function(v) ST.hue=v Th.custom() if X.cdot then X.cdot.BackgroundColor3=TH.Custom.AC X.cfill.BackgroundColor3=TH.Custom.AC end if X.built and ST.theme=="Custom" then Th.apply("Custom") end end)
	X.cards(sP,"FONT  (each card is drawn in its own font)",Th.pnames,2,52,function(b,n)
		b.BackgroundColor3=T.RB
		local a=new("TextLabel",{Size=UDim2.new(1,-26,0,26),Position=UDim2.fromOffset(10,4),Text="Aa Quick Fox",Font=Th.fnt(PK[n][1]),TextSize=15,TextXAlignment=XL,TextTruncate=TE},b) a:SetAttribute("fk",true)
		local c=new("TextLabel",{Size=UDim2.new(1,-26,0,12),Position=UDim2.fromOffset(10,32),Text=n,Font=Enum.Font.Gotham,TextSize=9,TextColor3=T.DIM,TextXAlignment=XL},b) c:SetAttribute("fk",true)
	end,function() return ST.pack end,function(n) Th.setpack(n) end)
	X.cards(sP,"BACKGROUND EFFECT  (20 styles)",Th.fxn,4,58,function(b,n)
		b.BackgroundColor3=T.RB
		local s=X.FXL[n]
		local gl=new("TextLabel",{Size=UDim2.new(1,0,0,30),Position=UDim2.fromOffset(0,4),Text=s.g[1] or "·",TextSize=20,Font=Enum.Font.GothamMedium,TextColor3=X.FXC[s.col] or T.AC},b) gl:SetAttribute("fk",true) K(gl)
		new("TextLabel",{Size=UDim2.new(1,0,0,14),Position=UDim2.new(0,0,1,-18),Text=n,TextSize=10,TextColor3=T.DIM},b)
	end,function() return ST.fx end,function(n) X.fxSet(n) Th.save() end)
	X.cards(sP,"MENU SHAPE",Th.shapes,4,58,function(b,n)
		b.BackgroundColor3=T.RB
		local s=SHP[n]
		local w,h=s[1]/840*52,s[2]/540*34
		local pv=K(new("Frame",{Size=UDim2.fromOffset(w,h),Position=UDim2.new(.5,-w/2,0,8+(34-h)/2),BackgroundColor3=T.AC},b)) rd(pv,4)
		new("TextLabel",{Size=UDim2.new(1,0,0,14),Position=UDim2.new(0,0,1,-18),Text=n,TextSize=10,TextColor3=T.DIM},b)
	end,function() return ST.shape end,function(n) Th.shape(n) end)
	X.cards(sP,"CORNERS",Th.cnames,3,56,function(b,n)
		b.BackgroundColor3=T.RB
		local pv=K(new("Frame",{Size=UDim2.fromOffset(40,24),Position=UDim2.new(.5,-20,0,7),BackgroundColor3=T.AC},b))
		new("UICorner",{CornerRadius=UDim.new(0,({Sharp=0,Boxy=3,Soft=6,Round=9,Squircle=12,Pill=12})[n])},pv)
		new("TextLabel",{Size=UDim2.new(1,0,0,14),Position=UDim2.new(0,0,1,-18),Text=n,TextSize=10,TextColor3=T.DIM},b)
	end,function() return ST.corner end,function(n) Th.corner(n) end)
	sld(sP,"Menu Opacity","opac",.4,1,"How see-through the menu is",function(v) ST.opac=v if X.built then if main.Visible then main.GroupTransparency=1-v end Th.save() end end)
	btn(sP,"Reset Menu Style","Back to the default Black theme, Zen font and Round corners",function()
		ST.hue=.6 ST.corner="Round" ST.pack="Zen" ST.acc=nil ST.fx="Snow" Th.custom() SL.opac(1) SL.hue(.6)
		Th.setpack("Zen") Th.corner("Round") Th.shape("Classic") X.fxSet("Snow") Th.apply("Black") toast("Menu style reset")
	end)
	sec(sP,"Effects")
	tog(sP,"Background Blur","blur","Blurs the game behind the menu while it is open",function(v) if main.Visible then tw(X.blur,.3,{Size=v and 14 or 0}) end end)
	tog(sP,"Background Particles","part","Shows the selected effect style behind the menu",function(v) X.fxc.Visible=v end)
	tog(sP,"Welcome Splash","splash","Plays the avatar welcome intro when the menu first opens")
	tog(sP,"Animated Glow Border","glow","Slowly spinning light around the menu edge",function(v) if not v then stg.Rotation=0 end end)
	sld(sP,"Menu Scale","uiS",.6,1.3,"Makes the whole menu bigger or smaller",function(v) if X.built then ms.Scale=X.fit() end end,.05)
	sec(sP,"Autosave  ("..GN..")")
	tog(sP,"Auto Save Settings","asave","Saves your toggles and sliders every 25 seconds")
	do
		local cr2=row(sP,42,"save load autosave")
		for i,n in ipairs({"Save Now","Load Autosave"}) do
			local b=new("TextButton",{Size=UDim2.new(.5,-14,0,26),Position=UDim2.new((i-1)*.5,i==1 and 10 or 4,.5,-13),Text=n,TextSize=12,BackgroundColor3=T.RB},cr2) rd(b,8) press(b)
			b.Activated:Connect(function() if i==1 then saveA() elseif loadA() then toast("Loaded!") end end)
		end
	end
	btn(sP,"Switch Game","Goes back to the eko hub (games + avatar)",function() G.Eko() task.spawn(function() G.EkoBoot(true) end) end)
	btn(sP,"Unload Eko","Closes the menu and stops every feature",function() G.Eko() end)
	note(sP,"RightShift or '-' hides the menu",20)
end
step(.6,"Loading engine")
-- ===== ENGINE =====
do
	local PO,HL={}, {}
	local function mkP(p)
		local d={tx=new("TextLabel",{AnchorPoint=Vector2.new(.5,1),Size=UDim2.fromOffset(200,28),TextSize=11,TextStrokeTransparency=.4,TextColor3=WH,Visible=false,ZIndex=2},EL),ln=mkf(),bx=new("Frame",{BackgroundTransparency=1,Visible=false,ZIndex=2},EL),hb=new("Frame",{BackgroundColor3=BLK,Visible=false,ZIndex=2},EL)}
		new("UIStroke",{Color=WH,Thickness=1.5},d.bx)
		d.hf=new("Frame",{AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,0,1,0),Size=UDim2.fromScale(1,1),BackgroundColor3=rgb(60,255,90),ZIndex=3},d.hb)
		PO[p]=d return d
	end
	local function hidP(d) d.tx.Visible=false d.ln.Visible=false d.bx.Visible=false d.hb.Visible=false end
	local function pStep()
		local cm,r0=workspace.CurrentCamera,root()
		local any=F.esp and (F.pesp or F.pbox or F.phb or F.ptr)
		for _,p in ipairs(P:GetPlayers()) do
			if p~=LP then
				local c=p.Character local hd=c and c:FindFirstChild("Head") local rt=c and c:FindFirstChild("HumanoidRootPart") local h=c and c:FindFirstChildOfClass("Humanoid")
				local skip=(not F.pteam) and p.Team~=nil and p.Team==LP.Team
				if F.esp and F.chams and c and not skip then local hl=HL[p] if not hl then hl=Instance.new("Highlight") hl.FillTransparency=.6 hl.Parent=par HL[p]=hl end hl.Adornee=c elseif HL[p] then HL[p].Adornee=nil end
				local d=PO[p] if not d and any then d=mkP(p) end
				if d then
					local far=r0 and rt and (rt.Position-r0.Position).Magnitude>F.edist
					local top,bot,z1,z2
					if any and not far and not skip and hd and rt and h and h.Health>0 then top,z1=w2(hd.Position+Vector3.new(0,.8,0)) bot,z2=w2(rt.Position-Vector3.new(0,3,0)) end
					if not z1 or z1<=0 or z2<=0 then hidP(d) else
						local ht=math.abs(bot.Y-top.Y) local wd=ht*.55 local cxp=(top.X+bot.X)/2
						d.bx.Visible=F.pbox d.bx.Position=UDim2.fromOffset(cxp-wd/2,top.Y) d.bx.Size=UDim2.fromOffset(wd,ht)
						d.hb.Visible=F.phb d.hb.Position=UDim2.fromOffset(cxp-wd/2-6,top.Y) d.hb.Size=UDim2.fromOffset(3,ht)
						local f=math.clamp(h.Health/math.max(h.MaxHealth,1),0,1) d.hf.Size=UDim2.new(1,0,f,0) d.hf.BackgroundColor3=Color3.fromHSV(f*.33,1,1)
						d.tx.Visible=F.pesp d.tx.Position=UDim2.fromOffset(cxp,top.Y-2)
						if F.pesp then d.tx.Text=string.format("%s (@%s)\n%dm | %d HP",p.DisplayName,p.Name,math.floor(r0 and (rt.Position-r0.Position).Magnitude or 0),math.floor(h.Health)) end
						if F.ptr then ln(d.ln,Vector2.new(cm.ViewportSize.X/2,cm.ViewportSize.Y),Vector2.new(cxp,bot.Y)) else d.ln.Visible=false end
					end
				end
			end
		end
	end
	local function gpart(c) for _,n in ipairs(X.TT[X.tpn]) do local x=c:FindFirstChild(n) if x then return x end end end
	local faceOn=false
	local function setFace(on) local h=hum() if on then if h then h.AutoRotate=false end faceOn=true elseif faceOn then if h then h.AutoRotate=true end faceOn=false end end
	local function aimStep()
		local cm=workspace.CurrentCamera
		if F.aimhold and not UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then lock=nil if X.setLock then X.setLock(nil) end if faceOn then setFace(false) end return end
		if not (F.sticky and lock and alive(lock)) then lock=nil end
		if not lock then
			local ctr,best=cm.ViewportSize/2,math.huge
			for _,p in ipairs(P:GetPlayers()) do
				if p~=LP and alive(p) and not (F.team and p.Team and p.Team==LP.Team) then
				local pt=(not X.aimFilter or X.aimFilter(p)) and gpart(p.Character)
					if pt then
						local v,on=cm:WorldToViewportPoint(pt.Position)
						local d=(Vector2.new(v.X,v.Y)-ctr).Magnitude
						if on and d<F.afov then
							local rp=RaycastParams.new() rp.FilterDescendantsInstances={LP.Character,p.Character}
							if not (F.wall and workspace:Raycast(cm.CFrame.Position,pt.Position-cm.CFrame.Position,rp)) then
								local sc=d
								if X.prio==2 then sc=(pt.Position-cm.CFrame.Position).Magnitude elseif X.prio==3 then sc=p.Character:FindFirstChildOfClass("Humanoid").Health end
								if sc<best then best,lock=sc,p end
							end
						end
					end
				end
			end
		end
		if X.setLock then X.setLock(lock) end
		local pt=lock and gpart(lock.Character)
		if pt then
			local pos=pt.Position+pt.AssemblyLinearVelocity*F.pred
			local dv=pos-cm.CFrame.Position
			local up=(dv.Magnitude>0 and math.abs(dv.Unit.Y)>.97) and cm.CFrame.RightVector or Vector3.yAxis
			cm.CFrame=cm.CFrame:Lerp(CFrame.lookAt(cm.CFrame.Position,pos,up),1-F.smooth*.95)
			if choice=="riv" and F.face then
				local r,h=root(),hum()
				if r and h then local fd=Vector3.new(pos.X-r.Position.X,0,pos.Z-r.Position.Z) if fd.Magnitude>.5 then setFace(true) r.CFrame=CFrame.lookAt(r.Position,r.Position+fd) end end
			elseif faceOn then setFace(false) end
		elseif faceOn then setFace(false) end
	end
	local tdt,tlast=0,0
	local function trigStep(dt)
		local cm=workspace.CurrentCamera
		local rp=RaycastParams.new() rp.FilterType=Enum.RaycastFilterType.Exclude rp.FilterDescendantsInstances=LP.Character and {LP.Character} or {}
		local res=workspace:Raycast(cm.CFrame.Position,cm.CFrame.LookVector*1500,rp)
		local m=res and res.Instance and res.Instance:FindFirstAncestorOfClass("Model")
		local pl=m and P:GetPlayerFromCharacter(m)
		if pl and pl~=LP and alive(pl) and not (F.team and pl.Team and pl.Team==LP.Team) then
			tdt=tdt+dt
			if tdt>=F.tdel and tick()-tlast>.08 then tlast=tick() X.click() end
		else tdt=0 end
	end
	local mt=0
	local function meleeStep(dt)
		local r,h=root(),hum() if not (r and h) then return end
		mt=mt+dt if mt<.12 then return end mt=0
		local best,bd
		for _,p in ipairs(P:GetPlayers()) do
			if p~=LP and alive(p) and not (F.team and p.Team and p.Team==LP.Team) then local rt=p.Character.HumanoidRootPart local d=(rt.Position-r.Position).Magnitude if d<=F.melr and (not bd or d<bd) then best,bd=rt,d end end
		end
		if not best then return end
		if F.melf then r.CFrame=CFrame.lookAt(r.Position,Vector3.new(best.Position.X,r.Position.Y,best.Position.Z)) end
		local c=LP.Character local tool=c and c:FindFirstChildOfClass("Tool")
		if not tool then local bp=LP:FindFirstChildOfClass("Backpack") tool=bp and bp:FindFirstChildOfClass("Tool") if tool then h:EquipTool(tool) end end
		if tool then pcall(function() tool:Activate() end) end
	end
	local function hbRestore() for rt,v in pairs(X.hb) do if rt.Parent then rt.Size=v[1] rt.Transparency=v[2] rt.CanCollide=v[3] end X.hb[rt]=nil end end
	local function hbStep()
		if not F.hbx then if next(X.hb) then hbRestore() end return end
		for _,p in ipairs(P:GetPlayers()) do
			if p~=LP and p.Character then
				local rt=p.Character:FindFirstChild("HumanoidRootPart")
				if rt then
					if not (F.team and p.Team and p.Team==LP.Team) then
						if not X.hb[rt] then X.hb[rt]={rt.Size,rt.Transparency,rt.CanCollide} end
						rt.Size=Vector3.new(F.hbs,F.hbs,F.hbs) rt.Transparency=.75 rt.CanCollide=false
					elseif X.hb[rt] then local v=X.hb[rt] rt.Size=v[1] rt.Transparency=v[2] rt.CanCollide=v[3] X.hb[rt]=nil end
				end
			end
		end
	end
	local function hz(a,b) return Vector3.new(a.X-b.X,0,a.Z-b.Z).Magnitude end
	local function stepTo(tp,spd,dt)
		local goal=tp
		if F.cruise>0 and hz(tp,fp)>6 then local ch=tp.Y+F.cruise goal=(fp.Y<ch-2) and Vector3.new(fp.X,ch,fp.Z) or Vector3.new(tp.X,ch,tp.Z) end
		local d=goal-fp
		if d.Magnitude>0 then fp=fp+d.Unit*math.min(spd*dt,d.Magnitude) end
		return (tp-fp).Magnitude<=2.5
	end
	local PFS=game:GetService("PathfindingService")
	local wp,wi,pt0,ptg=nil,2,0,nil
	local function runTo(tp,hh,r)
		local flat=Vector3.new(tp.X-r.Position.X,0,tp.Z-r.Position.Z).Magnitude
		if flat<=4 and math.abs(tp.Y-r.Position.Y)<10 then return true end
		if ptg~=tp or tick()-pt0>2 then
			if ptg~=tp then wp=nil end
			ptg,pt0=tp,tick()
			local from=r.Position
			task.spawn(function()
				local path=PFS:CreatePath({AgentRadius=2,AgentHeight=5,AgentCanJump=true})
				local o2=pcall(function() path:ComputeAsync(from,tp) end)
				if o2 and path.Status==Enum.PathStatus.Success then wp=path:GetWaypoints() wi=2 else wp=nil end
			end)
		end
		local w=wp and wp[wi]
		if w then
			hh:MoveTo(w.Position) if w.Action==Enum.PathWaypointAction.Jump then hh.Jump=true end
			if Vector3.new(w.Position.X-r.Position.X,0,w.Position.Z-r.Position.Z).Magnitude<4 then wi=wi+1 end
		else hh:MoveTo(tp) end
		return false
	end
	local was,ct,gt,sc,fa,ft,tm,av,wsr,hbT=false,0,0,0,0,0,0,0,false,0
	local function arrive(dt)
		if E.mode=="back" then E.mode="go" else
			E.atE=true ct=ct+dt gt=gt+dt
			if gt>.25 then gt=0 E.grab(E.tgt) end
			if ct>F.stay then E.BL[E.tgt]=tick()+300 E.tgt=nil E.atE=false ct=0 if F.back and E.base then E.mode="back" end end
		end
	end
	cn(RS.RenderStepped:Connect(function(dt)
		tm=tm+dt fa=fa+1 ft=ft+dt sc=sc+dt av=av+dt
		if F.glow and not Th.rainbow then stg.Rotation=(tm*60)%360 end
		if main.Visible then
			shg.Offset=Vector2.new(((tm*.45)%2)-1,0)
			if X.fxc.Visible then X.fxStep(dt,tm) end
		end
		if ft>=.5 then
			local pg2=0 pcall(function() pg2=LP:GetNetworkPing()*1000 end)
			local fps=math.floor(fa/ft+.5)
			if F.fps then fl.Text=string.format("%d FPS | %d ms",fps,math.floor(pg2)) end
			U.foot.Text=string.format("%d FPS  •  %d ms\nRightShift hides",fps,math.floor(pg2))
			if X.info then X.info.Text=string.format("Players: %d/%d  •  Ping: %d ms\nJob: %s",#P:GetPlayers(),P.MaxPlayers,math.floor(pg2),string.sub(game.JobId,1,18)) end
			local H=X.home
			if H then local s=math.floor(tick()-X.t0s) H.fps.Text=tostring(fps) H.ping.Text=math.floor(pg2).."ms" H.pl.Text=#P:GetPlayers().."/"..P.MaxPlayers H.ses.Text=string.format("%d:%02d",math.floor(s/60),s%60) end
			fa,ft=0,0
		end
		if av>25 then av=0 if F.asave then saveA(true) end end
		pcall(Th.rb,dt)
		local h,r,cm=hum(),root(),workspace.CurrentCamera
		if h and F.walk and not (runMode and F.auto and E.tgt) then h.WalkSpeed=F.walkS end
		if h and F.jp and not runMode then pcall(function() h.UseJumpPower=true h.JumpPower=F.jpv end) end
		if F.gravOn and not runMode then workspace.Gravity=F.grav end
		if F.fovOn then cm.FieldOfView=F.fovV end
		if F.ctOn then Lt.ClockTime=F.ct end
		if F.spin and r then r.CFrame=r.CFrame*CFrame.Angles(0,math.rad(F.spinS)*dt*30,0) end
		if F.bhop and h and UIS:IsKeyDown(Enum.KeyCode.Space) and not UIS:GetFocusedTextBox() and h.FloorMaterial~=Enum.Material.Air then h:ChangeState(Enum.HumanoidStateType.Jumping) end
		if X.specP then local sh=X.specP.Character and X.specP.Character:FindFirstChildOfClass("Humanoid") if sh and cm.CameraSubject~=sh then cm.CameraSubject=sh end end
		if X.follow and r then local ft2=X.follow.Character and X.follow.Character:FindFirstChild("HumanoidRootPart") if ft2 then r.CFrame=ft2.CFrame*CFrame.new(0,0,4) end end
		hbT=hbT+dt if hbT>.25 then hbT=0 pcall(hbStep) end
		local tp
		if F.auto then
			local held=E.tgt and LP.Character and E.tgt:IsDescendantOf(LP.Character)
			if E.tgt and (held or not E.tgt.Parent or not E.match(E.tgt)) then
				if (held or E.atE) and (held or not E.tgt.Parent) then E.got=E.got+1 if F.back and E.base then E.mode="back" end end
				E.tgt=nil E.atE=false ct=0
			end
			if E.mode=="back" then tp=E.base else if not E.tgt then E.tgt=E.pick() ct=0 E.atE=false end tp=E.tgt and E.ppos(E.tgt) end
		end
		if runMode then
			if h and r and tp then wsr=true h.WalkSpeed=(E.mode=="back") and F.runB or F.runS if runTo(tp,h,r) then arrive(dt) end
			elseif wsr and h and not F.walk then h.WalkSpeed=16 wsr=false end
		elseif h and r and (F.fly or tp) then
			was=true h.PlatformStand=true
			if not fp or (r.Position-fp).Magnitude>15 then fp=r.Position end
			if tp then
				if E.mode=="back" and F.tpb then fp=tp end
				if stepTo(tp,E.mode=="back" and F.rspd or F.spd,dt) then arrive(dt) end
			else fp=fp+X.flyDir(h,cm)*F.spd*dt end
			local lk=cm.CFrame.LookVector
			r.AssemblyLinearVelocity=Vector3.zero r.AssemblyAngularVelocity=Vector3.zero
			r.CFrame=CFrame.new(fp)*CFrame.Angles(0,math.atan2(-lk.X,-lk.Z),0)
		else fp=nil if was and h then h.PlatformStand=false was=false end end
		pcall(E.eStep) pcall(pStep)
		if F.cross then cx[3].Size=UDim2.fromOffset(F.afov*2,F.afov*2) end
		if F.aim then pcall(aimStep) elseif faceOn then pcall(setFace,false) end
		if F.trig then pcall(trigStep,dt) end
		if F.mel then pcall(meleeStep,dt) end
		pcall(GST,dt)
		if sc>.3 and E.stl then
			sc=0 local n=0 for _ in pairs(E.EG) do n=n+1 end
			local el=tick()-E.t0
			local tn2="none" if E.tgt then local rr,aa=E.rar(E.tgt) tn2=E.tgt.Name.." ["..rr..(aa and (" | "..aa) or "").."]" end
			E.stl.Text=string.format("Eggs found: %d | Collected: %d | %d:%02d\nTarget: %s | Base: %s",n,E.got,math.floor(el/60),math.floor(el%60),tn2,E.base and "set" or "not set")
		end
	end))
	cn(RS.Stepped:Connect(function() if (F.noclip or F.fly or (F.auto and not runMode)) and LP.Character then for _,p in ipairs(LP.Character:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end end end))
	cn(UIS.JumpRequest:Connect(function() if F.inf then local h=hum() if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end end end))
	cn(LP.Idled:Connect(function() if F.afk then pcall(function() local v=game:GetService("VirtualUser") v:CaptureController() v:ClickButton2(Vector2.new()) end) end end))
	cn(game:GetService("GuiService").ErrorMessageChanged:Connect(function() if F.arj then pcall(function() game:GetService("TeleportService"):Teleport(game.PlaceId,LP) end) end end))
	cn(P.PlayerRemoving:Connect(function(p) local d=PO[p] if d then d.tx:Destroy() d.ln:Destroy() d.bx:Destroy() d.hb:Destroy() PO[p]=nil end if HL[p] then HL[p]:Destroy() HL[p]=nil end if X.RH[p] then X.RH[p]:Destroy() X.RH[p]=nil end end))
	G.Eko=function()
		if F.asave then pcall(saveA,true) end
		for _,c in ipairs(C) do pcall(function() c:Disconnect() end) end
		if F.fb then pcall(TG.fb,false,true) end
		if F.fpsb then pcall(TG.fpsb,false,true) end
		if F.nofog then pcall(TG.nofog,false,true) end
		if F.frz then pcall(function() root().Anchored=false end) end
		pcall(hbRestore)
		for _,d in pairs(HL) do pcall(function() d:Destroy() end) end
		for _,d in pairs(X.RH) do pcall(function() d:Destroy() end) end
		for _,f in ipairs(X.cls) do pcall(f) end
		pcall(function() X.blur:Destroy() end)
		pcall(function() workspace.Gravity=X.g0 end)
		pcall(function() LP.CameraMaxZoomDistance=128 end)
		pcall(function() workspace.CurrentCamera.FieldOfView=70 local h=hum() if h then workspace.CurrentCamera.CameraSubject=h end end)
		pcall(function() local h=hum() if h then h.PlatformStand=false h.WalkSpeed=16 h.JumpPower=50 h.AutoRotate=true end end)
		gui:Destroy()
	end
end
-- ===== INIT =====
step(.8,"Loading your config")
local loaded=loadA(true)
local sc2 for _,c in ipairs(X.cfg.list) do if c.name==X.cfg.startup then sc2=c end end
if sc2 then pcall(applyCfg,sc2.data) end
X.fxc.Visible=F.part
X.fxSet(ST.fx)
step(.95,"Starting engine")
X.built=true
show(U.first)
X.navPaint()
step(1,"Ready")
endLoad() showM()
task.delay(.3,X.welcome)
if sc2 then task.delay(1.4,function() toast("Startup config: "..sc2.name) end) elseif loaded then task.delay(1.4,function() toast("Settings loaded") end) end
end)
if not ok then
	warn("[Eko] "..tostring(e))
	pcall(function()
		local g=Instance.new("ScreenGui") g.Parent=gp()
		local l=Instance.new("TextLabel") l.Size=UDim2.new(1,-20,0,90) l.Position=UDim2.fromOffset(10,40) l.BackgroundColor3=Color3.fromRGB(150,20,20) l.TextColor3=Color3.new(1,1,1) l.TextWrapped=true l.Text="Eko error: "..tostring(e) l.Parent=g
		task.delay(30,function() g:Destroy() end)
	end)
end
end
G.EkoBoot=boot
boot(false)