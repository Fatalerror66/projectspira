-----------------------------------
--	Author: Tenjou
-- 	Tokaka
-- 	Starts and ends quest "Something Fishy",a popular quest used to easily raise Windurst fame.
--	In the actual game you must rezone between trades,however I personally disagree with that rule and am circumventing it.
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local fishy = player:getVar("somethingFishy");
--print("fishy: ",fishy);
if (fishy == 0) then
	player:startEvent(Event(0xcf));
	player:setVar("somethingFishy",1);
elseif (fishy == 1) then
	--Start quest "Something Fishy"
	local event0xd0 = Event(0xd0);
	event0xd0:setParams(0,0x1108);
	player:startEvent(event0xd0);
	player:setVar("somethingFishy",2);
	player:addQuest(2,52);
elseif (fishy == 2) then
	local event0xd1 = Event(0xd1);
	event0xd1:setParams(0,0x1108);
	player:startEvent(event0xd1);
elseif (fishy == 3) then
	player:startEvent(Event(0xd3));
	--She should not allow you to trade again until the player rezones; I am not doing extra work to add an inconvenience.  In this case she will allow it after you talk to her once after the last trade.
	player:setVar("somethingFishy",2);
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local fishy = player:getVar("somethingFishy");
--trade Bastore Sardine--
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x1108,1);
if (fishy == 2 and count == 1 and item1 == true) then
	local event0xd2 = Event(0xd2);
	event0xd2:setParams(70,0x1108);
	player:startEvent(event0xd2);
	player:setVar("somethingFishy",3);
	player:removeItem(0x1108,1);
	--Give reward and fame
	player:addGil(GIL_RATE*70);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*70);
	player:addFame(2,WIN_FAME*10);
	--print("Windurst fame adjusted for",player:getName(),"by 10 (Total:",player:getFame(2),").");
	player:completeQuest(2,52);
end
end; 
 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;