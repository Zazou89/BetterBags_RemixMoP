---@class BetterBags: AceAddon
local addon = LibStub("AceAddon-3.0"):GetAddon("BetterBags")

---@class Categories: AceModule
local categories = addon:GetModule("Categories")

-- Localization table
local locales = {
    ["enUS"] = {
        ["Remix"] = "Remix",
        ["Meta Gems"] = "Meta Gems",
        ["Cogwheel Gems"] = "Cogwheel Gems",
        ["Tinker Gems"] = "Tinker Gems",
        ["Prismatic Gems"] = "Prismatic Gems",
        ["Enhancements"] = "Enhancements",
        ["Utilities"] = "Utilities",
        ["Consumables"] = "Potions & Bandages",
        ["Threads"] = "Threads",
        ["Addon alert"] = "|cff1DDB7FBetterBags - Remix: MoP|r is a part of |cff1DDB7FBetterBags - World Events|r.\nYou must choose which addon to keep, and disable the one you don't want.",
    },
    ["frFR"] = {
        ["Remix"] = "Remix",
        ["Meta Gems"] = "Meta-gemmes",
        ["Cogwheel Gems"] = "Roues dentées précieuses",
        ["Tinker Gems"] = "Gemmes de bricolage",
        ["Prismatic Gems"] = "Gemmes prismatiques",
        ["Enhancements"] = "Améliorations",
        ["Utilities"] = "Utilitaires",
        ["Consumables"] = "Potions et Bandages",
        ["Threads"] = "Fils",
        ["Addon alert"] = "|cff1DDB7FBetterBags - Remix: MoP|r est déjà intégré à |cff1DDB7FBetterBags - World Events|r.\nVous devez choisir l'addon à conserver et désactiver celui dont vous ne voulez pas.",
    },
    ["deDE"] = {
        ["Remix"] = "Remix",
        ["Meta Gems"] = "Metaedelstein",
        ["Cogwheel Gems"] = "Zahnradedelstein",
        ["Tinker Gems"] = "Tüftleredelstein",
        ["Prismatic Gems"] = "Prismatischer Edelstein",
        ["Enhancements"] = "Verbrauchbares: Verbesserungen",
        ["Utilities"] = "Verbrauchbares: Hilfsmittel",
        ["Consumables"] = "Tränke und Verbände",
        ["Threads"] = "Faden",
    },
    ["ptBR"] = {
        ["Remix"] = "Remix",
        ["Meta Gems"] = "Meta Gemas",
        ["Cogwheel Gems"] = "Gema de Engrenagem",
        ["Tinker Gems"] = "Gema de Gambiarra",
        ["Prismatic Gems"] = "Gema Prismática",
        ["Enhancements"] = "Aprimoramento",
        ["Utilities"] = "Utilitários",
        ["Consumables"] = "Poções & Bandagens",
        ["Threads"] = "Fios",
    }
}

-- Detects current language
local currentLocale = GetLocale()

-- Function to get the translation
local function L(key)
    return locales[currentLocale] and locales[currentLocale][key] or locales["enUS"][key]
end

