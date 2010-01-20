-----------------------------------
--	Author: ChrisKara10,Almendro
--  Enu
--  Involved in the Quest "Wish Upon a Star"
----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- Initialization
FallenStar = 0x04A8;
CactusStems = 0x4d4;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
WishUponaStar = player:getQuestStatus(1,64);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(player:getVar("wishUponAStar") == 2 and WishUponaStar == 0)then
	player:startEvent(Event(0x14C));
	player:addQuest(1,64);
	player:setVar("wishUponAStar",3);
elseif(player:getVar("wishUponAStar") == 3 and WishUponaStar == 1 )then
	player:startEvent(Event(0x14D));
elseif(WishUponaStar == 2)then
	player:startEvent(Event(0x14F));
else
	-- Default text
	player:startEvent(Event(0x147));
end
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	count = trade:getItemCount();
	gil = trade:getGil();
	FallenStar1 = trade:hasItemQty(FallenStar,1);
	WishUponaStar = player:getQuestStatus(1,64);
	night = getVanaHour();
	
	----- Wish Upon a Star Quest Complete Trade -----
	if (FallenStar1 and WishUponaStar == 1 and player:getVar("wishUponAStar") == 3 and count == 1 and gil == 0 and (( night >= 20 and night <= 23 ) or (night >=0 and night < 4))) then 
		trade:isComplete();
		player:startEvent(Event(0x14E));
	elseif(FallenStar1 and WishUponaStar == 1 and player:getVar("wishUponAStar") == 3 and count == 1 and gil == 0 and night >= 4 and night < 20 )then
		player:startEvent(Event(0x151));
	end
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x14E)then
	player:completeQuest(1,64);
	player:addItem(CactusStems,4);
	player:specialMessage(ITEMS_OBTAINED,CactusStems,4);
	player:addFame(1,BAS_FAME*150);
	player:setVar("wishUponAStar",0); -- Deletes from server
end
end;