local Players     = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Data        = LocalPlayer and LocalPlayer:FindFirstChild("Data")

local function setDataValue(name, val)
    pcall(function()
        local child = Data and Data:FindFirstChild(name)
        if child then child.Value = val end
    end)
end

local function apply_arm(arm)
    pcall(function()
        local arms = game:GetService("ReplicatedStorage"):WaitForChild("Viewmodels").Arms
        for _, c in pairs(arms:GetChildren()) do
            if c.Name ~= arm then c.Name = "Temp" end
        end
        local target = arms:FindFirstChild(arm)
        if target then target.Name = "Delinquent" end
    end)
end

local function getRandomItem(list)
    return list[math.random(1, #list)]
end

local announcers = {
    "American","British","Russian","Homeless","Warcrimes","YouTuber",
    "Movie Man","Santa","Murderous Child","Hackula","Jolly Narrator",
    "Carnival Carnie","John","Eprika","Flamingo","Petrify","Bandites",
    "xonae","Enforcer","Koneko","Weesnaw",
}

local arms = {
    "1x1x1x1","Monky With Drip","Da Monky With Drip","Alien",
    "Alien In Disguise","Delinquent","Rabblerouser","Ace Pilot","BrickBattle",
    "John","Castlers","Phoenix","Punk","Red Panda","Magician","Froggy",
    "Mechanic","Pizza Boy","Garcello","Bigfoot","Noob","Bloxxer","Farmer",
    "Paintballer","Shedletsky","Soldier","Agent","Hazmat","Seeker of Hearts",
    "Segg with Drip","Christmas Nomad",
}

local melees = {
    "Dagger","Butterfly Knife","Karambit","Tomahawk","Brass Knuckles",
    "Fisticuffs","Bat","Machete","Pan","Pitchfork","Claws","Ban Hammer",
    "Classic Sword","Silver Bell","Swordfish","Icicle","Coal Sword","Kunai",
    "Kukri","Sickle","Candy Cane","Pencil","Toy Tree","Bouquet",
    "Gaster Blaster","Combat Knife","Tactical Knife","Shovel","Sledgehammer",
    "Baton","Calculator","Katana","Literal Melee","Paddle","Rokia Hammer",
    "Wrench","ACT Trophy","Electronic Stake","Garlic Kebab","Pumpkin Bucket",
    "Fire Poker","Frog","Da Melee","Candy Cane Sword","Glacier Blade",
    "Coal Scythe","Wooden Spoon","The Darkheart","The Firebrand",
    "The Venomshank","The Illumina","The Ice Dagger","The Ghostwalker",
    "The Windforce","Night's Edge","When Day Breaks","Banana","Persian Sword",
    "Big Sip","Blade","Bat Axe","Fish","Khopesh","Rapier","Sabre",
    "Slicecicle","Swift End","Divinity","Moai","Bone Karambit","Newspaper","Mop",
}

math.randomseed(os.time())

local selectedAnnouncer = getRandomItem(announcers)
local selectedArm       = getRandomItem(arms)
local selectedMelee     = getRandomItem(melees)

setDataValue("Announcer", selectedAnnouncer)
apply_arm(selectedArm)
setDataValue("Melee", selectedMelee)

print(string.format("[elena] Applied: Announcer -> %s | Arm -> %s | Melee -> %s", selectedAnnouncer, selectedArm, selectedMelee))
