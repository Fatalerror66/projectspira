-----------------------------------
--	Author: ReaperX
-- 	Stone Picture Frame
--  to open door to Den of Rancor using Painbrush of Souls
--  Quest "A Question of Taste" (pops NM Trompe L'Oeil )

--  to be fixed: 
--  1. the default message for the two empty frames (when you click on them 
--  w/o having paintbrush of souls or "final fantasy" key item is "There is 
--  a blank canvas in this frame. The {} begins to twitch." The second part 
--  makes no sense but I could find no text or event that just says there's 
--  a blank canvas. 
--  2. Script only checks for time elapsed (30 seconds). I think that on retail, 
--  painting also fails when you have buffs cast on you.
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/zones/Temple_of_Uggalepih/Zone");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (npcid == 17428925) then
	if (player:hasKeyItem(0x110) == 1) then -- player has paintbrush of souls
		player:specialMessage(899,0x110);
		event = Event(0x3C);
		event:setParams(0x110);
		player:setVar("started_painting",os.time());
		player:startEvent(event);
	else
		player:specialMessage(899);
	end
elseif (npcid == 17428926) then
	if (player:hasKeyItem(0xD6) == 1) then -- "Final Fantasy" key item
		event = Event(0x32);
		event:setParams(0xD6);
		player:startEvent(event);
	else
		player:specialMessage(899);
	end
elseif (npcid == 17428927) then
	player:specialMessage(895);
elseif (npcid == 17428928) then
	player:specialMessage(896);
elseif (npcid == 17428929) then
	player:specialMessage(897);
elseif (npcid == 17428930) then
	player:specialMessage(898);
end
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
if (csid == 0x32) then
	-- crashed server when I tested it
	--loc = Zone(0x9F);
	--loc:spawnMob("TrompeL_Oeil",-64.7,0,-13.5,player:getId());
	player:removeKeyItem(0xD6);
	player:addKeyItem(0xD7); -- ripped painting
elseif (csid == 0x3C) then
	time_elapsed = os.time()-player:getVar("started_painting");
	--print("Paint time: ",time_elapsed," seconds");
	if (time_elapsed >= 30) then
		player:specialMessage(906);
		npc = getNPCById(17428924,0x9F) -- door to Den of Rancor
		npc:setState(20);               -- open it for 20 seconds (idk the exact time but this seems reasonable)
	else
		player:specialMessage(905);
    end
end
end;