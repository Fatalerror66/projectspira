-----------------------------------
-------------   GLOBAL SETTINGS   -------------
-----------------------------------

--This is to allow server operators to further customize their servers.  As more features are added to pXI, the list will surely expand.  Anything scripted can be customized with proper script editing.

--PLEASE REQUIRE THIS SCRIPT IN ANY SCRIPTS YOU DO: ADD THIS LINE TO THE TOP!!!!
--    require("scripts/globals/settings");
--With this script added to yours, you can pull variables from it!!

--Always include status.lua, which defines mods
require("scripts/globals/status");

--See chocoprice.lua to adjust chocobo stables.
require("scripts/globals/chocoprice");

INITIAL_LEVEL_CAP = 75; --The initial level cap for new players.  There seems to be a hardcap of 255.
START_GIL = 10; --Amount of gil given to newly created characters.
START_INVENTORY = 50; --Amount of EXTRA slots beyond 30 to be given to a character.  Do not set above 50!
OPENING_CUTSCENE_DISABLE = 1; --Set to 1 to disable opening cutscenes.
SUBJOB_QUEST_LEVEL = 18; --Minimum level to accept either subjob quest.  Set to 0 to start the game with subjobs unlocked.
ADVANCED_JOB_LEVEL = 30; --Minimum level to accept advanced job quests.  Set to 0 to start the game with advanced jobs.

SHOP_PRICE = 1.000; --Multiplies prices in NPC shops.
GIL_RATE = 1.000; --Multiplies gil earned from quests.  Won't always display in game.
SAN_FAME = 1.000; --Multiplies fame earned from San d'Oria quests.
BAS_FAME = 1.000; --Multiplies fame earned from Bastok quests.
WIN_FAME = 1.000; --Multiplies fame earned from Windurst quests.
NORG_FAME = 1.000; --Multiplies fame earned from Norg and Tenshodo quests.

FISHING_GUILD_POINTS = 1.000; --Multiplies guild points earned from fishermans' guild trades.
WOODWORKING_GUILD_POINTS = 1.000; --Multiplies guild points earned from carpenters' guild trades.
SMITHING_GUILD_POINTS = 1.000; --Multiplies guild points earned from blacksmiths' guild trades.
GOLDSMITHING_GUILD_POINTS = 1.000; --Multiplies guild points earned from goldsmiths' guild trades.
CLOTHCRAFT_GUILD_POINTS = 1.000; --Multiplies guild points earned from weavers' guild trades.
LEATHERCRAFT_GUILD_POINTS = 1.000; --Multiplies guild points earned from tanners' guild trades.
BONECRAFT_GUILD_POINTS = 1.000; --Multiplies guild points earned from boneworkers' guild trades.
ALCHEMY_GUILD_POINTS = 1.000; --Multiplies guild points earned from alchemists' guild trades.
COOKING_GUILD_POINTS = 1.000; --Multiplies guild points earned from culinarians' guild trades.
MAX_CRAFT_ABOVE_60 = 3200; -- Set to maximum amount of 0.1 skill above level 60 for any craft aside from fishing.  Default 400 = 40.0 levels.  Set to 3200 to allow all 8 crafts to reach 100.
DISABLE_GUILD_CONTRACTS = 1; --Set to 1 to disable guild contracts, allowing players to accumulate guild points from all guilds at once.

CURE_POWER = 1.000; --Multiplies amount healed from Healing Magic, including the relevant Blue Magic.
SPELL_POWER = 1.000; --Multiplies damage dealt by Elemental  and Divine Magic.
BLUE_POWER = 1.000; --Multiplies damage dealt by most Blue Magic.
DRAIN_POWER = 1.000; --Multiplies amount drained by Drain, Aspir, and relevant Blue Magic spells.
ITEM_POWER = 1.000; --Multiplies the effect of items such as Potions and Ethers.
WEAPON_SKILL_POWER = 1.000; -- Multiplies damage dealt by Weapon Skills.
WEAPON_SKILL_POINTS = 1.000; --Multiplies points earned during weapon unlocking.

HARVESTING_BREAK_CHANCE = 0.33; --% chance for the sickle to break during harvesting.  Set between 0 and 1.
EXCAVATION_BREAK_CHANCE = 0.33; --% chance for the pickaxe to break during excavation.  Set between 0 and 1.
LOGGING_BREAK_CHANCE = 0.33; --% chance for the hatchet to break during logging.  Set between 0 and 1.
MINING_BREAK_CHANCE = 0.33; --% chance for the pickaxe to break during mining.  Set between 0 and 1.
HARVESTING_RATE = 0.50; --% chance to recieve an item from haresting.  Set between 0 and 1.
EXCAVATION_RATE = 0.50; --% chance to recieve an item from excavation.  Set between 0 and 1.
LOGGING_RATE = 0.50; --% chance to recieve an item from logging.  Set between 0 and 1.
MINING_RATE = 0.50; --% chance to recieve an item from mining.  Set between 0 and 1.

