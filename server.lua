function RandomVariable(length)
	local res = ""
	for i = 1, length do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end

if getgenv().Dex ~= nil then
    getgenv().Dex:Destroy()
    getgenv().Dex = nil
end
local key = RandomVariable(10)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/CloneRef.lua", true))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Bypasses.lua", true))()
getgenv().Dex = game:GetObjects("rbxassetid://9352453730")[1]
local edition = "Synapse"
local id = game.Players.LocalPlayer:GetDebugId()
local uniqueuid = game:GetService("HttpService"):GenerateGUID(true)
uniqueuid = string.gsub(uniqueuid,"}","")
uniqueuid = string.gsub(uniqueuid,"{","")
local namer = ("%s idEnc:%s"):format(id,uniqueuid)
Dex.Name = namer
Dex.Parent = cloneref(game:GetService("CoreGui"))
Dex.About.Version.Text = edition.."  Edition"
Dex.About.Creator.Text = [[Created by: Moon
Edited by: wally & ic3

USID: ]]..id..[[

]]..uniqueuid..[[
Key: ]]..key
Dex.IntroFrame.Version.Text = edition.."  Edition"
Dex.IntroFrame.Creator.Text = [[Created by: Moon
Edited by: wally & ic3

USID: ]]..id..[[

]]..uniqueuid..[[
Key: ]]..key
Dex.SideMenu.Version.Text = "v4"
Dex.IgnoreGuiInset = true
Dex.IntroFrame.Title.TextWrapped = false
for _,v in pairs(Dex:GetDescendants()) do
	task.spawn(function()
		if v.Name == "Title" and v.Parent.Name ~= "SideMenu" then
			v.Text = [[Dex | Beta v2]]
		end
	end)
end
for _,v in pairs(Dex:GetChildren()) do
	task.spawn(function()
		if v.Name ~= "IntroFrame" and v.Name ~= "ScriptEditor" and v.Name ~= "TableCaution" and v.Name ~= "CallRemote" and v.Name ~= "Caution" and v.Name ~= "Confirmation" and v.Name ~= "SideMenu" and v.ClassName == "Frame" then
			v.BackgroundTransparency = 0.1
		end
	end)
end

local function Load(Obj, Url)
    local function GiveOwnGlobals(Func, Script)
        local Fenv = {}
        local RealFenv = {script = Script}
        local FenvMt = {}
        function FenvMt:__index(b)
            if RealFenv[b] == nil then
                return getfenv()[b]
            else
                return RealFenv[b]
            end
        end
        function FenvMt:__newindex(b, c)
            if RealFenv[b] == nil then
                getfenv()[b] = c
            else
                RealFenv[b] = c
            end
        end
        setmetatable(Fenv, FenvMt)
        setfenv(Func, Fenv)
        return Func
    end
    local function LoadScripts(Script)
        if Script.ClassName == "Script" or Script.ClassName == "LocalScript" then
            task.spawn(GiveOwnGlobals(loadstring(Script.Source, "=" .. Script:GetFullName()), Script))
        end
        for _,v in ipairs(Script:GetChildren()) do
            LoadScripts(v)
        end
    end
    LoadScripts(Obj)
end
task.spawn(function()Load(Dex)end)