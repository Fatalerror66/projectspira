-----------------------------------
--	Author: Tenjou
-- 	Orlando
-- 	Starts and ends quest "Orlando's Antiques"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
require("scripts/zones/Mhaura/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
antique = player:getVar("orlandosAntiques");
chocobo = player:hasKeyItem(0x8a);
if (antique == 0) then
	if (chocobo == 0) then
		player:startEvent(Event(0x64));
	else
		player:startEvent(Event(0x65));
		player:setVar("orlandosAntiques",1);
	end
elseif (antique == 1) then
	player:startEvent(Event(0x67));
elseif (antique == 2) then
	player:startEvent(Event(0x6a));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
antique = player:getVar("orlandosAntiques");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x384,8);
item2 = trade:hasItemQty(0x382,8);
item3 = trade:hasItemQty(0x238,8);
item4 = trade:hasItemQty(0x4263,8);
item5 = trade:hasItemQty(0x236,8);
item6 = trade:hasItemQty(0x234,8);
item7 = trade:hasItemQty(0x290,8);
item8 = trade:hasItemQty(0x235,8);
item9 = trade:hasItemQty(0x2ee,8);
item10 = trade:hasItemQty(0x2ed,8);
item11 = trade:hasItemQty(0x2ef,8);
--print("ITEMS:",item1,item2,item3,item4,item5,item6,item7,item8);
if (antique ~=0) then
	event0x66 = Event(0x66);
	if (count == 1 and item1 == true) then
		event0x66:setParams(100);
		player:startEvent(event0x66);
		player:addGil(GIL_RATE*100);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*100);
		player:removeItem(0x384,8);
		player:addItem(0);
		player:setVar("orlandosAntiques",2);
		player:addFame(2,WIN_FAME*20);
	elseif (count == 1 and item2 == true) then
		event0x66:setParams(120);
		player:startEvent(event0x66);
		player:addGil(GIL_RATE*120);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*120);
		player:removeItem(0x382,8);
		player:addItem(0);
		player:setVar("orlandosAntiques",2);
		player:addFame(2,WIN_FAME*20);
	elseif (count == 8 and item3 == true) then
		event0x66:setParams(120);
		player:startEvent(event0x66);
		player:addGil(GIL_RATE*120);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*120);
		player:removeItem(0x238,1);
		player:addItem(0);
		player:setVar("orlandosAntiques",2);
		player:addFame(2,WIN_FAME*20);
	elseif (count == 1 and item4 == true) then
		event0x66:setParams(150);
		player:startEvent(event0x66);
		player:addGil(GIL_RATE*150);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*150);
		player:removeItem(0x4263,8);
		player:addItem(0);
		player:setVar("orlandosAntiques",2);
		player:addFame(2,WIN_FAME*20);
	elseif (count == 8 and item5 == true) then
		event0x66:setParams(200);
		player:startEvent(event0x66);
		player:addGil(GIL_RATE*200);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*200);
		player:removeItem(0x236,1);
		player:addItem(0);
		player:setVar("orlandosAntiques",2);
		player:addFame(2,WIN_FAME*20);
	elseif (count == 8 and item6 == true) then
		event0x66:setParams(200);
		player:startEvent(event0x66);
		player:addGil(GIL_RATE*200);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*200);
		player:removeItem(0x234,1);
		player:addItem(0);
		player:setVar("orlandosAntiques",2);
		player:addFame(2,WIN_FAME*20);
	elseif (count == 8 and item7 == true) then
		event0x66:setParams(250);
		player:startEvent(event0x66);
		player:addGil(GIL_RATE*250);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*250);
		player:removeItem(0x235,1);
		player:addItem(0);
		player:setVar("orlandosAntiques",2);
		player:addFame(2,WIN_FAME*20);
	elseif (count == 1 and item8 == true) then
		event0x66:setParams(600);
		player:startEvent(event0x66);
		player:addGil(GIL_RATE*600);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*600);
		player:removeItem(0x290,8);
		player:addItem(0);
		player:setVar("orlandosAntiques",2);
		player:addFame(2,WIN_FAME*20);
	elseif (count == 1 and item9 == true) then
		event0x66:setParams(750);
		player:startEvent(event0x66);
		player:addGil(GIL_RATE*750);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*750);
		player:removeItem(0x2ee,8);
		player:addItem(0);
		player:setVar("orlandosAntiques",2);
		player:addFame(2,WIN_FAME*20);
	elseif (count == 1 and item10 == true) then
		event0x66:setParams(800);
		player:startEvent(event0x66);
		player:addGil(GIL_RATE*800);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*800);
		player:removeItem(0x2ed,8);
		player:addItem(0);
		player:setVar("orlandosAntiques",2);
		player:addFame(2,WIN_FAME*20);
	elseif (count == 1 and item11 == true) then
		event0x66:setParams(900);
		player:startEvent(event0x66);
		player:addGil(GIL_RATE*900);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*900);
		player:removeItem(0x2ef,8);
		player:addItem(0);
		player:setVar("orlandosAntiques",2);
		player:addFame(2,WIN_FAME*20);
	end
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x139 and option == 1) then
	player:setVar("recyclingRods",1);
end
end;