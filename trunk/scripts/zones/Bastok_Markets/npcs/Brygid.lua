-----------------------------------
--	Author: Almendro
-- 	Brygid
--	Involved in Quests: "Brygid the Stylist & Brygid the Stylist Return" 
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- Initialization
BronzeSubligar = 0x3220;
Robe = 0x3138;
Gloves = 0x31B0;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
BrygidtheStylist = player:getQuestStatus(1,44);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(BrygidtheStylist == 0)then
	player:startEvent(Event(0x136));
	player:addQuest(1,44);
elseif(BrygidtheStylist == 1 and player:getEquip(8) == BronzeSubligar and player:getEquip(6) == Robe)then
	player:startEvent(Event(0x137));
else
	player:startEvent(Event(0x77));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x137)then
	player:completeQuest(1,44);
	player:addItem(Gloves);
	player:specialMessage(ITEM_OBTAINED,Gloves);
	player:addFame(1,BAS_FAME*40);
	player:setTitle(103); -- Brygid-approved 
end
end;