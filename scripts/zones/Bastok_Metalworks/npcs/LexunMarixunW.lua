-----------------------------------
--	Author: ReaperX/Tenjou/psyclosis
--  Lexun Marixun W.W
--  See other conquest overseers for explanation of the event parameters.
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/conquest"] = nil;
require("scripts/globals/conquest");
package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");

eventid = 0x7ff7;
guardnation = WINDURST;

function onTrigger(player,npc) 
	event = Event(eventid);
	event:setParams(getArg1(guardnation, player),0,conquest_ranking(),getControlBitmask(guardnation),player:getVar("SUPPLY_QUESTS_WIN"),getArg6(player),getCP(player),0);
	player:startEvent(event);
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

--- for crystal trades. Recharging exp bands is missing.
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
	end;
end;
end;