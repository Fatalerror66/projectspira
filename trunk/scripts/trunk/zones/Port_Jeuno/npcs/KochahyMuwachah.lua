-----------------------------------
--	Author: Tenjou, ReaperX
-- 	DUCAL GUARD: Kochahy-Muwachahy
-- 	Gives signet and sells conquest points.
--  These guards work like gate guards with guardnation = player's nation.
-----------------------------------
require("scripts/globals/rankpoints");
require("scripts/globals/settings");
require("scripts/globals/Utils");
package.loaded["scripts/globals/conquest"] = nil;
require("scripts/globals/conquest");
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
require("scripts/zones/Port_Jeuno/TextIDs");

eventid = 0x7ffb;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
event = Event(eventid);
event:setParams(getArg1(player:getNation(), player),0,conquest_ranking(),0,0,getArg6(player),getCP(player),0);
player:startEvent(event);
end; 
 
function onEventSelection(player,csid,option)
if (option >= 32768) then	
	item = getCPItem(player:getNation(), option)
	param1 = canEquip(player, item);
	if (getItemPrice(player:getNation(), player, option) > getCP(player)) then -- guardnation = player nation.
		param2 = 1; -- you don't have enough conquest points to buy the item.
	else
		param2 = 0;
	end;
	player:updateEvent(param1,param2,item);
end;
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if (player:getRank() >=2) then -- can only trade crystals if rank at least 2.
    weighted_sum = traded_crystals(trade,1);  
    if (weighted_sum > 0) then
      if (player:getRankPoints() >= 4095) then
        player:showText(npc,CONQUEST+43);
      else
        trade:isComplete();
        rank_points = add_crystals_to_rank_points(player, weighted_sum)
        if (player:getRankPoints() >= 4095) then
          player:showText(npc,CONQUEST+44); -- rank points are full now
        else
          player:showText(npc,CONQUEST+45);
        end;
      end;
    end;
end
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
		player:addStatusEffect(EFFECT_SIGNET,player:getNation(),0,3600*(rank[player:getNation()]+player:getRank()));
		player:specialMessage(CONQUEST + 1); -- "You've received your nation's Signet. You are now taking part in your nation's conquest campaign!"
	elseif (option >= 32768) and (option <= 33000) then -- player bought item.
		item = getCPItem(player:getNation(), option)
		if (player:getFreeSlotCount(0) > 0) then
			player:addItem(item);
			player:specialMessage(ITEM_OBTAINED, item);
			add_CP(player, -getItemPrice(player:getNation(), player, option));
		else
			player:specialMessage(ITEM_CANNOT_BE_OBTAINED,item);
		end;
	end
end;
end;