local BURL = "https://raw.githubusercontent.com/blmpsaa/Klzmia/main/"
local fn = "wattyhub.ogg"

if not isfile(fn) then
    pcall(function() writefile(fn, game:HttpGet(BURL .. fn)) end)
end

local success, sid = pcall(function() return getcustomasset(fn) end)

if success and sid then
    local s = Instance.new("Sound", workspace)
    s.SoundId = sid
    s:Play()
    s.Ended:Wait()
    s:Destroy()
end
