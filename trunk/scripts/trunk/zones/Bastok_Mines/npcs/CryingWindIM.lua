require("scripts/globals/settings");
package.loaded["scripts/globals/conquest"] = nil;
require("scripts/globals/conquest");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

eventid = 0x7ff9;
guardnation = BASTOK;

-----------------------------------
-- Author: ReaperX/Tenjou/psyclosis
-- Crywing Wind IM
--argument 1: NATION: 01 is sandy,11 is Bastok and 21 is windy,31 and 41,etc automatically give you signet,other numbers with a different ones digit acts like other nation's outpost guards
-- the 3rd and 4th hex digit controls signet services, see conquest.lua.
--argument 2: expeditionary force bitmask
--argument 3: expeditionary force options: greater than a0 = you only need 5 members,greater than f0 = you only need 4,otherwise you still need 6.  less than a0 seems to be the status of the nation's control in the area
--- The lowest six bits encode the Nation's conquest standing, see conquest.lua. 
--argument 4: supply quests bitmask: the first bit controls if you can do a quest,the rest control 4 of the options including blank options
--argument 5: supply quests bitmask: indicates which ones you have already done. Same bit assignments.
--argument 6: controls what services he will offer (see conquest.lua)
--argument 7: conquest points
--argument 8: greater than c00 means you completed an expedition successfully,otherwise you get the normal services
----------------------------------- 
-- onTrigger Action 
----------------------------------- 

function onTrigger(player,npc) 

if (player:getVar("supply_quest_started") > 0) and (player:getNation()==guardnation) and (supplies_fresh(player) == 0) then
	player:showText(npc, CONQUEST + 40); -- "We will dispose of those unusable supplies."
	region = player:getVar("supply_quest_region");
	player:removeKeyItem(supplies[region]);
	player:specialMessage(KEYITEM_OBTAINED+1, supplies[region]);
	player:setVar("supply_quest_started",0);
else
	event = Event(eventid);
	event:setParams(getArg1(guardnation, player),0,conquest_ranking(),getControlBitmask(guardnation),player:getVar("SUPPLY_QUESTS_BAS"),getArg6(player),getCP(player),0);
	player:startEvent(event);
end;
end; 

function onEventSelection(player,csid,option)
if (option >= 32768) then	
	item = getCPItem(guardnation, option)
	param1 = canEquip(player, item);
	if (getItemPrice(guardnation, player, option) > getCP(player)) then -- guardnation = player nation.
		param2 = 1; -- you don't have enough conquest points to buy the item.
	else
		param2 = 0;
	end;
	player:updateEvent(param1,param2,item);
end;
end;

function onTrade(player,npc,trade)
perform_conquest_trades(player, npc, guardnation, trade, CONQUEST);
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == eventid) then 
	if (option == 1) then  --Grant Signet.
		player:removeStatusType(EFFECT_SIGNET);
		player:addStatusEffect(EFFECT_SIGNET,player:getNation(),0,3600*(rank[guardnation]+player:getRank()));
		player:specialMessage(CONQUEST + 1); -- "You've received your nation's Signet. You are now taking part in your nation's conquest campaign!"
	elseif (option >= 32768) and (option <= 33000) then -- player bought item.
		item = getCPItem(guardnation, option)
		if (player:getFreeSlotCount(0) > 0) then
			player:addItem(item);
			player:specialMessage(ITEM_OBTAINED, item);
			add_CP(player, -getItemPrice(guardnation, player, option));
		else
			player:specialMessage(ITEM_CANNOT_BE_OBTAINED,item);
		end;
	elseif (option >= 65536) and (option <= 65560) then -- player chose supply quest.
		region = option-65536;
		player:addKeyItem(supplies[region]);
		player:specialMessage(KEYITEM_OBTAINED,supplies[region]);
		player:setVar("supply_quest_started",os.time());
		player:setVar("supply_quest_region",region);
	end
end;
end;