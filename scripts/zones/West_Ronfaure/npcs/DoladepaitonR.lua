require("scripts/globals/settings");
package.loaded["scripts/globals/conquest"] = nil;
require("scripts/globals/conquest");
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
require("scripts/zones/West_Ronfaure/TextIDs");

region = RONFAURE;
guardnation = SANDORIA;
eventid = 0x87FFB;
-----------------------------------
--  Doladepaiton, R.K.
--	Author: ReaperX
-- 	San d'Orian Outpost Guard
-- 	Sets homepoint, gives signet, accepts supply quests.
-----------------------------------

--Argument 3: nation's conquest standing in the region:
-- hex digit 5 = 
--- 0-3 : minimal influence in the region
--- 4-7 : minor influence in the region
--- 8-C : major force in the region
--- D-F : dominant force in the region
-- hex digit 6 = 
--0, 1, 2, 3 : no apparent effect
--- 4, 5, 6, 7, C, D, E, F : area is overrun by beastmen
--- 8, 9, A, B : suppresses information about regional influence and just wishes good luck when giving signet.

-- Argument 5: 0 = usual services, 1 = accepts supplies.

-- Argument 6 depends: if the player is from a foreign nation (and non allied), the outpost
-- guard will only offer HP service and charge for it. Arg 6 is how much gil he will charge (see conquest.lua).
-- If the player is from the same nation or from an allied nation, argument 6 encodes the player's nationality and
-- rank in the same way it does for gate guards.


-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
event = Event(eventid);
if (player:hasKeyItem(supplies[region]) == 1) and (player:getNation()==guardnation) then
	if (supplies_fresh(player) == 1) then
		event:setParams(0x10,0,0,0,1,0,0,0xff); -- you have brought us supplies!
		player:startEvent(event);
	else
		player:showText(npc, CONQUEST - 1); -- "Hmm... These supplies you have brought us are too old to be of any use."
		player:removeKeyItem(supplies[region]);
		player:specialMessage(KEYITEM_OBTAINED+1, supplies[region]);
		player:setVar("supply_quest_started",0);
	end;
else
	arg1 = getArg1(guardnation, player)-1;
	if (arg1 >= 0x0700) then -- foreign, non-allied
		event:setParams(0x710, 0, 0, 0 , 0, player:getRank(), 0,0) 
	else  -- citizen or allied
		event:setParams(arg1, 0, 0x3F0000, 0 , 0, getArg6(player), 0,0) 
	end;
	player:startEvent(event);
end;
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
--print("CSID:",csid);
--print("RESULT:",option);
if (option == 1) then -- player got signet
	player:removeStatusType(EFFECT_SIGNET);
	player:addStatusEffect(EFFECT_SIGNET,player:getNation(),0,3600*(rank[nation]+player:getRank()));
	player:specialMessage(CONQUEST + 1); -- "You've received your nation's Signet. You are now taking part in your nation's conquest campaign!"
elseif (option == 4) then  -- player setting home point
	SetHPGil = giltosetHP(guardnation,player);
	if (player:getCurrGil() >= SetHPGil) then
		player:removeGil(SetHPGil);
		player:setHomePoint();
		player:specialMessage(CONQUEST + 89); -- "Your home point has been set."
	else
		player:specialMessage(CONQUEST + 90); -- "You do not have enough gil to set your home point here."
	end
elseif (option == 2) then
	player:removeKeyItem(supplies[region]);
	add_CP(player,supply_quest_reward[region])
	player:specialMessage(CONQUEST); -- "You've earned conquest points!"
	if (hasOutpost(player, region) == 0) then
		supply_quests = player:getVar("SUPPLY_QUESTS_SAN");
		supply_quests = supply_quests + 2^region;
		player:setVar("SUPPLY_QUESTS_SAN",supply_quests);
		player:setVar("supply_quest_started",0);
	end;
end
end;