local WoWRemixMoP = {
    217930, --Nostwin's Voucher
    211388, --Timerunner's Starter Kit
    219218, --Timerunner's Starter Kit
    219219, --Timerunner's Starter Kit
    -- Cache
    223908, --Minor Bronze Cache
    223909, --Lesser Bronze Cache
    223910, --Bronze Cache
    223911, --Greater Bronze Cache
    211279, --Cache of Infinite Treasure
    --Gear
    208555, --Timerunner's Idol
    208554, --Timerunner's Beacon
    208487, --Timerunner's Ring
    208491, --Timerunner's Seal
    210523, --Timerunner's Amulet
    --Miscellaneous
    223905, --Asynchronized Meta Gem
    223904, --Asynchronized Cogwheel Gem
    223906, --Asynchronized Tinker Gem
    223907, --Asynchronized Prismatic Gem
    --Companions
    221817, --Muskpaw Calf
    --Toys
    220777, --Cherry Blossom Trail
    217723, --Fury of Xuen
    217724, --Kindness of Chi-ji
    217725, --Essence of Yu'lon
    217726, --Fortitude of Niuzao
    104262, --Odd Polished Stone Odd Polished Stone
    86565,  --Battle Horn
    134023, --Bottled Tornado
    86575,  --Chalice of Secrets
    86590,  --Essence of the Breeze
    86594,  --Helpful Wikky's Whistle
    86571,  --Kang's Bindstone
    86589,  --Ai-Li's Skymirror
    86578,  --Eternal Warrior's Sigil
    86581,  --Farwater Conch
    86593,  --Hozen Beach Ball
    86586,  --Panflute of Pandaria
    86583,  --Salyin Battle Banner
    86573,  --Shard of Archstone
    86582,  --Aqua Jewel
    86568,  --Mr. Smite's Brass Compass
    86588,  --Pandaren Firework Launcher
    104302, --Blackflame Daggers
    104331, --Warning Sign
    98136,  --Gastropod Shell
    104309, --Eternal Kiln
    89205,  --Mini Mana Bomb
    --Mounts
    220768, --Reins of the Astral Emperor's Serpent
    220766, --Reins of the August Phoenix
    213582, --Sky Surfer
    213576, --Golden Discus Golden Discus
    213584, --Mogu Hazeblazer Mogu Hazeblazer
    213595, --Feathered Windsurfer String Feathered Windsurfer String
    87784,  --Reins of the Jungle Riding Crane Reins of the Jungle Riding Crane
    213602, --Reins of the Gilded Riding Crane Reins of the Gilded Riding Crane
    213603, --Reins of the Pale Riding Crane Reins of the Pale Riding Crane
    213605, --Reins of the Rose Riding Crane Reins of the Rose Riding Crane
    213606, --Reins of the Silver Riding Crane Reins of the Silver Riding Crane
    213607, --Reins of the Luxurious Riding Crane Reins of the Luxurious Riding Crane
    213604, --Reins of the Tropical Riding Crane Reins of the Tropical Riding Crane
    213608, --Reins of the Snowy Riding Goat Reins of the Snowy Riding Goat
    213609, --Reins of the Little Red Riding Goat Reins of the Little Red Riding Goat
    213628, --Reins of the Riverwalker Mushan Reins of the Riverwalker Mushan
    213627, --Reins of the Palehide Mushan Beast Reins of the Palehide Mushan Beast
    87786,  --Reins of the Black Riding Yak Reins of the Black Riding Yak
    87787,  --Reins of the Modest Expedition Yak Reins of the Modest Expedition Yak
    84753,  --Reins of the Kafa Yak Reins of the Kafa Yak
    213626, --Reins of the Purple Shado-Pan Riding Tiger Reins of the Purple Shado-Pan Riding Tiger
    213624, --Cobalt Juggernaut Cobalt Juggernaut
    213625, --Fel Iron Juggernaut Fel Iron Juggernaut
    213623, --Reins of the Bloody Skyscreamer Reins of the Bloody Skyscreamer
    213622, --Reins of the Night Pterrorwing Reins of the Night Pterrorwing
    213621, --Reins of the Jade Pterrordax Reins of the Jade Pterrordax
    218111, --Reins of the Amber Pterrordax Reins of the Amber Pterrordax
    213600, --Reins of the Marble Quilen Reins of the Marble Quilen
    213601, --Reins of the Guardian Quilen Reins of the Guardian Quilen
    213598, --Reins of the Dashing Windsteed Reins of the Dashing Windsteed
    213597, --Reins of the Forest Windsteed Reins of the Forest Windsteed
    213596, --Reins of the Daystorm Windsteed Reins of the Daystorm Windsteed
}
local WoWRemixMoP_metagems = {
    -- Meta Gems
    219878, --Tireless Spirit
    221977, --Funeral Pyre
    216663, --Oblivion Sphere
    220211, --Precipice of Madness
    216711, --Chi-ji, the Red Crane
    220117, --Ward of Salvation
    216671, --Thundering Orb
    219386, --Locus of Power
    216695, --Lifestorm
    221982, --Bulwark of the Black Ox
    220120, --Soul Tether
}
local WoWRemixMoP_cogwheelgems = {
    -- Cogwheel Gems
    216632, --Sprint
    218044, --Pursuit of Justice
    218045, --Door of Shadows
    216629, --Blink
    218043, --Wild Charge
    218108, --Dark Pact
    216631, --Roll
    217989, --Trailblazer
    218082, --Spiritwalker's Grace
    218109, --Death's Advance
    218110, --Soulshape
    217983, --Disengage
    218003, --Leap of Faith
    218004, --Vanish
    216630, --Heroic Leap
    218005, --Stampeding Roar
    218046, --Spirit Walk
}
local WoWRemixMoP_tinkergems = {
    -- Tinker Gems
    219801, --Ankh of Reincarnation
    212366, --Arcanist's Edge
    219944, --Bloodthirsty Coral
    219818, --Brilliance
    216649, --Brittle
    216648, --Cold Front
    217957, --Deliverance
    212694, --Enkindle
    212749, --Explosive Barrage
    212365, --Fervor
    219817, --Freedom
    212916, --Frost Armor
    219777, --Grounding
    216647, --Hailstorm
    217964, --Holy Martyr
    212758, --Incendiary Terror
    219389, --Lightning Rod
    216624, --Mark of Arrogance
    216650, --Memory of Vengeance
    212759, --Meteor Storm
    212361, --Opportunist
    216625, --Quick Strike
    217961, --Righteous Frenzy
    217927, --Savior
    216651, --Searing Light
    216626, --Slay
    219452, --Static Charge
    219523, --Storm Overload
    212362, --Sunstrider's Flourish
    212629, --Test Ruby
    216627, --Tinkmaster's Shield
    219527, --Vampiric Aura
    216628, --Victory Fire
    217903, --Vindication
    217907, --Warmth
    212760, --Wildfire
    219516, --Windweaver
}
local WoWRemixMoP_prismaticgems = {
    --Prismatic Gems
    210714, --Chipped Deadly Sapphire
    210717, --Chipped Hungering Ruby
    210715, --Chipped Masterful Amethyst
    210681, --Chipped Quick Topaz
    220367, --Chipped Stalwart Pearl
    211109, --Chipped Sustaining Emerald
    210716, --Chipped Swift Opal
    220371, --Chipped Versatile Diamond
    211123, --Deadly Sapphire
    216644, --Flawed Deadly Sapphire
    216641, --Flawed Hungering Ruby
    216640, --Flawed Masterful Amethyst
    216643, --Flawed Quick Topaz
    220368, --Flawed Stalwart Pearl
    216642, --Flawed Sustaining Emerald
    216639, --Flawed Swift Opal
    220372, --Flawed Versatile Diamond
    210718, --Hungering Ruby
    211106, --Masterful Amethyst
    211102, --Perfect Deadly Sapphire
    211103, --Perfect Hungering Ruby
    211108, --Perfect Masterful Amethyst
    211110, --Perfect Quick Topaz
    220369, --Perfect Stalwart Pearl
    211105, --Perfect Sustaining Emerald
    211101, --Perfect Swift Opal
    220373, --Perfect Versatile Diamond
    211107, --Quick Topaz
    220370, --Stalwart Pearl
    211125, --Sustaining Emerald
    211124, --Swift Opal
    220374, --Versatile Diamond
}

