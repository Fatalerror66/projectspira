-----------------------------------
--	Author: ReaperX
-- 	Door: Windurstian Ambassador
-- 	Windurst Missions 3.3 "A New Journey" and 4.1 "Magicite"

-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Rulude_Gardens/TextIDs"] = nil;
require("scripts/zones/Rulude_Gardens/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

mission_status =  player:getVar("mission_status");

if (player:getMissionStatus(2,12) == 1) and (mission_status == 4) then
	player:startEvent(Event(0x28)); -- final CS for "A New Journey"
elseif (player:hasKeyItem(LetterToTheAmbassador) == 1) then
	player:specialMessage(EMBASSY+2) -- The consulate is away.
elseif (player:getRank() == 4) and (mission_status == 0) and has_rank_points_for_mission(player, 13) then
	event = Event(0x83);  -- for "Magicite"
	if (player:hasKeyItem(ArchducalAudiencePermit) == 1) then
		event:setParams(1);
	end;
	player:startEvent(event); 
elseif (player:getRank()>=4) then
	player:specialMessage(EMBASSY) -- restricted area
else
	player:specialMessage(EMBASSY+1) -- you have no letter of introduction
end
end; 
   
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x028) then
	player:removeKeyItem(LetterToTheAmbassador);
	player:completeMission(2,12);
	player:setVar("mission_status",0);
	player:addGil(GIL_RATE*5000)
	player:specialMessage(GIL_OBTAINED,GIL_RATE*5000); 
	player:rankUp();
elseif (csid == 0x083) then
	player:setVar("mission_status",1);
	if (player:hasKeyItem(ArchducalAudiencePermit) == 0) then
	  player:specialMessage(KEYITEM_OBTAINED,ArchducalAudiencePermit);
	  player:addKeyItem(ArchducalAudiencePermit);
	end;
end
end;