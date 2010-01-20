-----------------------------------
--	Author: Almendro
-- 	Kurando
-- 	"Fear of Flying"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------
-- Initialization
SilkwormEgg = 0x11AE; -- 4526
BlackSilkNeckerchief = 0x3339; -- 13113
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
FearofFlying = player:getQuestStatus(1,35);
bflvl = player:getFameLevel(1);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(bflvl >= 3 and FearofFlying == 0)then
	player:startEvent(Event(0xAA));
	player:addQuest(1,35);
elseif(FearofFlying == 2)then
	rand = math.random();
	if(rand <= 0.5)then
		player:startEvent(Event(0xAC));
	else
		player:startEvent(Event(0xAD));
	end
else
	player:startEvent(Event(0x1C));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
FearofFlying = player:getQuestStatus(1,35);
SilkwormEgg1 = trade:hasItemQty(SilkwormEgg,1);
       count = trade:getItemCount();
         gil = trade:getGil();
if(FearofFlying == 1 and SilkwormEgg1 and count == 1 and gil == 0)then
	trade:isComplete();
	player:startEvent(Event(0xAB));
end 
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0xAB)then
	player:completeQuest(1,35);
	player:addFame(1,BAS_FAME*230);
	player:addItem(BlackSilkNeckerchief);
	player:specialMessage(ITEM_OBTAINED,BlackSilkNeckerchief);
	player:setTitle(97); -- Airship Denouncer
end
end;