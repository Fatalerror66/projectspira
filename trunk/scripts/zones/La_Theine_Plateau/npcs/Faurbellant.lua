
-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Secodiand
-- Quest NPC
-- By: Mana
-----------------------------------
-- Events
-----------------------------------
-- TEXT ONLY
-- 953-956
-----------------------------------
-- Includes
-----------------------------------
-- OnTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)
 
    -- Get all trade items from the stack
    for i=1,table.getn(arg) do
          --print(i,arg[i])
    end
npc = arg[1];
player = arg[2];
---EIGHT TRADE SLOTS--
item1,quantity1 = player:getItemInfo(arg[3]);
item2,quantity2 = player:getItemInfo(arg[5]);
item3,quantity3 = player:getItemInfo(arg[7]);
item4,quantity4 = player:getItemInfo(arg[9]);
item5,quantity5 = player:getItemInfo(arg[11]);
item6,quantity6 = player:getItemInfo(arg[13]);
item7,quantity7 = player:getItemInfo(arg[15]);
item8,quantity8 = player:getItemInfo(arg[17]);
if arg[3] == 0 then
giltraded = arg[4]
else
giltraded = 0
end;
-- Variables

end;
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
 
function onTrigger(player,npc)
-- Variables
sfame = (player:getFame(0));
gatesToParadise = player:getVar("gatesToParadise")
charname = (player:getName());


if (player:hasKeyItem(0x97)) == 1 then
player:removeKeyItem(0x97)
player:addKeyItem(0x96)
player:setVar("gatesToParadise",2)
player:showText(npc,954)
elseif gatesToParadise == 0 then
player:showText(npc,953)
elseif gatesToParadise == 2 then
player:showText(npc,955)
elseif gatesToParadise == 3 then
player:showText(npc,956)
else
sendTellMsg("<pXI>Server",charname ,"undefined params")
end

end;
 
 
-----------------------------------
-- More to come...
-----------------------------------

