-----------------------------------
--	Author: Almendro & Arcanedemon
-- 	Talib
-- 	Quest: The Beauty and the Galka
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
BeautyandtheGalka = player:getQuestStatus(1,1);
ShadyBusiness  = player:getQuestStatus(1,8);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(BeautyandtheGalka == 0 and player:getVar("BeautyandtheGalka") == 0 ) then
	player:startEvent(Event(0x2));
elseif(BeautyandtheGalka == 1)then 
	player:startEvent(Event(0x4));
elseif(BeautyandtheGalka == 2)then
	player:startEvent(Event(0x5A));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
BeautyandtheGalka = player:getVar("BeautyAndTheGalka");
bg = player:getQuestStatus(1,1);
ZincOre = 0x282; -- 642
ZincOre1 = trade:hasItemQty(ZincOre,1);
ZincOre4 = trade:hasItemQty(ZincOre,4);
count = trade:getItemCount();
  gil = trade:getGil(); 
if ( (BeautyandtheGalka == 1 or BeautyandtheGalka == 2) and count == 1 and ZincOre1 and gil == 0) then
	trade:isComplete();
	player:startEvent(Event(0x3));
elseif(bg == 2 and count == 4 and ZincOre4 and gil == 0 )then
	trade:isComplete();
	player:startEvent(Event(0x5B));
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("option: ",option);
if( csid == 0x2 ) then
	if ( option == 0 ) then
	-- Acepted
		player:addQuest(1,1);
		player:setVar("BeautyandtheGalka",1);
    else
	-- Rejected
		player:setVar("BeautyandtheGalka",-1);
	end
elseif( csid == 0x3 )then
	player:addKeyItem(0x2);   -- Palborough Mines Logs
	player:specialMessage(23,0x2);
	player:setVar("BeautyandtheGalka",2);
elseif( csid== 0x5A )then
	ShadyBusiness  = player:getQuestStatus(1,8);
	if(ShadyBusiness == 0)then
		player:addQuest(1,8);
	end	
elseif( csid== 0x5B )then
	ShadyBusiness  = player:getQuestStatus(1,8);
	if(ShadyBusiness == 1)then
		player:completeQuest(1,8);
		player:addFame(3,NORG_FAME*72); -- This fame is very accurate
	else
		player:addFame(3,NORG_FAME*32);
	end
	--print("Norg fame: ",player:getFameLevel(3));
end
end;