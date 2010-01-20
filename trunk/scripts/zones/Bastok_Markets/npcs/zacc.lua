-----------------------------------
--	Author: ChrisKara10,Almendro
-- 	Zacc
-- 	"Wish Upon a Star" Quest
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
bflvl = player:getFameLevel(1);
WishUponaStar = player:getQuestStatus(1,64);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(bflvl >= 6 and player:getVar("wishUponAStar") == 0)then
	player:startEvent(Event(0x149));
	player:setVar("wishUponAStar",1);
elseif (player:getVar("wishUponAStar") == 2) then
	player:startEvent(Event(0x14B));
elseif(WishUponaStar == 2)then
	player:startEvent(Event(0x150));
else
	-- Default chat text
	player:startEvent(Event(0x148));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 