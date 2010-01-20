-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Varchet
-- By: Mana 
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------
-- OnTrade Action
-----------------------------------
function onTrade(player,npc,trade)
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(1488)
	end
-- Exit the Gambler quest
	gil = (trade:getGil());
	exitTheGambler = player:getQuestStatus(0,101)
	varchet = player:getVar("varchet")

	if gil >= 5 then
		Varchet1 = math.random(1,6)
		Varchet2 = math.random(1,6)
		VarchetT = (Varchet1 + Varchet2)
		Yourself1 = math.random(1,6)
		Yourself2 = math.random(1,6)
		YourselfT = (Yourself1 + Yourself2)
		event = Event(0x207)
		if VarchetT < YourselfT then
			player:addGil(GIL_RATE*5)
			player:specialMessage(GIL_OBTAINED,GIL_RATE*5);
			if exitTheGambler == 1 and varchet == 1 then
				event:setParams(Varchet1,Varchet2,VarchetT,Yourself1,Yourself2,YourselfT,0,1)
				player:setVar("varchet",2)
			else
				event:setParams(Varchet1,Varchet2,VarchetT,Yourself1,Yourself2,YourselfT)
			end
		elseif VarchetT == YourselfT then
			event:setParams(Varchet1,Varchet2,VarchetT,Yourself1,Yourself2,YourselfT,3)
			player:addGil(GIL_RATE*5)
			player:specialMessage(GIL_OBTAINED,GIL_RATE*5);
		elseif VarchetT > YourselfT then
			event:setParams(Varchet1,Varchet2,VarchetT,Yourself1,Yourself2,YourselfT,2)
			player:removeGil(5)
		end
		player:startEvent(event)
	end
end;
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
	varchet = player:getVar("varchet")
	exitTheGambler = player:getQuestStatus(0,101)
	if exitTheGambler == 1 and varchet <= 1 then
		player:startEvent(Event(0x27E));
		if varchet == 0 then
			player:setVar("varchet",1)
		end
	elseif exitTheGambler == 1 and varchet == 2 then
		player:showText(npc,0x402)
	elseif exitTheGambler == 2 then
		player:showText(npc,0x402)
	else
		player:startEvent(Event(0x20D));
	end
end;
