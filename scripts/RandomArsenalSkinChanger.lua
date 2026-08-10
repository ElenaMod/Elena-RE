local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Skin Changer Made By Grok And ChatGpt (NOTE NOT ALL WORKS)",
   LoadingTitle = "Galaxy Edition",
   LoadingSubtitle = "By Grok And ChatGpt",
   ConfigurationSaving = {Enabled = false}
})

-- Announcers (Full Wiki List)
local AnnTab = Window:CreateTab("Announcer")
local announcers = {
   "American", "British", "Russian",
   "Homeless", "Warcrimes", "YouTuber", "Movie Man", "Santa", "Murderous Child", "Hackula", "Jolly Narrator", "Carnival Carnie",
   "John", "Eprika", "Flamingo", "Petrify", "Bandites", "xonae", "Enforcer",
   "Koneko", "Weesnaw"
}
for _, ann in ipairs(announcers) do
   AnnTab:CreateButton({
      Name = ann,
      Callback = function()
         pcall(function() game.Players.LocalPlayer.Data.Announcer.Value = ann end)
      end
   })
end

-- Arms (Expanded Wiki Player Skins for Viewmodel)
local ArmsTab = Window:CreateTab("Arms")
ArmsTab:CreateParagraph({Title="Note", Content="Client visual rename to Delinquent. Unreliable."})
local armsModels = {
   "1x1x1x1", "Monky With Drip", "Da Monky With Drip", "Alien", "Alien In Disguise", "Delinquent", "Rabblerouser", "Ace Pilot", "BrickBattle",
   "John", "Castlers", "Phoenix", "Punk", "Red Panda", "Magician", "Froggy", "Mechanic", "Pizza Boy", "Garcello", "Bigfoot", "Noob",
   "Bloxxer", "Farmer", "Paintballer", "Shedletsky", "Soldier", "Agent", "Hazmat", "Seeker of Hearts", "Phoenix", "Segg with Drip", "Christmas Nomad"
}
local function applyArm(arm)
   pcall(function()
      local arms = game:GetService("ReplicatedStorage"):WaitForChild("Viewmodels").Arms
      for _, child in ipairs(arms:GetChildren()) do
         if child.Name ~= arm then child.Name = "Temp" end
      end
      local target = arms:FindFirstChild(arm)
      if target then target.Name = "Delinquent" end
   end)
end
for _, arm in ipairs(armsModels) do
   ArmsTab:CreateButton({
      Name = arm,
      Callback = function() applyArm(arm) end
   })
end
ArmsTab:CreateButton({
   Name = "Revert Arms",
   Callback = function()
      pcall(function()
         local arms = game:GetService("ReplicatedStorage"):WaitForChild("Viewmodels").Arms
         for _, child in ipairs(arms:GetChildren()) do
            child.Name = "Delinquent"
         end
      end)
   end
})

-- Helper for Melee Buttons
local function addMelee(tab, name, img)
   local btnName = name .. (img and " [IMG]" or "")
   tab:CreateButton({
      Name = btnName,
      Callback = function()
         pcall(function()
            game.Players.LocalPlayer.Data.Melee.Value = name
         end)
      end
   })
end

-- Melee Standard (Wiki Full List)
local StandardTab = Window:CreateTab("Melee Standard")
local standardMelees = {
   "Dagger", "Butterfly Knife", "Karambit", "Tomahawk", "Brass Knuckles", "Fisticuffs", "Bat", "Machete", "Pan", "Pitchfork",
   "Claws", "Ban Hammer", "Classic Sword", "Silver Bell", "Swordfish", "Icicle", "Coal Sword", "Kunai", "Kukri", "Sickle",
   "Candy Cane", "Pencil", "Toy Tree", "Bouquet", "Gaster Blaster", "Combat Knife", "Tactical Knife", "Shovel", "Sledgehammer",
   "Baton", "Calculator", "Katana", "Literal Melee", "Paddle", "Rokia Hammer", "Wrench", "ACT Trophy", "Electronic Stake",
   "Garlic Kebab", "Pumpkin Bucket", "Fire Poker", "Frog", "Da Melee", "Candy Cane Sword", "Glacier Blade", "Coal Scythe",
   "Wooden Spoon", "The Darkheart", "The Firebrand", "The Venomshank", "The Illumina", "The Ice Dagger", "The Ghostwalker",
   "The Windforce", "Night's Edge", "When Day Breaks", "Banana", "Persian Sword", "Big Sip", "Blade", "Bat Axe", "Fish",
   "Khopesh", "Rapier", "Sabre", "Slicecicle", "Swift End", "Divinity", "Moai"
}
local imgMap = {
   Kukri = "rbxassetid://4526686402",
   ["Bat Axe"] = "http://www.roblox.com/asset/?id=7854598317",
   Chainsaw = "rbxassetid://4194770961",
   Endbringer = "rbxassetid://5697572579",
   ["Energy Blade"] = "rbxassetid://4194773073",
   ["Energy Katar"] = "rbxassetid://5697572616",
   Moai = "rbxassetid://3560280048"
}
for _, name in ipairs(standardMelees) do
   local img = imgMap[name:gsub("The ", ""):gsub(" ", "_")]
   addMelee(StandardTab, name, img)
end

-- Troll Melee
local TrollTab = Window:CreateTab("Troll Melee")
local trollMelees = {"Moai", "Bone Karambit", "Calculator", "Pencil", "Newspaper", "Mop", "Fish", "Literal Melee", "Banana", "Toy Tree", "Bouquet"}
for _, name in ipairs(trollMelees) do addMelee(TrollTab, name) end

-- Tryhard
local TryhardTab = Window:CreateTab("Tryhard")
local tryhardMelees = {"Bone Karambit", "The Darkheart", "The Firebrand", "The Venomshank", "The Illumina", "The Ice Dagger", "The Ghostwalker", "The Windforce", "Night's Edge", "Katana", "Butterfly Knife", "Karambit"}
for _, name in ipairs(tryhardMelees) do addMelee(TryhardTab, name) end

-- Revert Tab
local RevertTab = Window:CreateTab("Revert")
RevertTab:CreateSection("Default Melee")
RevertTab:CreateButton({
   Name = "Revert to Dagger (Default)",
   Callback = function()
      pcall(function()
         game.Players.LocalPlayer.Data.Melee.Value = "Dagger"
         Rayfield:Notify({Title="Reverted", Content="Melee set to Dagger!"})
      end)
   end
})
