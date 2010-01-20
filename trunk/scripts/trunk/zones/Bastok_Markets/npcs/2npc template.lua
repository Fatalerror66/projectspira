
-----------------------------------
-- Area: Northern San d'Oria
--  NPC: 
-- 
-- By: Mana
-----------------------------------
-- Define Locals
-----------------------------------
-- Includes



-----------------------------------
-- OnTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)
 
    -- Get all trade items from the stack
    for i=3,table.getn(arg) do
          --print(i,arg[i])
    end
-- Variables
char = (player:getId());
lvl = (player:getMainLvl());
zone = (player:getZone());
rankp = (getRankPoints(char));
rank = (player:getRank());
sfame = (player:getFame(0));
nation = (player:getNation());
gil = (player:getCurrGil());
charname = (player:getName());
npc = (npc:getName());
--print("trading");

end;
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
 
function onTrigger(player,npc)
-- Variables
char = (player:getId());
lvl = (player:getMainLvl());
zone = (player:getZone());
rankp = (getRankPoints(char));
rank = (player:getRank());
sfame = (player:getFame(0));
nation = (player:getNation());
gil = (player:getCurrGil());
charname = (player:getName());
npc = (npc:getName());
--print("NPC ID: ",npc);

end;
 
 
-----------------------------------
-- More to come...
-----------------------------------