local WoWRemixMoP_Buff = {
    217731, --Timeless Scroll of Mystic Power
    217605, --Timeless Scroll of Intellect
    217607, --Timeless Scroll of the Wild
    217606, --Timeless Scroll of Fortitude
    217608, --Timeless Scroll of Battle Shout
    217730, --Timeless Scroll of Chaos
    217901, --Timeless Drums
}

local WoWRemixMoP_Utility = {
    217928, --Timeless Scroll of Resurrection
    217929, --Timeless Scroll of Cleansing
    217956, --Timeless Scroll of Summoning
}

local WoWRemixMoP_Consumable = {
    217904, --Timerunner's Draught of Power
    217905, --Timerunner's Draught of Health
    211254, --Timerunner's Bandage
}

local WoWRemixMoP_Threads = {
    217722, --Thread of Experience
    219264, --Temporal Thread of Experience
    219273, --Perpetual Thread of Experience
    219282, --Infinite Thread of Experience
    210990, --Thread of Versatility
    219263, --Temporal Thread of Versatility
    219272, --Perpetual Thread of Versatility
    219281, --Infinite Thread of Versatility
    210989, --Thread of Mastery
    219262, --Temporal Thread of Mastery
    219271, --Perpetual Thread of Mastery
    219280, --Infinite Thread of Mastery
    210987, --Thread of Leech
    219261, --Temporal Thread of Leech
    219270, --Perpetual Thread of Leech
    219279, --Infinite Thread of Leech
    210986, --Thread of Speed
    219260, --Temporal Thread of Speed
    219269, --Perpetual Thread of Speed
    219278, --Infinite Thread of Speed
    210985, --Thread of Haste
    219259, --Temporal Thread of Haste
    219268, --Perpetual Thread of Haste
    219277, --Infinite Thread of Haste
    210984, --Thread of Critical Strike
    219258, --Temporal Thread of Critical Strike
    219267, --Perpetual Thread of Critical Strike
    219276, --Infinite Thread of Critical Strike
    210983, --Thread of Stamina
    219257, --Temporal Thread of Stamina
    219266, --Perpetual Thread of Stamina
    219275, --Infinite Thread of Stamina
    210982, --Thread of Power
    219256, --Temporal Thread of Power
    219265, --Perpetual Thread of Power
    219274, --Infinite Thread of Power  
    226145, --Minor Spool of Eternal Thread
    226144, --Lesser Spool of Eternal Thread
    226143, --Spool of Eternal Thread
    226142 --Greater Spool of Eternal Thread
}

