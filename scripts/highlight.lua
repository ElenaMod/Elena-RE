local COLOR       = Color3.fromRGB(255, 40, 200)
local THROUGH     = true
local FILL_ALPHA  = 1.0
local OUTLINE_A   = 0.0

local Players     = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- character-addr -> highlight userdata
local owned = {}

local function clear_all()
    for _, h in pairs(owned) do
        if h then Instance.destroy(h) end
    end
    owned = {}
end

local function outline(character)
    if not character then return end
    if owned[character.Address] then return end

    local h = Instance.new("Highlight", character)
    if not h then return end
    h.Adornee              = character
    h.FillColor            = COLOR
    h.OutlineColor         = COLOR
    h.FillTransparency     = FILL_ALPHA
    h.OutlineTransparency  = OUTLINE_A
    h.DepthMode            = THROUGH and 1 or 0
    h.Enabled              = true
    owned[character.Address] = h
end

print("skidding.")

while true do
    local live = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            local c = p.Character
            if c then
                live[c.Address] = c
                outline(c)
            end
        end
    end

    for addr, h in pairs(owned) do
        if not live[addr] then
            Instance.destroy(h)
            owned[addr] = nil
        end
    end

    wait(1.0)
end