-- SE implemented coffer/chest illusion time in order to prevent coffer farming. No-one in the same area can open a chest or coffer for loot (gil, gems & items)
-- till a random time between MIN_ILLSION_TIME and MAX_ILLUSION_TIME. During this time players can loot keyitem and item related to quests (AF, maps... etc.)

COFFER_MAX_ILLUSION_TIME = 3600; -- 1 hour
COFFER_MIN_ILLUSION_TIME = 1800; -- 30 minutes
CHEST_MAX_ILLUSION_TIME = 3600;  -- 1 hour
CHEST_MIN_ILLUSION_TIME = 1800;  -- 30 minutes

TIMELESS_HOURGLASS_COST = 500000;      -- cost of the timeless hourglass for Dynamis.
RELIC_1ST_UPGRADE_WAIT_TIME = 100    -- wait time for 1st relic upgrade (stage 1 -> stage 2) in seconds. 86400s = 1 RL day.
RELIC_2ND_UPGRADE_WAIT_TIME = 100    -- wait time for 2nd relic upgrade (stage 2 -> stage 3) in seconds. 604800s = 1 RL week.
RELIC_3RD_UPGRADE_WAIT_TIME = 100    -- wait time for 3rd relic upgrade (stage 3 -> stage 4) in seconds. 295200s = 82 hours.

ALL_MAPS = 1; --Set to 1 to give starting characters all the maps.
JINX_MODE_2005 = 0; --Set to 1 to give starting characters swimsuits from 2005.
JINX_MODE_2008 = 0; --Set to 1 to give starting characters swimsuits from 2008.
SUMMERFEST = 0; --Set to 1 to give starting characters Far East dress.
CHRISTMAS = 0; --Set to 1 to give starting characters Christmas dress.
HALLOWEEN = 0; --Set to 1 to give starting characters Halloween dress.

--QUEST/MISSION SPECIFIC SETTINGS
AF1_QUEST_LEVEL = 40; -- Minimum level to start AF1 quest
AF2_QUEST_LEVEL = 50; -- Minimum level to start AF2 quest
AF1_FAME = 20; -- base fame for completing an AF1 quest
AF2_FAME = 40; -- base fame for completing an AF2 quest
AF3_FAME = 60; -- base fame for completing an AF3 quest
DEBUG_MODE = 1; -- Set to 1 to activate auto-warping to the next location (only supported by certain missions / quests).
QM_RESET_TIME = 300; -- Default time (in seconds) you have from killing ???-pop mission NMs to click again and get key item, until ??? resets.

--FIELDS OF VALOR SETTINGS (these are not in effect yet but are preliminary)
REGIME_WAIT = 0; --Set to 1 to make people wait till 00:00 game time as in retail. If it's 0, there is no wait time.
LOW_LEVEL_REGIME = 1; --Set to 1 to allow people to kill regime targets even if they give no exp, allowing people to farm regime targets at 75 in low level areas.

--JOB SPECIFIC SETTINGS
SCAVENGE_RATE = 0.1; --The chance of obtaining an item when you use the Ranger job ability Scavenge.  Do not set above 1!

--SPELL SPECIFIC SETTINGS
MILK_OVERWRITE = 1;	--Set to 1 to allow Milk and Regen to overwrite each other.  Default is 1.
JUICE_OVERWRITE = 1; --Set to 1 to allow Juice and Refresh to overwrite each other.  Default is 1.
DIA_OVERWRITE = 1; --Set to 1 to allow Bio to overwrite same tier Dia.  Default is 1.
BIO_OVERWRITE = 0; --Set to 1 to allow Dia to overwrite same tier Bio.  Default is 0.
BARELEMENT_OVERWRITE = 1; --Set to 1 to allow Barelement spells to overwrite each other (prevent stacking).  Defualt is 1.
BARSTATUS_OVERWRITE = 1; --Set to 1 to allow Barstatus spells to overwrite each other (prevent stacking).  Defualt is 1.
BARD_SONG_LIMIT = 1; --Maximum amount of songs from a single Bard that can be granted to a single target at once.  Set between 1 and 31.
BARD_INSTRUMENT_LIMIT = 2; --Maximum amount of songs from a single Bard with an instrument that can be granted to a single target at once.  Set between 2 and 32.

--JOB ABILITY/TRAIT SPECIFIC SETTINGS
STATUS_RESIST_MULTIPLIER = 10; -- Sets the strength of status resist traits. 

--MISC
HOMEPOINT_HEAL = 0; --Set to 1 if you want Home Points to heal you like in single-player Final Fantasy games.
RIVERNE_PORTERS = 120; -- Time in seconds that Unstable Displacements in Cape Riverne stay open after trading a scale.