--Color categories
local colorPrefix = "|cff1DDB7F"
local resetColor = "|r"

--We make sure that category names and content are always up to date.
local CategoriesToUpdate = {
    "Remix",
    "Meta Gems",
    "Cogwheel Gems",
    "Tinker Gems",
    "Prismatic Gems",
    "Enhancements",
    "Utilities",
    "Consumables",
    L("Remix"),
    L("Meta Gems"),
    L("Cogwheel Gems"),
    L("Tinker Gems"),
    L("Prismatic Gems"),
    L("Enhancements"),
    L("Utilities"),
    L("Consumables"),
    L("Threads"),
}

for _, category in ipairs(CategoriesToUpdate) do
    categories:DeleteCategory(category)
end

--Loop
for _, ItemID in pairs(WoWRemixMoP) do
    categories:AddItemToCategory(ItemID, colorPrefix .. L("Remix") .. resetColor)
end

for _, ItemID in pairs(WoWRemixMoP_metagems) do
    categories:AddItemToCategory(ItemID, colorPrefix .. L("Meta Gems") .. resetColor)
end

for _, ItemID in pairs(WoWRemixMoP_cogwheelgems) do
    categories:AddItemToCategory(ItemID, colorPrefix .. L("Cogwheel Gems") .. resetColor)
end

for _, ItemID in pairs(WoWRemixMoP_tinkergems) do
    categories:AddItemToCategory(ItemID, colorPrefix .. L("Tinker Gems") .. resetColor)
end

for _, ItemID in pairs(WoWRemixMoP_prismaticgems) do
    categories:AddItemToCategory(ItemID, colorPrefix .. L("Prismatic Gems") .. resetColor)
end

for _, ItemID in pairs(WoWRemixMoP_Buff) do
    categories:AddItemToCategory(ItemID, colorPrefix .. L("Enhancements") .. resetColor)
end

for _, ItemID in pairs(WoWRemixMoP_Utility) do
    categories:AddItemToCategory(ItemID, colorPrefix .. L("Utilities") .. resetColor)
end

for _, ItemID in pairs(WoWRemixMoP_Consumable) do
    categories:AddItemToCategory(ItemID, colorPrefix .. L("Consumables") .. resetColor)
end

for _, ItemID in pairs(WoWRemixMoP_Threads) do
    categories:AddItemToCategory(ItemID, colorPrefix .. L("Threads") .. resetColor)
end

--Check if both BetterBags_RemixMoP and BetterBags_WorldEvents are enabled
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

frame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" or event == "PLAYER_ENTERING_WORLD" then
        if IsAddOnLoaded("BetterBags_RemixMoP") and IsAddOnLoaded("BetterBags_WorldEvents") then
            StaticPopup_Show("BETTERBAGS_INCOMPATIBLE_WARNING")
        end
    end
end)

StaticPopupDialogs["BETTERBAGS_INCOMPATIBLE_WARNING"] = {
    text = L("Addon alert"),
    button1 = "OK",
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
}
